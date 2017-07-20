package com.springportfolio.dao.answer;

import java.util.List;

import com.springportfolio.domain.answer.Answer;


public interface AnswerDAO {
	
	List<Answer> select();
	
	List<Answer> selectBoardId(int boardId);
	
	void create(Answer answer);
	
	Answer selectOne(int i);
	
	void update(Answer answer);
}
