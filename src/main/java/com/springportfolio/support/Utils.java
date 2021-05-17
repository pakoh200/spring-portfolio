package com.springportfolio.support;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.math.BigInteger;
import java.net.HttpURLConnection;
import java.net.URL;
import java.security.SecureRandom;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.springportfolio.sns.NaverProfileResponse;
import com.springportfolio.sns.NaverUser;
import com.springportfolio.sns.Token;

public class Utils {
	
	public static String generateState() {
		SecureRandom random = new SecureRandom();
		return new BigInteger(130, random).toString(32);
	}

	public static String getJson(String getUrl, String token) {
		String value = null;
		try {
			URL url = new URL(getUrl);
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.setRequestMethod("GET");
			if (token != null) {
				con.setRequestProperty("Authorization", token);
			}
			int responseCode = con.getResponseCode();
			BufferedReader br;
			if (responseCode == 200) { 
				br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			} else { 
				br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			}
			String inputLine;
			StringBuffer res = new StringBuffer();
			while ((inputLine = br.readLine()) != null) {
				res.append(inputLine);
			}
			br.close();
			if (responseCode == 200) {
				value = res.toString();
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return value;
	}

	public static Token getToken(String value) {
		ObjectMapper mapper = new ObjectMapper();
		Token token = null;

		try {
			token = mapper.readValue(value, Token.class);
		} catch (JsonParseException e) {
		} catch (JsonMappingException e) {
		} catch (IOException e) {
		}
		return token;
	}

	public static NaverUser getNaverUser(String value) {
		ObjectMapper mapper = new ObjectMapper();
		NaverProfileResponse naverProfileResponse = null;

		try {
			naverProfileResponse = mapper.readValue(value, NaverProfileResponse.class);
		} catch (JsonParseException e) {
		} catch (JsonMappingException e) {
		} catch (IOException e) {
		}
		return naverProfileResponse.getResponse();
	}

}
