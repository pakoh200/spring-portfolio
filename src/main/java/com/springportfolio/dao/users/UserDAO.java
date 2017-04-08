package com.springportfolio.dao.users;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.sql.DataSource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.support.JdbcDaoSupport;
import org.springframework.jdbc.datasource.init.DatabasePopulatorUtils;
import org.springframework.jdbc.datasource.init.ResourceDatabasePopulator;
import org.springframework.stereotype.Repository;

import com.springportfolio.domain.users.User;

public class UserDAO extends JdbcDaoSupport {
	private static final Logger log = LoggerFactory.getLogger(UserDAO.class);

	@PostConstruct
	public void initialize() {
		ResourceDatabasePopulator populator = new ResourceDatabasePopulator();
		populator.addScript(new ClassPathResource("import.sql"));
		DatabasePopulatorUtils.execute(populator, getDataSource());
		log.debug("database setting success!");
	}

	public User findById(String userId) {
		String sql = "select * from USERS where userId = ?";
		RowMapper<User> rowMapper = new RowMapper<User>() {
			@Override
			public User mapRow(ResultSet rs, int rowNum) throws SQLException {
				return new User(rs.getString("userId"), rs.getString("password"), rs.getString("name"), rs.getString("email"));
			}
		};
		try {
			return getJdbcTemplate().queryForObject(sql, rowMapper, userId);
		} catch (EmptyResultDataAccessException e) {
			return null;
		}
	}

	public void create(User user) {
		String sql = "insert into USERS values(?, ?, ?, ?)";
		getJdbcTemplate().update(sql, user.getUserId(), user.getPassword(), user.getName(), user.getEmail());
	}

	public void update(User user) {
		String sql = "update USERS set password = ?, name = ?, email = ? where userId = ?";
		getJdbcTemplate().update(sql, user.getPassword(), user.getName(), user.getEmail(), user.getUserId());
	}

	public List<User> selectAll() {
		String sql = "select * from USERS";
		List<User> users  = getJdbcTemplate().query(sql, new BeanPropertyRowMapper(User.class));
		return users;
	}
}
