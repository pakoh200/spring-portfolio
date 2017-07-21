package com.springportfolio.dao.answer;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.springportfolio.domain.answer.Answer;

@Service("answerService")
public class AnswerService implements AnswerDAO {
	
	@Resource(name="answerDao")
	private MyBatisAnswerDAO myBatisAnswerDao;
	
	@Override
	public List<Answer> select() {
		return myBatisAnswerDao.select();
	}
	
	@Override
	public List<Answer> selectBoardId(int boardId) {
		return myBatisAnswerDao.selectBoardId(boardId);
	}
	
	@Override
	public void create(Answer answer) {
		myBatisAnswerDao.create(answer);
	}
	
	@Override
	public Answer selectOne(int i) {
		return myBatisAnswerDao.selectOne(i);
	}
	
	@Override
	public void update(Answer answer) {
		myBatisAnswerDao.update(answer);
	}
	
	@Override
	public void delete(int id) {
		myBatisAnswerDao.delete(id);
	}
}
