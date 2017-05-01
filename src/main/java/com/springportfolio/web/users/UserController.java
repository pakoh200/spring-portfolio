package com.springportfolio.web.users;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
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
import com.springportfolio.domain.users.User;
import com.springportfolio.naver.NaverUser;
import com.springportfolio.naver.SnsUser;
import com.springportfolio.naver.Token;
import com.springportfolio.support.Utils;

@Controller
@RequestMapping("/users")
public class UserController {
	private static final Logger log = LoggerFactory.getLogger(UserController.class);
	
	@Autowired
	private UserDAO userDao;
	
	@RequestMapping("/form")
	public String createForm(Model model){
		model.addAttribute("user", new User());
		return "users/form";
	}
	
	@RequestMapping(value="", method=RequestMethod.POST)
	public String create(@Valid User user, BindingResult bindingResult, Model model){
		log.debug("User : {}", user);
		if(bindingResult.hasErrors()){
			log.debug("Binding Result has Error!");
			List<ObjectError> errors = bindingResult.getAllErrors();
			for (ObjectError error : errors) {
				log.debug("error : {},{}", error.getCode(), error.getDefaultMessage());
			}
			return "users/form";
		}
		User dbUser = userDao.findById(user.getUserId());
		if(dbUser != null){
			model.addAttribute("errorMessage", "존재하는 아이디입니다.");
			return "users/form";
		}
		userDao.create(user);
		log.debug("databaseUser : {}", userDao.findById(user.getUserId()));
		return "redirect:/";
	}
	
	@RequestMapping("{userId}/info")
	public String updateForm(@PathVariable String userId, Model model){
		if(userId == null){
			throw new IllegalArgumentException("사용자 아이디가 필요합니다.");
		}
		User user = userDao.findById(userId);
		model.addAttribute("user", user);
		return "users/info";
	}
	
	@RequestMapping(value="", method=RequestMethod.PUT)
	public String update(@Valid User user, BindingResult bindingResult, HttpSession session, Model model){
		log.debug("User : {}", user);
		if(bindingResult.hasErrors()){
			log.debug("Binding Result has Error!");
			List<ObjectError> errors = bindingResult.getAllErrors();
			for (ObjectError error : errors) {
				log.debug("error : {},{}", error.getCode(), error.getDefaultMessage());
			}
			return "users/form";
		}
		Object temp = session.getAttribute("userId");
		if(temp == null){
			throw new NullPointerException();
		}
		String userId = (String)temp;
		if(!user.matchUserId(userId)){
			throw new NullPointerException();
		}
		
		userDao.update(user);
		log.debug("databaseUser : {}", userDao.findById(user.getUserId()));
		return "redirect:/";
	}
	
	@RequestMapping("/login/form")
	public String loginForm(Model model){
		model.addAttribute("authenticate", new Authenticate());
		return "users/login";
	}
	
	@RequestMapping("/login")
	public String login(@Valid Authenticate authenticate, BindingResult bindingResult, HttpSession session, Model model){
		if(bindingResult.hasErrors()){
			return "users/login";
		}
		User user = userDao.findById(authenticate.getUserId());
		if(user == null){
			model.addAttribute("errorMessage", "존재하지 않는 사용자입니다.");
			return "users/login";
		}
		if(!user.matchPassword(authenticate)){
			model.addAttribute("errorMessage", "비밀번호가 틀립니다.");
			return "users/login";
		}
		
		session.setAttribute("userId", user.getUserId());
		return "redirect:/";
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session){
		session.removeAttribute("userId");
		return "redirect:/";
	}
	
	@RequestMapping("{userId}/delete")
	public String delete(@PathVariable String userId, HttpSession session){
		if(userId == null){
			throw new IllegalArgumentException("사용자 아이디가 필요합니다.");
		}
		Object temp = session.getAttribute("userId");
		String sessionUserId = (String)temp;
		if(!sessionUserId.equals(userId)){
			throw new NullPointerException();
		}
		userDao.delete(userId);
		return "redirect:/users/logout";
	}
	
	@RequestMapping(value = "/naverLogin")
	public String naverLogin(HttpSession session) {
		String mydomain = "http%3A%2F%2F127.0.0.1%3A8080%2Fusers%2Fcallback";
		String clientId = "id";
		String requestUrl = "https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=" + clientId + "&redirect_uri="
				+ mydomain + "&state=";
		String state = Utils.generateState(); // 토큰을 생성합니다.
		session.setAttribute("state", state); // 세션에 토큰을 저장합니다.
		return "redirect:" + requestUrl + state; // 만들어진 URL로 인증을 요청합니다.
	}

	@RequestMapping("/callback")
	public String callback(@RequestParam String state, @RequestParam String code, HttpServletRequest request, HttpSession session) throws UnsupportedEncodingException {
		String storedState = (String) request.getSession().getAttribute("state");
		if (!state.equals(storedState)) {
			System.out.println("401 unauthorized");
			return "redirect:/";
		}
		
		String clientId = "id";
		String clientSecret = "secret";
		String mydomain = "http%3A%2F%2F127.0.0.1%3A8080%2Fusers%2Fcallback";
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
		if(dbSnsUser == null){
			int id = userDao.create(snsUser);
			snsUser.setId(id);
			userDao.createSnsUser(snsUser);
			dbSnsUser = userDao.findBySnsId(snsUser.getSnsId());
		}
		User user = userDao.findByIntId(dbSnsUser.getId());
		session.setAttribute("userId", user.getName());
		
		return "redirect:/";
	}
}
