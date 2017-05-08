package com.springportfolio.dao.users;

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
import org.springframework.jdbc.core.support.JdbcDaoSupport;
import org.springframework.jdbc.datasource.init.DatabasePopulatorUtils;
import org.springframework.jdbc.datasource.init.ResourceDatabasePopulator;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;

import com.springportfolio.domain.users.Sns;
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
				return new User(rs.getInt("id"), rs.getString("userId"), rs.getString("password"), rs.getString("name"), rs.getString("email"),
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
		KeyHolder keyHolder = new GeneratedKeyHolder();
		getJdbcTemplate().update(new PreparedStatementCreator() {

			@Override
			public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
				PreparedStatement ps = con.prepareStatement(sql, new String[] { "id" });
				ps.setString(1, user.getUserId());
				ps.setString(2, user.getPassword());
				ps.setString(3, user.getName());
				ps.setString(4, user.getEmail());
				ps.setString(5, user.getAuthority());
				return ps;
			}
		}, keyHolder);
		return keyHolder.getKey().intValue();
	}

	public void update(User user) {
		String sql = "update USERS set userId = ?, password = ?, name = ?, email = ?, authority = ? where id = ?";
		getJdbcTemplate().update(sql, user.getUserId(), user.getPassword(), user.getName(), user.getEmail(), user.getAuthority(), user.getId());
	}

	public void updateSnsUser(Sns sns) {
		String sql = "update USERS set name = ?, email = ? where id = ?";
		getJdbcTemplate().update(sql, sns.getName(), sns.getEmail(), sns.getId());
	}

	public List<User> selectAll() {
		String sql = "select * from USERS";
		RowMapper<User> rowMapper = new RowMapper<User>() {
			@Override
			public User mapRow(ResultSet rs, int rowNum) throws SQLException {
				return new User(rs.getInt("id"), rs.getString("userId"), rs.getString("password"), rs.getString("name"), rs.getString("email"),
						rs.getString("authority"));
			}
		};
		List<User> list = getJdbcTemplate().query(sql, rowMapper);
		return list;
	}

	public void delete(int id) {
		String sql = "delete from USERS where id = ?";
		getJdbcTemplate().update(sql, id);
	}

	public void updateAuthority(String authority, int id) {
		String sql = "update USERS set authority = ? where id = ?";
		getJdbcTemplate().update(sql, authority, id);
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

	public SnsUser findBySnsIntId(int id) {
		String sql = "select * from SNS_INFO where id = ?";
		RowMapper<SnsUser> rowMapper = new RowMapper<SnsUser>() {
			@Override
			public SnsUser mapRow(ResultSet rs, int rowNum) throws SQLException {
				return new SnsUser(rs.getInt("id"), rs.getString("sns_id"), rs.getString("sns_type"), rs.getString("sns_name"));
			}
		};
		try {
			return getJdbcTemplate().queryForObject(sql, rowMapper, id);
		} catch (EmptyResultDataAccessException e) {
			return null;
		}
	}

	public void deleteSnsUser(int id) {
		String sql = "delete from SNS_INFO where id = ?";
		getJdbcTemplate().update(sql, id);
	}

}
