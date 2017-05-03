package com.springportfolio.web.boards;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.springportfolio.dao.boards.BoardService;
import com.springportfolio.domain.boards.Board;
import com.springportfolio.domain.users.Authenticate;
import com.springportfolio.domain.users.User;

@Controller
@RequestMapping("/boards")
public class BoardController {
	private static final Logger log = LoggerFactory.getLogger(BoardController.class);
	
	@Resource(name="boardService")
	private BoardService boardService;
	
	@RequestMapping("/view")
	public String view(HttpServletRequest request, Model model){
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
		return "board/view";
	}
	
	@RequestMapping("{num}/detail")
	public String detail(@PathVariable int num, Model model){
		Board board = boardService.selectOne(num);
		int count = board.getCount();
		count+=1;
		boardService.updateCount(board.getNum(), count);
		model.addAttribute("board", board);
		return "board/detail";
	}
	
	@RequestMapping("/form")
	public String createForm(HttpSession session, Model model){
		Object temp = session.getAttribute("user");
		if(temp == null){
			model.addAttribute("authenticate", new Authenticate());
			model.addAttribute("errorMessage", "로그인하세요.");
			return "users/login";
		}
		model.addAttribute("board", new Board());
		return "board/form";
	}
	
	@RequestMapping("")
	public String create(@Valid Board board, BindingResult bindingResult){
		if(bindingResult.hasErrors()){
			return "board/form";
		}
		boardService.create(board);
		return "redirect:/boards/view";
	}
	
	@RequestMapping("{num}/form")
	public String updateForm(@PathVariable int num,HttpSession session, Model model){
		User sesssionedUser = (User)session.getAttribute("user");
		if(sesssionedUser == null){
			throw new IllegalArgumentException();
		}
		Board board = boardService.selectOne(num);
		if(!board.matchUserName(sesssionedUser.getName())){
			throw new IllegalArgumentException();
		}
		model.addAttribute("isUpdate", true);
		model.addAttribute("board", board);
		return "board/form";
	}
	
	@RequestMapping("{num}/update")
	public String update(@PathVariable int num, @Valid Board board, BindingResult bindingResult){
		if(bindingResult.hasErrors()){
			return "board/form";
		}
		boardService.updateBoard(board);
		return "redirect:/boards/"+num+"/detail";
	}
	
	@RequestMapping("{num}/delete")
	public String delete(@PathVariable int num, HttpSession session){
		User sesssionedUser = (User)session.getAttribute("user");
		if(sesssionedUser == null){
			throw new IllegalArgumentException();
		}
		Board board = boardService.selectOne(num);
		if(!board.matchUserName(sesssionedUser.getName())){
			throw new IllegalArgumentException();
		}
		boardService.delete(num);
		return "redirect:/boards/view";
	}
}
