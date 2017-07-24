package com.springportfolio.sns;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;

@JsonSerialize
public class NaverProfileResponse {
	@JsonProperty("resultcode")
	private String resultcode;
	@JsonProperty("message")
	private String message;
	@JsonProperty("response")
	private NaverUser response;

	@JsonProperty("resultcode")
	public String getResultcode() {
		return resultcode;
	}

	@JsonProperty("resultcode")
	public void setResultcode(String resultcode) {
		this.resultcode = resultcode;
	}

	@JsonProperty("message")
	public String getMessage() {
		return message;
	}

	@JsonProperty("message")
	public void setMessage(String message) {
		this.message = message;
	}

	@JsonProperty("response")
	public NaverUser getResponse() {
		return response;
	}

	@JsonProperty("response")
	public void setResponse(NaverUser response) {
		this.response = response;
	}

	@Override
	public String toString() {
		return "NaverProfileResponse [resultcode=" + resultcode + ", message=" + message + ", response=" + response + "]";
	}
}
