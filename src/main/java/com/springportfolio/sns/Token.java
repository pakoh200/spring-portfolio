package com.springportfolio.sns;

import com.fasterxml.jackson.annotation.JsonProperty;

public class Token {
	@JsonProperty("access_token")
	private String access_token;
	@JsonProperty("refresh_token")
	private String refresh_token;
	@JsonProperty("token_type")
	private String token_type;
	@JsonProperty("expires_in")
	private String expires_in;

	@JsonProperty("access_token")
	public String getAccess_token() {
		return access_token;
	}

	@JsonProperty("access_token")
	public void setAccess_token(String access_token) {
		this.access_token = access_token;
	}

	@JsonProperty("refresh_token")
	public String getRefresh_token() {
		return refresh_token;
	}

	@JsonProperty("refresh_token")
	public void setRefresh_token(String refresh_token) {
		this.refresh_token = refresh_token;
	}

	@JsonProperty("token_type")
	public String getToken_type() {
		return token_type;
	}

	@JsonProperty("token_type")
	public void setToken_type(String token_type) {
		this.token_type = token_type;
	}

	@JsonProperty("expires_in")
	public String getExpires_in() {
		return expires_in;
	}

	@JsonProperty("expires_in")
	public void setExpires_in(String expires_in) {
		this.expires_in = expires_in;
	}

	@Override
	public String toString() {
		return "Token [access_token=" + access_token + ", refresh_token=" + refresh_token + ", token_type=" + token_type + ", expires_in="
				+ expires_in + "]";
	}
}
