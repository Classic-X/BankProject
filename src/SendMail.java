import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;
public class SendMail 
{ 
    public static boolean send(String to, String sub, String msg)
    { 
    	final String user="tdmosby30@gmail.com";
		final String pass="Starwars";
    	Boolean b=true;  
        Properties props = new Properties();                                 
        props.put("mail.smtp.ssl.trust", "smtp.gmail.com");
        props.put("mail.smtp.user", user);
        props.put("mail.smtp.password", pass);
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        Session session = Session.getInstance(props,new javax.mail.Authenticator()
        {
  	    protected PasswordAuthentication getPasswordAuthentication() 
  	    {
  	 	 return new PasswordAuthentication(user,pass);
  	    }
        });
    
          try
          {
          MimeMessage message = new MimeMessage(session);
          message.setFrom(new InternetAddress(user));
          message.addRecipient(Message.RecipientType.TO,new InternetAddress(to));
          message.setSubject(sub);
          message.setText(msg);
          Transport.send(message);
          }
          catch(Exception e)
          {
    	   b=false;
    	   e.printStackTrace();
          }
      return b;
     }  
}