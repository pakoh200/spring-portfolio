package com.springportfolio.sns;

public class GoogleUser {
	private String id;
	private String email;
	private String name;
	private String imageUrl;

	public GoogleUser() {
	}

	public GoogleUser(String id, String email, String name, String imageUrl) {
		this.id = id;
		this.email = email;
		this.name = name;
		this.imageUrl = imageUrl;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

	@Override
	public String toString() {
		return "GoogleUser [id=" + id + ", email=" + email + ", name=" + name + ", imageUrl=" + imageUrl + "]";
	}

}
