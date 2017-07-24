package com.springportfolio.web.admin;

import java.util.List;

import javax.annotation.Resource;
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

import com.springportfolio.dao.boards.BoardService;
import com.springportfolio.dao.users.UserDAO;
import com.springportfolio.domain.boards.Board;
import com.springportfolio.domain.users.User;
import com.springportfolio.sns.SnsUser;

@Controller
@RequestMapping("/admin")
public class AdminController {
	private static final Logger log = LoggerFactory.getLogger(AdminController.class);
	
	@Autowired
	private UserDAO userDao;
	
	@Resource(name="boardService")
	private BoardService boardService;
	
	@RequestMapping("/main")
	public String main(HttpSession session){
//		User user = (User)session.getAttribute("user");
//		if(user == null || !user.matchAuthority("ROLE_ADMIN")){
//			throw new IllegalArgumentException("접근 권한이 없습니다.");
//		}
		return "admin/main";
	}
	
	@RequestMapping("/users")
	public String usersList(Model model){
		List<User> users = userDao.selectAll();
		model.addAttribute("users", users);
		return "admin/user_list";
	}
	
	@RequestMapping("{id}/delete")
	public String delete(@PathVariable Integer id, HttpSession session){
		log.debug("id : {}", id);
		User sessionedUser = (User)session.getAttribute("user");
		if(!sessionedUser.matchAuthority("ROLE_ADMIN")){
			throw new NullPointerException();
		}
		SnsUser dbSnsUser = userDao.findBySnsIntId(id);
		if(dbSnsUser != null){
			userDao.deleteSnsUser(id);
		}
		userDao.delete(id);
		return "redirect:/admin/users";
	}
	
	@RequestMapping(value="{id}/authority", method=RequestMethod.POST)
	public String updateAutority(@PathVariable Integer id, HttpServletRequest req, HttpSession session){
		User sessionedUser = (User)session.getAttribute("user");
		if(!sessionedUser.matchAuthority("ROLE_ADMIN")){
			throw new NullPointerException();
		}
		String authority = req.getParameter("authority");
		log.debug("authority : {}", authority);
		userDao.updateAuthority(authority, id);
		log.debug("User : {}", userDao.findByIntId(id));
		return "redirect:/admin/users";
	}
	
	@RequestMapping("/boards")
	public String boardsList(HttpServletRequest request, Model model){
		int start = 1, end = 10, pageSize = 10, limit = 10;
		int temp = 0, startPage = 1, endPage = 10, pageCount = 0;
		String pnum="";
		String skey = "title", sval = " ";
		String returnPage = "&skey=title&sval=p";
		
		skey = request.getParameter("skey");
		sval = request.getParameter("sval");
		
		if(skey == null || skey == ""){
			skey="title";
		}
		if(sval == null || sval == ""){
			sval = "%%";
		}
		returnPage = "&skey="+skey+"&sval="+sval;
		int pageNUM = 1;
		int total = boardService.selectCount(skey, sval);
		if(total%limit == 0){
			pageCount = total/limit;
		}else{
			pageCount = (total/limit)+1;
		}
		pnum = request.getParameter("pageNum");
		if(pnum==""||pnum==null){
			pnum="1";
		}
		pageNUM = Integer.parseInt(pnum);
		start = (pageNUM-1)*pageSize+1;
		end = pageNUM*pageSize;
		
		temp = (pageNUM-1)%pageSize;
		startPage = pageNUM-temp;
		endPage = (startPage+pageSize)-1;
		if(endPage>pageCount){
			endPage=pageCount;
		}
		
		List<Board> list = boardService.select(skey, sval, start, end);
		model.addAttribute("list", list);
		model.addAttribute("pageNUM", pageNUM);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("pageCount", pageCount);
		model.addAttribute("limit", limit);
		model.addAttribute("returnPage", returnPage);
		return "admin/board_list";
	}
	
	@RequestMapping("/delete")
	public String delete(HttpServletRequest req, HttpSession session){
		User sessionedUser = (User)session.getAttribute("user");
		if(!sessionedUser.matchAuthority("ROLE_ADMIN")){
			throw new NullPointerException();
		}
		String[] checkboxNum = req.getParameterValues("checkboxNum");
		int leng = 0;
		if(checkboxNum!=null){
			leng = checkboxNum.length;
		}
		for(int i = 0; i<leng; i++){
			boardService.delete(Integer.parseInt(checkboxNum[i]));
		}
		return "redirect:/admin/boards";
	}
}
