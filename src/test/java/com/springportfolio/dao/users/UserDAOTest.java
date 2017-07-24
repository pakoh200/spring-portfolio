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

import com.springportfolio.domain.users.Sns;
import com.springportfolio.domain.users.User;
import com.springportfolio.sns.NaverUser;
import com.springportfolio.sns.SnsUser;


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
	public void findByName() throws Exception {
		User user = userDao.findByName("test");
		log.debug("User : {}", user);
	}
	
	@Test
	public void findByIntId() {
		User user = userDao.findByIntId(1);
		log.debug("User : {}", user);
	}
	
	@Test
	public void create() throws Exception {
		User user = new User("test2","test2","test2", "test2@test.test", "ROLE_USER");
		int id = userDao.create(user);
		log.debug("id : {}", id);
		User actual = userDao.findById(user.getUserId());
		log.debug("actual : {}", actual);
		assertThat(actual, is(user));
	}
	
	@Test
	public void list() throws Exception {
		List<User> list = userDao.selectAll();
		log.debug("User list : {}", list);;
	}
	
	@Test
	public void delete() throws Exception {
		userDao.delete(1);
		assertNull(userDao.findByIntId(1));
	}
	
	@Test
	public void updateAuthority() throws Exception {
		userDao.updateAuthority("ROLE_ADMIN", 1);
		User user = userDao.findByIntId(1);
		log.debug("User : {}", user);
	}
	
	@Test
	public void createSnsUser() throws Exception {
		NaverUser naverUser = new NaverUser("sns@test.test", "sns", "1234", "http://test.test", "20-30", "M", "12345", "테스트",	"9-10");
		SnsUser snsUser = new SnsUser(naverUser);
		log.debug("id : {}", snsUser.getId());
		int id = userDao.create(snsUser);
		log.debug("id : {}", snsUser.getId());
		User user = userDao.findByIntId(id);
		log.debug("user : {}", user);
		snsUser.setId(id);
		userDao.createSnsUser(snsUser);
		SnsUser dbSnsUser = userDao.findBySnsId(snsUser.getSnsId());
		log.debug("dbSnsUser : {}", dbSnsUser);
	}
	
	@Test
	public void updateSnsUser() throws Exception {
		User user = new User(2, null, null, "sns", "sns@test.test", "ROLE_USER");
		userDao.create(user);
		Sns sns = new Sns(2, "snsId", "snsId@test.test");
		userDao.updateSnsUser(sns);
		User dbUser = userDao.findByIntId(2);
		log.debug("dbUser : {}", dbUser); 
	}
	
	@Test
	public void findBySnsIntId() throws Exception {
		NaverUser naverUser = new NaverUser("sns@test.test", "sns", "1234", "http://test.test", "20-30", "M", "12345", "테스트",	"9-10");
		SnsUser snsUser = new SnsUser(naverUser);
		int id = userDao.create(snsUser);
		snsUser.setId(id);
		userDao.createSnsUser(snsUser);
		SnsUser dbSnsUser = userDao.findBySnsIntId(id);
		if(dbSnsUser != null){
			userDao.deleteSnsUser(id);
		}
		userDao.delete(id);
		assertNull(userDao.findByIntId(id));
		assertNull(userDao.findBySnsIntId(id));
	}
}
