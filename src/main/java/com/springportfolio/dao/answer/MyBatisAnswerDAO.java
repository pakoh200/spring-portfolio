package com.springportfolio.dao.answer;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.springportfolio.dao.boards.MyBatisBoardDAO;
import com.springportfolio.domain.answer.Answer;

@Repository("answerDao")
public class MyBatisAnswerDAO implements AnswerDAO {
	private static final Logger log = LoggerFactory.getLogger(MyBatisBoardDAO.class);
	
	@Autowired
	private SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Override
	public List<Answer> select() {
		return sqlSession.selectList("AnswerMapper.select");	
	}
	
	@Override
	public List<Answer> selectBoardId(int boardId) {
		return sqlSession.selectList("AnswerMapper.selectBoardId", boardId);
	}
	
	@Override
	public void create(Answer answer) {
		sqlSession.insert("AnswerMapper.createAnswer", answer);
	}
	
	@Override
	public Answer selectOne(int i) {
		return sqlSession.selectOne("AnswerMapper.selectOne", i);
	}

	@Override
	public void update(Answer answer) {
		sqlSession.update("AnswerMapper.update", answer);
	}
}
