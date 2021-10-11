<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page import="java.sql.*"  session="false" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>

<%@ page import="javax.servlet.http.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.net.InetAddress" %>
<%@ page import="java.util.Properties" %>
<%@ page import="java.util.Date " %>
<%@ page import="javax.mail.*" %>
<%@ page import="javax.mail.internet.*" %>
<%@ page import="javax.activation.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.jsp.*" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<!-- DW6 -->
<head>
<!-- Copyright 2005 Macromedia, Inc. All rights reserved. -->
<title>Home Page</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
</head>
<body bgcolor="#C0DFFD">
<%
 int k=-1;  
 
 try
 {
    String p=request.getParameter("password");
    String e=request.getParameter("email");
 String host ="smtp.gmail.com";
             String from ="thisverma@gmail.com";  //Your mail id
             String pass ="ak47mig33";   // Your Password
             Properties props = System.getProperties();
             props.put("mail.smtp.starttls.enable", "true"); // added this line
             props.put("mail.smtp.host", host);
             props.put("mail.smtp.user", from);
             props.put("mail.smtp.password", pass);
             props.put("mail.smtp.port", "587");
             props.put("mail.smtp.auth", "true");
             Session session = Session.getDefaultInstance(props, null);
 //String to ="kumarpraveenboy9@gmail.com" ; // To Email address
 MimeMessage message = new MimeMessage(session);
             message.setFrom(new InternetAddress(from));

			 InternetAddress to1 = new InternetAddress(e);
        
			 message.addRecipient(Message.RecipientType.TO, to1);
              
             message.setSubject("Verification Mail");
String Body="Admin has verified your company. Now you can access our website without any problem. Please enjoy your stay. we are sorry for any inconvenience. Password for your account is :"+p;

message.setContent(Body,"text/html");


/*	Multipart multipart = new MimeMultipart();

		 MimeBodyPart messageBodyPart = new MimeBodyPart();
		 messageBodyPart.setContent(Body, "text/html");
		 multipart.addBodyPart(messageBodyPart);

		 MimeBodyPart attachPart = new MimeBodyPart();
		  File aFile = new File(config.getServletContext().getRealPath("/")+"test.jpg");

			try {
					attachPart.attachFile(aFile);

				} catch (IOException ex) {
					ex.printStackTrace();
				}
				

				multipart.addBodyPart(attachPart);
				
 message.setContent(multipart);*/

		Transport transport = session.getTransport("smtp");
        		   
		transport.connect(host, from, pass);                     

             transport.sendMessage(message, message.getAllRecipients());
         
		 transport.close();

 k=1;
 }
 catch(Exception e)
 {
    out.println(e);
	k=0;
 }
 %>
 <% if(k==1) 
 {
out.println(" mail is send");
    response.setHeader("Refresh", "1;url=admin_verify_company.jsp");
  } %>
 </body>
</html>
