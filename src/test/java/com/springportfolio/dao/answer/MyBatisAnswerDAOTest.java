package com.springportfolio.dao.answer;

import static org.hamcrest.CoreMatchers.*;
import static org.junit.Assert.*;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;
import org.springframework.transaction.annotation.Transactional;

import com.springportfolio.domain.answer.Answer;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:/applicationContext.xml")
public class MyBatisAnswerDAOTest {
	private static final Logger log = LoggerFactory.getLogger(MyBatisAnswerDAOTest.class);
	
	@Autowired
	private MyBatisAnswerDAO myBatisAnswerDao;
	
	@Test
	public void select() {
		List<Answer> list = myBatisAnswerDao.select();
		log.debug("list : {}", list);
	}
	
	@Test
	public void selectBoardId() throws Exception {
		List<Answer> listAnswer = myBatisAnswerDao.selectBoardId(1);
		log.debug("listAnswer : {}", listAnswer);
	}
	
	@Test
	public void createAnswer() throws Exception {
		Answer answer = new Answer(2,"test", "testtest", 1);
		log.debug("answer : {}", answer);
		myBatisAnswerDao.create(answer);
		int id = answer.getId();
		log.debug("id : {}", id);
		Answer actual = myBatisAnswerDao.selectOne(answer.getId());
		assertThat(actual, is(answer));
		log.debug("actual : {}", actual);
	}
	
	@Test
	public void updateAnswer() throws Exception {
		Answer answer = new Answer(3,"test","testtest234",1);
		myBatisAnswerDao.create(answer);
		Answer createdAnswer = myBatisAnswerDao.selectOne(answer.getId());
		log.debug("createdAnswer : {}", createdAnswer);
		Answer updateAnswer = new Answer(answer.getId(),"test","testtesttest3",1);
		log.debug("updateAnswer : {}", updateAnswer);
		myBatisAnswerDao.update(updateAnswer);
		Answer updatedAnswer = myBatisAnswerDao.selectOne(answer.getId());
		log.debug("updatedAnswer : {}", updatedAnswer);
		assertThat(updateAnswer, is(updatedAnswer));
	}

}
