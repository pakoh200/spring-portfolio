package com.springportfolio.sns;

import com.springportfolio.domain.users.User;


public class SnsUser extends User{
	private int id;
	private String snsId;
	private String snsType;
	private String snsName;

	public SnsUser() {
	}
	
	public SnsUser(int id, String snsId, String snsType, String snsName) {
		this.id = id;
		this.snsId = snsId;
		this.snsType = snsType;
		this.snsName = snsName;
	}

	public SnsUser(NaverUser naverUser) {
		super(null, null, naverUser.getName(), naverUser.getEmail(), "ROLE_USER");
		this.snsId = naverUser.getId();
		this.snsType = "NAVER";
		this.snsName = naverUser.getName();
	}
	
	public SnsUser(GoogleUser googleUser){
		super(null, null, googleUser.getName(), googleUser.getEmail(), "ROLE_USER");
		this.snsId = googleUser.getId();
		this.snsType = "GOOGLE";
		this.snsName = googleUser.getName();
	}
	
	public SnsUser(FacebookUser facebookUser) {
		super(null, null, facebookUser.getName(), facebookUser.getEmail(), "ROLE_USER");
		this.snsId = facebookUser.getId();
		this.snsType = "FACEBOOK";
		this.snsName = facebookUser.getName();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getSnsId() {
		return snsId;
	}

	public void setSnsId(String snsId) {
		this.snsId = snsId;
	}

	public String getSnsType() {
		return snsType;
	}

	public void setSnsType(String snsType) {
		this.snsType = snsType;
	}

	public String getSnsName() {
		return snsName;
	}

	public void setSnsName(String snsName) {
		this.snsName = snsName;
	}

	@Override
	public String toString() {
		return "SnsUser [id=" + id + ", snsId=" + snsId + ", snsType=" + snsType + ", snsName=" + snsName + "]";
	}
}
