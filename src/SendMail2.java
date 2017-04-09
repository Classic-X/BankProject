import java.io.*;
import java.util.*;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.*;
import javax.mail.internet.*;

public class SendMail2 
{ 
    public static void send(String to, String sub, 
                         String msg)
    { 
     //create an instance of Properties Class   
     Properties props = new Properties();
     String user="tdmosby30@gmail.com";
     String pass="Starwars";
     
     /* Specifies the IP address of your default mail server
     	   for e.g if you are using gmail server as an email sever
           you will pass smtp.gmail.com as value of mail.smtp host. 
           As shown here in the code. 
           Change accordingly, if your email id is not a gmail id
        */
     props.put("mail.smtp.host", "smtp.gmail.com");
     props.put("mail.smtp.ssl.trust", "smtp.gmail.com");
     //below mentioned mail.smtp.port is optional
     props.put("mail.smtp.port", "587");		
     props.put("mail.smtp.auth", "true");
     props.put("mail.smtp.starttls.enable", "true");
     
     /* Pass Properties object(props) and Authenticator object   
           for authentication to Session instance 
        */

    Session session = Session.getInstance(props,new javax.mail.Authenticator()
    {
  	  protected PasswordAuthentication getPasswordAuthentication() 
  	  {
  	 	 return new PasswordAuthentication(user,pass);
  	  }
   });
    
   try
   {
 
 	/* Create an instance of MimeMessage, 
 	      it accept MIME types and headers 
 	   */
 
       // Create a default MimeMessage object.
       Message message = new MimeMessage(session);

       // Set From: header field of the header.
       message.setFrom(new InternetAddress(user));

       // Set To: header field of the header.
       message.setRecipients(Message.RecipientType.TO,
          InternetAddress.parse(to));

       // Set Subject: header field
       message.setSubject(sub);

       // Create the message part
       BodyPart messageBodyPart = new MimeBodyPart();

       // Now set the actual message
       messageBodyPart.setText(msg);

       // Create a multipar message
       Multipart multipart = new MimeMultipart();

       // Set text message part
       multipart.addBodyPart(messageBodyPart);

       // Part two is attachment
       messageBodyPart = new MimeBodyPart();
       String filename = "Account_Opening_Form.pdf";
       DataSource source = new FileDataSource(filename);
       messageBodyPart.setDataHandler(new DataHandler(source));
       messageBodyPart.setFileName(filename);
       multipart.addBodyPart(messageBodyPart);

       // Send the complete message parts
       message.setContent(multipart);

       // Send message
       Transport.send(message);

 
 
 
    }
    catch(Exception e)
    {
    	 e.printStackTrace();
    }
  }  
}