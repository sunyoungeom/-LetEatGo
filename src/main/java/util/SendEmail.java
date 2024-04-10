package util;

import java.util.Properties;
import java.util.Random;
import javax.mail.*;
import javax.mail.internet.*;

import user.User;

public class SendEmail {

    public String getRandom() {
        Random ran = new Random();
        int number = ran.nextInt(999999);
        return String.format("%06d", number);
    }

    public boolean sendEmail(User user, String verificationCode) {
        boolean isSent = false;

        String toEmail = user.getEmail();
        String fromEmail = "leteatgo.send@gmail.com";
        String appPassword = "smrpbrhborwashaq";

        // SMTP 설정
        Properties properties = new Properties();
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");
        properties.put("mail.smtp.host", "smtp.gmail.com");
        properties.put("mail.smtp.port", "587");
        properties.put("mail.smtp.ssl.protocols", "TLSv1.2");

        // 인증 객체 생성
        Authenticator authenticator = new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(fromEmail, appPassword);
            }
        };

        // 세션 생성
        Session session = Session.getInstance(properties, authenticator);

        try {
            // 이메일 메시지 생성
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(fromEmail));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail));
            message.setSubject("이메일 인증 코드");
            // 이메일 내용에 인증 코드 포함
            message.setText("회원가입을 위한 이메일 인증 코드는 " + verificationCode + " 입니다.");

            // 이메일 전송
            Transport.send(message);
            isSent = true;
            System.out.println("전송완료");
        } catch (MessagingException e) {
            e.printStackTrace();
        }

        return isSent;
    }

}
