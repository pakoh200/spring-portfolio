package com.springportfolio.web.answer;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.springportfolio.dao.answer.AnswerService;
import com.springportfolio.dao.boards.BoardService;
import com.springportfolio.domain.answer.Answer;
import com.springportfolio.domain.boards.Board;

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
	public void delete(@PathVariable Integer id){
		log.debug("id : {}", id);
		Answer answer = answerService.selectOne(id);
		log.debug("answer : {}", answer);
		Board board = boardService.selectOne(answer.getBoardId());
		log.debug("board : {}", board);
		int countOfAnswer = board.getCountOfAnswer();
		log.debug("countOfAnswer : {}", countOfAnswer);
		countOfAnswer -= 1;
		log.debug("countOfAnswer : {}", countOfAnswer);
		board.setCountOfAnswer(countOfAnswer);
		boardService.updateCountOfAnswer(board);
		answerService.delete(id);
	}

}
