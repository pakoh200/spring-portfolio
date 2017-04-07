package com.springportfolio.dao;


import static org.hamcrest.CoreMatchers.*;
import static org.junit.Assert.*;

import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.Before;
import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.springportfolio.domain.users.User;

public class MyBatisTest {
	private static final Logger log = LoggerFactory.getLogger(MyBatisTest.class);

	private SqlSessionFactory sqlSessionFactory;

	@Before
	public void setup() throws Exception {
		String resource = "mybatis-config-test.xml";
		InputStream inputStream = Resources.getResourceAsStream(resource);
		sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
	}

	@Test
	public void gettingStarted() throws Exception {
		try (SqlSession session = sqlSessionFactory.openSession()) {
			User user = session.selectOne("UserMapper.findById", "test");
			log.debug("User : {}", user);
		}
	}
	
	@Test
	public void create() throws Exception {
		try (SqlSession session = sqlSessionFactory.openSession()) {
			User user = new User("test2", "test2", "test2", "test2@test.test");
			session.insert("UserMapper.create", user);
			User actual = session.selectOne("UserMapper.findById", user.getUserId());
			assertThat(actual, is(user));
		}
	}

}
