package com.springportfolio.dao.boards;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.springportfolio.domain.boards.Board;

@Service("boardService")
public class BoardService implements BoardDAO {

	@Resource(name="boardDao")
	private MyBatisBoardDAO myBatisBoardDao;
	
	@Override
	public List<Board> select(String skey, String sval, int start, int end) {
		return myBatisBoardDao.select(skey, sval, start, end);
	}

	@Override
	public void create(Board board) {
		myBatisBoardDao.create(board);
	}

	@Override
	public Board selectOne(int num) {
		return myBatisBoardDao.selectOne(num);
	}

	@Override
	public void updateBoard(Board updateBoard) {
		myBatisBoardDao.updateBoard(updateBoard);
	}

	@Override
	public void delete(int i) {
		myBatisBoardDao.delete(i);
	}

	@Override
	public void updateCount(int i, int j) {
		myBatisBoardDao.updateCount(i, j);
	}

	@Override
	public int selectCount(String skey, String sval) {
		return 0;
	}

}
