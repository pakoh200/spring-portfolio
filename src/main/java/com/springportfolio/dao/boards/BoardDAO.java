package com.springportfolio.dao.boards;

import java.util.List;

import com.springportfolio.domain.boards.Board;

public interface BoardDAO {

	List<Board> select(String skey, String sval, int start, int end);

	void create(Board board);

	Board selectOne(int num);

	void updateBoard(Board updateBoard);

	void delete(int i);

	void updateCount(int i, int j);
	
	int selectCount(String skey, String sval);
	
}