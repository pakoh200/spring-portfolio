package com.springportfolio.domain.answer;

import static org.hamcrest.CoreMatchers.is;
import static org.junit.Assert.assertThat;

import java.util.Set;

import javax.validation.ConstraintViolation;
import javax.validation.Validation;
import javax.validation.Validator;
import javax.validation.ValidatorFactory;

import org.junit.BeforeClass;
import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.springportfolio.domain.users.UserTest;

public class AnswerTest {
	private static final Logger log = LoggerFactory.getLogger(UserTest.class);

	private static Validator validator;

	@BeforeClass
	public static void setUp() {
		ValidatorFactory factory = Validation.buildDefaultValidatorFactory();
		validator = factory.getValidator();
	}

	@Test
	public void writerWhenIsEmpty() {
		Answer answer = new Answer(1, "", "contents", 1, new java.util.Date());
		Set<ConstraintViolation<Answer>> constraintViolations = validator.validate(answer);
		assertThat(constraintViolations.size(), is(2));
		for (ConstraintViolation<Answer> constraintViolation : constraintViolations) {
			log.debug("violation error message : {}", constraintViolation.getMessage());
		}
	}
	
	@Test
	public void contentsWhenIsEmpty() {
		Answer answer = new Answer(1, "writer", "", 1, new java.util.Date());
		Set<ConstraintViolation<Answer>> constraintViolations = validator.validate(answer);
		assertThat(constraintViolations.size(), is(1));
		for (ConstraintViolation<Answer> constraintViolation : constraintViolations) {
			log.debug("violation error message : {}", constraintViolation.getMessage());
		}
	}
}
