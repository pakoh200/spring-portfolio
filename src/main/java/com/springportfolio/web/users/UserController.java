package com.springportfolio.web.users;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.social.connect.Connection;
import org.springframework.social.facebook.api.Facebook;
import org.springframework.social.facebook.api.impl.FacebookTemplate;
import org.springframework.social.facebook.connect.FacebookConnectionFactory;
import org.springframework.social.google.api.Google;
import org.springframework.social.google.api.impl.GoogleTemplate;
import org.springframework.social.google.api.plus.Person;
import org.springframework.social.google.api.plus.PlusOperations;
import org.springframework.social.google.connect.GoogleConnectionFactory;
import org.springframework.social.oauth2.AccessGrant;
import org.springframework.social.oauth2.GrantType;
import org.springframework.social.oauth2.OAuth2Operations;
import org.springframework.social.oauth2.OAuth2Parameters;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.springportfolio.dao.users.UserDAO;
import com.springportfolio.domain.users.Authenticate;
import com.springportfolio.domain.users.Sns;
import com.springportfolio.domain.users.User;
import com.springportfolio.sns.FacebookUser;
import com.springportfolio.sns.GoogleUser;
import com.springportfolio.sns.NaverUser;
import com.springportfolio.sns.SnsUser;
import com.springportfolio.sns.Token;
import com.springportfolio.support.Utils;

@Controller
@RequestMapping("/users")
public class UserController {
	private static final Logger log = LoggerFactory.getLogger(UserController.class);

	@Autowired
	private UserDAO userDao;
	
	@Resource(name="googleConnectionFactory")
	private GoogleConnectionFactory googleConnectionFactory;
	
	@Resource(name="googleOAuth2Parameters")
	private OAuth2Parameters googleOAuth2Parameters;
	
	@Resource(name="facebookConnectionFactory")
	private FacebookConnectionFactory facebookConnectionFactory;
	
	@Resource(name="facebookOAuth2Parameters")
	private OAuth2Parameters facebookOAuth2Parameters;

	@RequestMapping("/form")
	public String createForm(Model model) {
		model.addAttribute("user", new User());
		return "users/form";
	}

	@RequestMapping(value = "", method = RequestMethod.POST)
	public String create(@Valid User user, BindingResult bindingResult, Model model) {
		log.debug("User : {}", user);
		if (bindingResult.hasErrors()) {
			log.debug("Binding Result has Error!");
			List<ObjectError> errors = bindingResult.getAllErrors();
			for (ObjectError error : errors) {
				log.debug("error : {},{}", error.getCode(), error.getDefaultMessage());
			}
			return "users/form";
		}
		User emailUser = userDao.findByEmail(user.getEmail());
		if(emailUser != null){
			model.addAttribute("emailError", "이미 등록된 이메일 주소입니다.");
			return "users/login";
		}
		User dbUser = userDao.findById(user.getUserId());
		if (dbUser != null) {
			model.addAttribute("errorMessage", "존재하는 아이디입니다.");
			return "users/form";
		}
		if (user.getUserId().equals("admin")) {
			user.setAuthority("ROLE_ADMIN");
		}
		userDao.create(user);
		log.debug("databaseUser : {}", userDao.findById(user.getUserId()));
		return "redirect:/";
	}

	@RequestMapping("{id}/info")
	public String updateForm(@PathVariable Integer id, Model model) {
		log.debug("id : {}", id);
		if (id == null) {
			throw new IllegalArgumentException("사용자 아이디가 필요합니다.");
		}
		User user = userDao.findByIntId(id);
		log.debug("User : {}", user);
		if (user.getUserId() != null) {
			model.addAttribute("user", user);
			return "users/info";
		} else {
			model.addAttribute("sns", user);
			return "users/snsInfo";
		}
	}

	@RequestMapping(value = "", method = RequestMethod.PUT)
	public String update(@Valid User user, BindingResult bindingResult, HttpSession session, Model model) {
		log.debug("User : {}", user);
		if (bindingResult.hasErrors()) {
			log.debug("Binding Result has Error!");
			List<ObjectError> errors = bindingResult.getAllErrors();
			for (ObjectError error : errors) {
				log.debug("error : {},{}", error.getCode(), error.getDefaultMessage());
			}
			return "users/info";
		}
		Object temp = session.getAttribute("user");
		if (temp == null) {
			throw new NullPointerException();
		}
		User sessionedUser = (User) temp;
		if(!sessionedUser.matchId(user.getId())){
			throw new NullPointerException();
		}
		userDao.update(user);
		session.removeAttribute("user");
		session.setAttribute("user", user);
		log.debug("databaseUser : {}", userDao.findByIntId(user.getId()));
		return "redirect:/";
	}
	
	@RequestMapping(value = "updateSnsUser")
	public String updateSns(@Valid Sns sns, BindingResult bindingResult, HttpSession session, Model model) {
		log.debug("Sns : {}", sns);
		if (bindingResult.hasErrors()) {
			log.debug("Binding Result has Error!");
			List<ObjectError> errors = bindingResult.getAllErrors();
			for (ObjectError error : errors) {
				log.debug("error : {},{}", error.getCode(), error.getDefaultMessage());
			}
			return "users/snsInfo";
		}
		Object temp = session.getAttribute("user");
		if (temp == null) {
			throw new NullPointerException();
		}
		User sessionedUser = (User) temp;
		if(!sessionedUser.matchId(sns.getId())){
			throw new NullPointerException();
		}
		
		userDao.updateSnsUser(sns);
		User user = userDao.findByIntId(sns.getId());
		
		session.removeAttribute("user");
		session.setAttribute("user", user);
		log.debug("databaseUser : {}", userDao.findByIntId(sns.getId()));
		return "redirect:/";
	}

	@RequestMapping("/login/form")
	public String loginForm(Model model) {
		model.addAttribute("authenticate", new Authenticate());
		return "users/login";
	}

	@RequestMapping("/login")
	public String login(@Valid Authenticate authenticate, BindingResult bindingResult, HttpSession session, Model model) {
		if (bindingResult.hasErrors()) {
			return "users/login";
		}
		User user = userDao.findById(authenticate.getUserId());
		if (user == null) {
			model.addAttribute("errorMessage", "존재하지 않는 사용자입니다.");
			return "users/login";
		}
		if (!user.matchPassword(authenticate)) {
			model.addAttribute("errorMessage", "비밀번호가 틀립니다.");
			return "users/login";
		}
		log.debug("User : {}", user);

		session.setAttribute("user", user);
		return "redirect:/";
	}

	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("user");
		return "redirect:/";
	}

	@RequestMapping("{id}/delete")
	public String delete(@PathVariable Integer id, HttpSession session) {
		if (id == null) {
			throw new IllegalArgumentException("사용자 아이디가 필요합니다.");
		}
		Object temp = session.getAttribute("user");
		User sessionedUser = (User) temp;
		if(!sessionedUser.matchId(id)){
			throw new NullPointerException();
		}
		SnsUser dbSnsUser = userDao.findBySnsIntId(id);
		if(dbSnsUser != null){
			userDao.deleteSnsUser(id);
		}
		userDao.delete(id);
		return "redirect:/users/logout";
	}

	@RequestMapping(value = "/naverLogin")
	public String naverLogin(HttpSession session) {
		String mydomain = "http%3A%2F%2Fwww.phcworld.com%2Fusers%2Fcallback";
		//String mydomain = "http%3A%2F%2Flocalhost%3A8080%2Fusers%2Fcallback";
		String clientId = "";
		String requestUrl = "https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=" + clientId + "&redirect_uri=" + mydomain
				+ "&state=";
		String state = Utils.generateState(); // 토큰을 생성합니다.
		session.setAttribute("state", state); // 세션에 토큰을 저장합니다.
		return "redirect:" + requestUrl + state; // 만들어진 URL로 인증을 요청합니다.
	}

	@RequestMapping("/callback")
	public String callback(@RequestParam String state, @RequestParam String code, HttpServletRequest request, Model model, HttpSession session)
			throws UnsupportedEncodingException {
		String storedState = (String) request.getSession().getAttribute("state");
		if (!state.equals(storedState)) {
			return "redirect:/";
		}

		String error = request.getParameter("error");
		String errorDescription = request.getParameter("error_description");
		log.debug("error : {}, error_description : {}", error, errorDescription);

		String clientId = "";
		String clientSecret = "";
		String access_token = null;
		String refresh_token = null;
		String token_type = null;

		String accessUrl = "https://nid.naver.com/oauth2.0/token?client_id=" + clientId + "&client_secret=" + clientSecret
				+ "&grant_type=authorization_code" + "&state=" + state + "&code=" + code;

		String tokens = Utils.getJson(accessUrl, null);
		Token token = Utils.getToken(tokens);
		access_token = token.getAccess_token();
		token_type = token.getToken_type();

		String naverUserUrl = "https://openapi.naver.com/v1/nid/me";

		String naver = Utils.getJson(naverUserUrl, token_type + " " + access_token);
		NaverUser naverUser = Utils.getNaverUser(naver);
		SnsUser snsUser = new SnsUser(naverUser);
		SnsUser dbSnsUser = userDao.findBySnsId(snsUser.getSnsId());
		if (dbSnsUser == null) {
			User emailUser = userDao.findByEmail(naverUser.getEmail());
			if(emailUser != null){
				model.addAttribute("emailError", "이미 등록된 이메일 주소입니다.");
				return "users/login";
			}
			String name = snsUser.getName();
			User dbUser = userDao.findByName(name);
			while(dbUser != null){
				name += "(2)";
				dbUser = userDao.findByName(name);
			}
			snsUser.setName(name);
			int id = userDao.create(snsUser);
			log.debug("id : {}", id);
			snsUser.setId(id);
			userDao.createSnsUser(snsUser);
			dbSnsUser = userDao.findBySnsId(snsUser.getSnsId());
		}
		User user = userDao.findByIntId(dbSnsUser.getId());
		session.setAttribute("user", user);

		return "redirect:/";
	}
	
	@RequestMapping("/googleLogin")
	public String googleLogin(){
		OAuth2Operations oauthOperatioins = googleConnectionFactory.getOAuthOperations();
		String url = oauthOperatioins.buildAuthorizeUrl(GrantType.AUTHORIZATION_CODE, googleOAuth2Parameters);
		log.debug("google url : {}", url);
		return "redirect:" + url;
	}
	
	@RequestMapping("/googleCallback")
	public String googleCallback(@RequestParam String code, Model model, HttpSession session){
		OAuth2Operations oauthOperations = googleConnectionFactory.getOAuthOperations();
		AccessGrant accessGrant = oauthOperations.exchangeForAccess(code, googleOAuth2Parameters.getRedirectUri(), null);
		String accessToken = accessGrant.getAccessToken();
		Long expireTime = accessGrant.getExpireTime();
		if (expireTime != null && expireTime < System.currentTimeMillis()) {
			accessToken = accessGrant.getRefreshToken();
			log.debug("accessToken is expired. refresh token = {}", accessToken);
		}
		Connection<Google> connection = googleConnectionFactory.createConnection(accessGrant);
		Google google = connection == null ? new GoogleTemplate(accessToken) : connection.getApi();
		PlusOperations plusOperations = google.plusOperations();
		Person person = plusOperations.getGoogleProfile();
		GoogleUser googleUser = new GoogleUser(person.getId(), person.getAccountEmail(), person.getDisplayName(), person.getImageUrl());
		SnsUser snsUser = new SnsUser(googleUser);
		SnsUser dbSnsUser = userDao.findBySnsId(snsUser.getSnsId());
		if (dbSnsUser == null) {
			User emailUser = userDao.findByEmail(person.getAccountEmail());
			if(emailUser != null){
				model.addAttribute("emailError", "이미 등록된 이메일 주소입니다.");
				return "users/login";
			}
			String name = snsUser.getName();
			User dbUser = userDao.findByName(name);
			while(dbUser != null){
				name += "(2)";
				dbUser = userDao.findByName(name);
			}
			snsUser.setName(name);
			int id = userDao.create(snsUser);
			log.debug("id : {}", id);
			snsUser.setId(id);
			userDao.createSnsUser(snsUser);
			dbSnsUser = userDao.findBySnsId(snsUser.getSnsId());
		}
		User user = userDao.findByIntId(dbSnsUser.getId());
		session.setAttribute("user", user);
		
		return "redirect:/";
	}
	
	@RequestMapping("/facebookLogin")
	public String getAuthorizeUrl(){
		OAuth2Operations oauth2Operations = facebookConnectionFactory.getOAuthOperations();
		String authorizeUrl = oauth2Operations.buildAuthorizeUrl(GrantType.AUTHORIZATION_CODE, facebookOAuth2Parameters);
		log.debug("authorizeUrl : {}", authorizeUrl);
		return "redirect:" + authorizeUrl;
	}
	
	@RequestMapping("/facebookCallback")
	public String facebookCallback(@RequestParam String code, Model model, HttpSession session){
		OAuth2Operations oauthOperations = facebookConnectionFactory.getOAuthOperations();
		AccessGrant accessGrant = oauthOperations.exchangeForAccess(code, facebookOAuth2Parameters.getRedirectUri(), null);
		String accessToken = accessGrant.getAccessToken();
		Long expireTime = accessGrant.getExpireTime();
		if (expireTime != null && expireTime < System.currentTimeMillis()) {
			accessToken = accessGrant.getRefreshToken();
			log.debug("accessToken is expired. refresh token = {}", accessToken);
		}
		Connection<Facebook> connection = facebookConnectionFactory.createConnection(accessGrant);
		Facebook facebook = connection == null ? new FacebookTemplate(accessToken) : connection.getApi();
		String [] fields = { "id", "email",  "first_name", "last_name" };
		org.springframework.social.facebook.api.User facebookProfile = facebook.fetchObject("me", org.springframework.social.facebook.api.User.class, fields);
		FacebookUser facebookUser = new FacebookUser(facebookProfile.getId(), facebookProfile.getEmail(), facebookProfile.getLastName()+facebookProfile.getFirstName());
		SnsUser snsUser = new SnsUser(facebookUser);
		SnsUser dbSnsUser = userDao.findBySnsId(snsUser.getSnsId());
		if (dbSnsUser == null) {
			User emailUser = userDao.findByEmail(facebookProfile.getEmail());
			if(emailUser != null){
				model.addAttribute("emailError", "이미 등록된 이메일 주소입니다.");
				return "users/login";
			}
			String name = snsUser.getName();
			User dbUser = userDao.findByName(name);
			while(dbUser != null){
				name += "(2)";
				dbUser = userDao.findByName(name);
			}
			snsUser.setName(name);
			int id = userDao.create(snsUser);
			log.debug("id : {}", id);
			snsUser.setId(id);
			userDao.createSnsUser(snsUser);
			dbSnsUser = userDao.findBySnsId(snsUser.getSnsId());
		}
		User user = userDao.findByIntId(dbSnsUser.getId());
		session.setAttribute("user", user);
		return "redirect:/";
	}
}