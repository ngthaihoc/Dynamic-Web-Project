package hocng.utils;

import java.util.Properties;

import jakarta.mail.Authenticator;
import jakarta.mail.Message;
import jakarta.mail.PasswordAuthentication;
import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;

public class sendMail {

	public static void sendEmail(String to, String subject, String content) throws Exception {
		// 1. Cấu hình SMTP
		Properties pro = new Properties();
		pro.put("mail.smtp.host", "smtp.gmail.com");
		pro.put("mail.smtp.port", "587");
		pro.put("mail.smtp.auth", "true");
		pro.put("mail.smtp.starttls.enable", "true");

		final String smtpUser = System.getenv("SMTP_USER") != null ? System.getenv("SMTP_USER")
				: System.getProperty("smtp.user", "ngthaihoc.vn@gmail.com");
		final String smtpPass = System.getenv("SMTP_PASS") != null ? System.getenv("SMTP_PASS")
				: System.getProperty("smtp.pass", "");

		// 2. Đăng nhập Gmail
		Session session = Session.getInstance(pro, new Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(smtpUser, smtpPass);
			}
		});

		// 3. Tạo email
		Message mess = new MimeMessage(session);
		mess.setFrom(new InternetAddress(smtpUser));
		mess.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
		mess.setSubject(subject);
		mess.setText(content);

		// 4. Gửi email
		Transport.send(mess);
		System.out.println("Đã gửi mail");

	}

}
