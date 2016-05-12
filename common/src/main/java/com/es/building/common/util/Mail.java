package com.es.building.common.util;

import java.io.IOException;
import java.util.Properties;

import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSenderImpl;

public class Mail {
	/**
	 * @方法名: sendMail, 发送Email的工具类
	 * @参数名： @param subject 邮件主题
	 * @参数名： @param content 邮件内容
	 * @参数名： @param mailto 收件人Email地址
	 * @描述语: 发送邮件
	 */
	private static JavaMailSenderImpl javaMailSenderImpl;
	private static SimpleMailMessage simpleMailMessage;

	private static void createMailSenderConfig() {
		Properties props = new Properties();
		/*
		 * props.put("zookeeper.connect", KafkaProperties.zkConnect);
		 * props.put("group.id", KafkaProperties.groupId);
		 * props.put("zookeeper.session.timeout.ms", KafkaProperties.timeout);
		 * props.put("zookeeper.sync.time.ms", KafkaProperties.synctime);
		 * props.put("auto.commit.interval.ms", KafkaProperties.autocommit);
		 */
		try {
			props.load(Thread.currentThread().getContextClassLoader()
					.getResourceAsStream("email.properties"));
			javaMailSenderImpl = new JavaMailSenderImpl();
			javaMailSenderImpl.setJavaMailProperties(props);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	// 不同租户可以使用不同的邮件服务器
	public void setHostProps(Properties props) {
		javaMailSenderImpl.setJavaMailProperties(props);
	}

	public boolean sender(String subject, String content, String mailto) {

		boolean resultMail = false;

		try {
			simpleMailMessage.setSubject(subject); // 设置邮件主题
			simpleMailMessage.setText(content); // 设置邮件主题内容
			simpleMailMessage.setTo(mailto); // 设定收件人
			// 发送邮件
			javaMailSenderImpl.send(simpleMailMessage);

			resultMail = true;
			System.out.println("----发送成功---");

		} catch (Exception e) {
			System.out.println("----发送失败---");
		}

		return resultMail;

	}

}
