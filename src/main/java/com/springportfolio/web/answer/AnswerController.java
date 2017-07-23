package com.springportfolio.web.answer;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.springportfolio.dao.answer.AnswerService;
import com.springportfolio.dao.boards.BoardService;
import com.springportfolio.domain.answer.Answer;
import com.springportfolio.domain.boards.Board;
import com.springportfolio.domain.users.Authenticate;
import com.springportfolio.domain.users.User;

@RestController
@RequestMapping("/answer")
public class AnswerController {
	private static final Logger log = LoggerFactory.getLogger(AnswerController.class);
	
	@Resource(name="answerService")
	private AnswerService answerService;
	
	@Resource(name="boardService")
	private BoardService boardService;
	
	@RequestMapping(value="", produces="application/json;charset=UTF-8")
	public Answer create(Answer answer){
		answerService.create(answer);
		int answerId = answer.getId();
		Board board = boardService.selectOne(answer.getBoardId());
		int countOfAnswer = board.getCountOfAnswer();
		countOfAnswer += 1;
		board.setCountOfAnswer(countOfAnswer);
		boardService.updateCountOfAnswer(board);
		log.debug("answerId : {}", answerId);
		return answerService.selectOne(answerId);
	}
	
	@DeleteMapping("/{id}")
	public void delete(@PathVariable Integer id, HttpSession session){
		Object temp = session.getAttribute("user");
		if(temp==null){
			throw new IllegalArgumentException("로그인하세요.");
		}
		User user = (User)temp;
		Answer answer = answerService.selectOne(id);
		if(!user.matchName(answer.getWriter())){
			throw new IllegalArgumentException("자신의 글만 삭제할 수 있습니다.");
		}
		Board board = boardService.selectOne(answer.getBoardId());
		int countOfAnswer = board.getCountOfAnswer();
		countOfAnswer -= 1;
		board.setCountOfAnswer(countOfAnswer);
		boardService.updateCountOfAnswer(board);
		answerService.delete(id);
	}

}
