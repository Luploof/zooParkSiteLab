package com.example.zooPark.service;

import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class EmailServiceExc {

    private final JavaMailSender mailSender;

    public EmailServiceExc(JavaMailSender mailSender) {
        this.mailSender = mailSender;
    }

    public void sendOrder(String name, String email, String messageText) {
        SimpleMailMessage message = new SimpleMailMessage();
        message.setFrom("luplooff@yandex.ru");
        message.setTo("luplooff@yandex.ru");
        message.setSubject("Новая заявка на экскурсию");
        message.setText("Имя: " + name + "\nEmail: " + email + "\nСообщение: " + messageText);
        mailSender.send(message);
    }
}
