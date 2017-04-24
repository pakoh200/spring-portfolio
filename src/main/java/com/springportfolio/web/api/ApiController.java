package com.springportfolio.web.api;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
@RequestMapping("/api")
public class ApiController {
	private static final Logger log = LoggerFactory.getLogger(ApiController.class);
	
	@GetMapping("/movie/view")
	public ModelAndView sample2(){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("api/movie");
		return mav;
	}

	@GetMapping(value="/movie", produces="application/json;charset=UTF-8")
	public String test(HttpServletRequest req) {
		String title = req.getParameter("title");
		String pnum = req.getParameter("pnum");
		if(pnum == null || pnum == ""){
			pnum = "1";
		}
		int pageNUM = Integer.parseInt(pnum);
		int start = (pageNUM-1)*10+1;
		
		String clientId = "U4hL8SaxCwPPVLYihW6z";// 애플리케이션 클라이언트 아이디값";
		String clientSecret = "iRTdcoI8l2";// 애플리케이션 클라이언트 시크릿값";
		try {
			String text = URLEncoder.encode(title, "UTF-8");
			String apiURL = "https://openapi.naver.com/v1/search/movie?query=" + text + "&start=" + start; // json
			URL url = new URL(apiURL);
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.setRequestMethod("GET");
			con.setRequestProperty("X-Naver-Client-Id", clientId);
			con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
			int responseCode = con.getResponseCode();
			BufferedReader br;
			if (responseCode == 200) { // 정상 호출
				br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			} else { // 에러 발생
				br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			}
			String inputLine;
			StringBuffer response = new StringBuffer();
			while ((inputLine = br.readLine()) != null) {
				response.append(inputLine);
			}
			br.close();
			return response.toString();
		} catch (Exception e) {
			log.debug(e+"");
		}
		return null;
	}
}
