package com.springportfolio.web.users;

import java.util.List;

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

import com.springportfolio.dao.users.UserDAO;
import com.springportfolio.domain.users.Authenticate;
import com.springportfolio.domain.users.User;

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
}
