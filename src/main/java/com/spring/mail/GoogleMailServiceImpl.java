package com.spring.mail;

import javax.mail.internet.MimeMessage;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class GoogleMailServiceImpl implements MailService {
	private final JavaMailSender mailSender;
	
	@Async
	public void sendMail(String to, String subject, String body) {
		MimeMessage message = mailSender.createMimeMessage();

		try {
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
			messageHelper.setFrom("dlhjwwe@gmail.com", "고객센터");
			messageHelper.setTo(to);
			messageHelper.setSubject(subject);
			messageHelper.setText(body);
			mailSender.send(message);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
}
