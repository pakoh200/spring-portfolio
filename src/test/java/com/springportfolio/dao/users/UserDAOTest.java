package com.springportfolio.dao.users;

import static org.hamcrest.CoreMatchers.is;
import static org.junit.Assert.*;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.springportfolio.domain.users.User;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:/applicationContext.xml")
public class UserDAOTest {
	private static final Logger log = LoggerFactory.getLogger(UserDAOTest.class);
	
	@Autowired
	private UserDAO userDao;

	@Test
	public void findById() {
		User user = userDao.findById("test");
		log.debug("User : {}", user);
	}
	
	@Test
	public void create() throws Exception {
		User user = new User("test2","test2","test2", "test2@test.test", "ROLE_USER");
		userDao.create(user);
		User actual = userDao.findById(user.getUserId());
		assertThat(actual, is(user));
	}
	
	@Test
	public void list() throws Exception {
		List<User> list = userDao.selectAll();
		log.debug("User list : {}", list);;
	}
	
	@Test
	public void delete() throws Exception {
		userDao.delete("test");
		assertNull(userDao.findById("test"));
	}
	
	@Test
	public void updateAuthority() throws Exception {
		userDao.updateAuthority("ROLE_ADMIN", "test");
		User user = userDao.findById("test");
		log.debug("User : {}", user);
	}
}
