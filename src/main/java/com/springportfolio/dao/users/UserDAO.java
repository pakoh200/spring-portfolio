package com.springportfolio.dao.users;

import java.beans.Statement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.annotation.PostConstruct;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.io.ClassPathResource;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.core.support.JdbcDaoSupport;
import org.springframework.jdbc.datasource.init.DatabasePopulatorUtils;
import org.springframework.jdbc.datasource.init.ResourceDatabasePopulator;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;

import com.springportfolio.domain.users.User;
import com.springportfolio.naver.SnsUser;

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
				return new User(rs.getString("userId"), rs.getString("password"), rs.getString("name"), rs.getString("email"),
						rs.getString("authority"));
			}
		};
		try {
			return getJdbcTemplate().queryForObject(sql, rowMapper, userId);
		} catch (EmptyResultDataAccessException e) {
			return null;
		}
	}

	public int create(User user) {
		String sql = "insert into USERS(userId, password, name, email, authority) values(?, ?, ?, ?, ?)";
		//SqlParameterSource fileParameters = new BeanPropertySqlParameterSource(user);
		KeyHolder keyHolder = new GeneratedKeyHolder();
//		getJdbcTemplate().update(sql, fileParameters, keyHolder);
		//getJdbcTemplate().update(sql, user.getUserId(), user.getPassword(), user.getName(), user.getEmail(), user.getAuthority(), keyHolder);
		getJdbcTemplate().update(new PreparedStatementCreator() {
			
			@Override
			public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
				PreparedStatement ps = con.prepareStatement(sql, new String[]{"id"});
				ps.setString(1, user.getUserId());
				ps.setString(2, user.getPassword());
				ps.setString(3, user.getName());
				ps.setString(4, user.getEmail());
				ps.setString(5, user.getAuthority());
				return ps;
			}
		}, keyHolder);
		return keyHolder.getKey().intValue();
		//getJdbcTemplate().update(sql, user.getUserId(), user.getPassword(), user.getName(), user.getEmail(), user.getAuthority());
	}

	public void update(User user) {
		String sql = "update USERS set password = ?, name = ?, email = ?, authority = ? where userId = ?";
		getJdbcTemplate().update(sql, user.getPassword(), user.getName(), user.getEmail(), user.getAuthority(), user.getUserId());
	}

	public List<User> selectAll() {
		String sql = "select * from USERS";
		RowMapper<User> rowMapper = new RowMapper<User>() {
			@Override
			public User mapRow(ResultSet rs, int rowNum) throws SQLException {
				return new User(rs.getString("userId"), rs.getString("password"), rs.getString("name"), rs.getString("email"),
						rs.getString("authority"));
			}
		};
		List<User> list = getJdbcTemplate().query(sql, rowMapper);
		// List<User> users = getJdbcTemplate().query(sql, new
		// BeanPropertyRowMapper(User.class));
		return list;
	}

	public void delete(String userId) {
		String sql = "delete from USERS where userId = ?";
		getJdbcTemplate().update(sql, userId);
	}

	public void updateAuthority(String authority, String userId) {
		String sql = "update USERS set authority = ? where userId = ?";
		getJdbcTemplate().update(sql, authority, userId);
	}

	public User findByIntId(int id) {
		String sql = "select * from USERS where id = ?";
		RowMapper<User> rowMapper = new RowMapper<User>() {
			@Override
			public User mapRow(ResultSet rs, int rowNum) throws SQLException {
				return new User(rs.getInt("id"), rs.getString("userId"), rs.getString("password"), rs.getString("name"), rs.getString("email"),
						rs.getString("authority"));
			}
		};
		try {
			return getJdbcTemplate().queryForObject(sql, rowMapper, id);
		} catch (EmptyResultDataAccessException e) {
			return null;
		}
	}

	public void createSnsUser(SnsUser snsUser) {
		String sql = "insert into SNS_INFO values(?,?,?,?)";
		getJdbcTemplate().update(sql, snsUser.getId(), snsUser.getSnsId(), snsUser.getSnsType(), snsUser.getSnsName());
	}

	public SnsUser findBySnsId(String snsId) {
		String sql = "select * from SNS_INFO where sns_id = ?";
		RowMapper<SnsUser> rowMapper = new RowMapper<SnsUser>() {
			@Override
			public SnsUser mapRow(ResultSet rs, int rowNum) throws SQLException {
				return new SnsUser(rs.getInt("id"), rs.getString("sns_id"), rs.getString("sns_type"), rs.getString("sns_name"));
			}
		};
		try {
			return getJdbcTemplate().queryForObject(sql, rowMapper, snsId);
		} catch (EmptyResultDataAccessException e) {
			return null;
		}
	}

}
