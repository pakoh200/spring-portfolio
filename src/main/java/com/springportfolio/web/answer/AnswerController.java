package com.springportfolio.web.answer;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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

}
