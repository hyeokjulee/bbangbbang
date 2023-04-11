package com.spring.mail;

import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.RequiredArgsConstructor;

@RequestMapping("mail")
@EnableAsync
@Controller
@RequiredArgsConstructor
public class MailController {
	private final MailService mailService;
	
	@RequestMapping(value = "/sendmail", method = RequestMethod.GET)
	public void sendMail(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		mailService.sendMail("dlhjwwe@naver.com", "테스트 메일입니다.", "내용은 없습니다.");
		out.println("메일 전송 완료");
	}
	
	// 폼 메일 전송 연습
	
	@RequestMapping(value = "/form", method=RequestMethod.GET)
	public String mailform() {
		return "mail/form";
	}
	
	@RequestMapping(value = "/form", method=RequestMethod.POST)
	public void mailform(@RequestParam Map<String, Object> map) {
		
		String to = (String) map.get("to");
		String subject = (String) map.get("subject");
		String body = (String) map.get("body");
		
		mailService.sendMail(to, subject, body);
	}
}
