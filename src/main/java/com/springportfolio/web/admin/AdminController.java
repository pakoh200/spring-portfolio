package com.springportfolio.web.admin;

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

import com.springportfolio.dao.users.UserDAO;
import com.springportfolio.domain.users.User;

@Controller
@RequestMapping("/admin")
public class AdminController {
	private static final Logger log = LoggerFactory.getLogger(AdminController.class);
	
	@Autowired
	UserDAO userDao;
	
	@RequestMapping("/main")
	public String main(){
		return "admin/main";
	}
	
	@RequestMapping("/users")
	public String usersList(Model model){
		List<User> users = userDao.selectAll();
		model.addAttribute("users", users);
		return "admin/user_list";
	}
	
	@RequestMapping("{userId}/delete")
	public String delete(@PathVariable String userId, HttpSession session){
		String sessionUserId = (String)session.getAttribute("userId");
		User sessionedUser = userDao.findById(sessionUserId);
		if(!sessionedUser.getAuthority().equals("ROLE_ADMIN")){
			throw new NullPointerException();
		}
		userDao.delete(userId);
		return "redirect:/admin/users";
	}
	
	@RequestMapping(value="{userId}/authority", method=RequestMethod.POST)
	public String updateAutority(@PathVariable String userId, HttpServletRequest req, HttpSession session){
		String sessionUserId = (String)session.getAttribute("userId");
		User sessionedUser = userDao.findById(sessionUserId);
		if(!sessionedUser.getAuthority().equals("ROLE_ADMIN")){
			throw new NullPointerException();
		}
		String authority = req.getParameter("authority");
		userDao.updateAuthority(authority, userId);		
		return "redirect:/admin/users";
	}
	
	@RequestMapping("/boards")
	public String boardsList(){
		return "admin/board_list";
	}
}
