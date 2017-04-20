package com.springportfolio.domain.users;

import static org.hamcrest.CoreMatchers.*;
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

public class UserTest {
	private static final Logger log = LoggerFactory.getLogger(UserTest.class);

	private static Validator validator;

	@BeforeClass
	public static void setUp() {
		ValidatorFactory factory = Validation.buildDefaultValidatorFactory();
		validator = factory.getValidator();
	}

	@Test
	public void userIdWhenIsEmpty() {
		User user = new User("", "password", "name", "email@test.test", "ROLE_USER");
		Set<ConstraintViolation<User>> constraintViolations = validator.validate(user);
		assertThat(constraintViolations.size(), is(2));
		for (ConstraintViolation<User> constraintViolation : constraintViolations) {
			log.debug("violation error message : {}", constraintViolation.getMessage());
		}
	}

	@Test
	public void matchPassword() throws Exception {
		Authenticate authenticate = new Authenticate("userId", "password");
		User user = new User("userId", "password", "name", "email@test.test", "ROLE_USER");
		assertTrue(user.matchPassword(authenticate));
		
		authenticate = new Authenticate("userId", "password2");
		assertFalse(user.matchPassword(authenticate));
	}
	
	@Test(expected=IllegalArgumentException.class)
	public void updateWhenMisMatchUserId() throws Exception {
		User user = new User("userId", "password", "name", "email@test.test", "ROLE_USER");
		User updateUser = new User("user", "password", "name", "email@test.test", "ROLE_USER");
		user.update(updateUser);
	}
	
	@Test
	public void update() throws Exception {
		User user = new User("userId", "password", "name", "email@test.test", "ROLE_USER");
		User updateUser = new User("userId", "password", "uname", "uemail@test.test", "ROLE_USER");
		User updatedUser = user.update(updateUser);
		assertThat(updatedUser, is(updatedUser));
	}
}
