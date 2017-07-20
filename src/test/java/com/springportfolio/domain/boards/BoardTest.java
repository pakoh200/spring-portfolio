package com.springportfolio.domain.boards;

import static org.hamcrest.CoreMatchers.is;
import static org.junit.Assert.*;

import java.util.Set;

import javax.validation.ConstraintViolation;
import javax.validation.Validation;
import javax.validation.Validator;
import javax.validation.ValidatorFactory;

import org.junit.BeforeClass;
import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.springportfolio.domain.users.User;
import com.springportfolio.domain.users.UserTest;

public class BoardTest {
	private static final Logger log = LoggerFactory.getLogger(UserTest.class);

	private static Validator validator;

	@BeforeClass
	public static void setUp() {
		ValidatorFactory factory = Validation.buildDefaultValidatorFactory();
		validator = factory.getValidator();
	}
	
	@Test
	public void titleWhenIsEmpty() {
		Board board = new Board(2, "", "name", "contents", new java.util.Date(), 0, 0);
		Set<ConstraintViolation<Board>> constraintViolations = validator.validate(board);
		assertThat(constraintViolations.size(), is(2));
		for (ConstraintViolation<Board> constraintViolation : constraintViolations) {
			log.debug("violation error message : {}", constraintViolation.getMessage());
		}
	}
	
	@Test
	public void nameWhenIsEmpty() {
		Board board = new Board(2, "title", "", "contents", new java.util.Date(), 0 ,0);
		Set<ConstraintViolation<Board>> constraintViolations = validator.validate(board);
		assertThat(constraintViolations.size(), is(2));
		for (ConstraintViolation<Board> constraintViolation : constraintViolations) {
			log.debug("violation error message : {}", constraintViolation.getMessage());
		}
	}
	
	@Test
	public void contentsWhenIsEmpty() {
		Board board = new Board(2, "title", "name", "", new java.util.Date(), 0 ,0);
		Set<ConstraintViolation<Board>> constraintViolations = validator.validate(board);
		assertThat(constraintViolations.size(), is(1));
		for (ConstraintViolation<Board> constraintViolation : constraintViolations) {
			log.debug("violation error message : {}", constraintViolation.getMessage());
		}
	}

}
