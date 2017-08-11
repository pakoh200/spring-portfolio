package com.springportfolio.domain.users;

import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;

public class User {
	private int id;
	@NotEmpty
	@Size(min = 4, max = 12)
	private String userId;

	@NotEmpty
	@Size(min = 4, max = 12)
	private String password;

	@NotEmpty
	private String name;

	@Email
	private String email;

	@NotEmpty
	private String authority;

	public User() {
	}

	public User(String userId, String password, String name, String email, String authority) {
		this.userId = userId;
		this.password = password;
		this.name = name;
		this.email = email;
		this.authority = authority;
	}

	public User(int id, String userId, String password, String name, String email, String authority) {
		this.id = id;
		this.userId = userId;
		this.password = password;
		this.name = name;
		this.email = email;
		this.authority = authority;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAuthority() {
		return authority;
	}

	public void setAuthority(String authority) {
		this.authority = authority;
	}

	public boolean matchPassword(Authenticate authenticate) {
		if (this.password == null) {
			return false;
		}
		return authenticate.matchPassword(this.password);
	}

	public boolean matchId(Integer id) {
		if (id == null) {
			return false;
		}
		return id.equals(this.id);
	}

	public User update(User updateUser) {
		if (!matchId(updateUser.getId())) {
			throw new IllegalArgumentException();
		}
		return new User(this.id, this.userId, updateUser.password, updateUser.name, updateUser.email, updateUser.authority);
	}

	public boolean matchAuthority(String authority) {
		if (authority == null) {
			return false;
		}
		return this.authority.equals(authority);
	}

	public boolean matchName(String writer) {
		if(writer == null){
			return false;
		}
		return this.name.equals(writer);
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((authority == null) ? 0 : authority.hashCode());
		result = prime * result + ((email == null) ? 0 : email.hashCode());
		result = prime * result + ((name == null) ? 0 : name.hashCode());
		result = prime * result + ((password == null) ? 0 : password.hashCode());
		result = prime * result + ((userId == null) ? 0 : userId.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		User other = (User) obj;
		if (authority == null) {
			if (other.authority != null)
				return false;
		} else if (!authority.equals(other.authority))
			return false;
		if (email == null) {
			if (other.email != null)
				return false;
		} else if (!email.equals(other.email))
			return false;
		if (name == null) {
			if (other.name != null)
				return false;
		} else if (!name.equals(other.name))
			return false;
		if (password == null) {
			if (other.password != null)
				return false;
		} else if (!password.equals(other.password))
			return false;
		if (userId == null) {
			if (other.userId != null)
				return false;
		} else if (!userId.equals(other.userId))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", userId=" + userId + ", name=" + name + ", email=" + email + ", authority=" + authority + "]";
	}

}
