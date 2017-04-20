package com.springportfolio.dao.boards;

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

import com.springportfolio.domain.boards.Board;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:/applicationContext.xml")
public class MyBatisBoardDAOTest {
	private static final Logger log = LoggerFactory.getLogger(MyBatisBoardDAOTest.class);	
	
	@Autowired
	private BoardDAO boardDao;
	
	@Test
	public void select() {
		int start = 1, end = 10;
		String skey = "title", sval = "%%";
		List<Board> list = boardDao.select(skey, sval, start, end);
		log.debug("list : {}", list);
	}
	
	@Test
	public void selectCount() {
		String skey = "title", sval = "%%";
		int total = boardDao.selectCount(skey, sval);
		log.debug("total : {}", total);
	}
	
	@Test
	public void create() throws Exception {
		Board board = new Board(2,"한글", "userId", "가나다라", new java.util.Date(), 0);
		log.debug("Board : {}", board);
		boardDao.create(board);
		
		Board actual = boardDao.selectOne(board.getNum());
		
		log.debug("dbBoard : {}", actual);
		assertThat(actual, is(board));
	}
	
	@Test
	public void update() throws Exception {
		Board board = new Board(2,"한글", "userId", "가나다라", new java.util.Date(), 0);
		boardDao.create(board);
		Board updateBoard = new Board(2,"한글", "userId", "마바사아", new java.util.Date() ,1);
		log.debug("updateBoard : {}", updateBoard);
		boardDao.updateBoard(updateBoard);
		Board updatedBoard = boardDao.selectOne(board.getNum());
		log.debug("updatedBoard : {}", updatedBoard);
		assertThat(updateBoard, is(updatedBoard));
	}
	
	@Test
	public void delete() throws Exception {
		boardDao.delete(2);
		assertNull(boardDao.selectOne(2));
	}
	
	@Test
	public void updateCount() throws Exception {
		int count = 0;
		Board board = new Board(2,"한글", "userId", "가나다라", new java.util.Date(), count);
		boardDao.create(board);
		count += 1;
		boardDao.updateCount(2,count);
		Board updateBoard = boardDao.selectOne(2);
		log.debug("db : {}", updateBoard);
	}

}
