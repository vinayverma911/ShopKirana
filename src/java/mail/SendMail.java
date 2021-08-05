package mail;

import java.util.Properties;
import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SendMail {

    public static int SendeMail(String to, int otp, String name,String uid) {

        String myemail = "sk.hrd@shopkirana.com";
        String pass = "Skhrd@123";
        Properties p = new Properties();
        p.put("mail.smtp.auth", "true");
        p.put("mail.smtp.starttls.enable", "true");
        p.put("mail.smtp.host", "smtp.gmail.com");
        p.put("mail.smtp.port", "587");

        Session s = Session.getInstance(p, new Authenticator() {

            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(myemail, pass);
            }
        });
        Message msg = properMessage(s, myemail, to, otp, name,uid);
        try {
            System.out.println("Preparing to send the mail");
            Transport.send(msg);
            System.out.println("Mail sent Successfully");
        } catch (Exception ex) {
            System.err.println(ex.getMessage() + "Send Mail 45");
        }
        return 1;
    }

    static Message properMessage(Session s, String my, String other, int OTP, String name,String uid) {
        try {
            Message ms = new MimeMessage(s);
            ms.setFrom(new InternetAddress(my));
            ms.setRecipient(Message.RecipientType.TO, new InternetAddress(other));
            ms.setSubject("Mail from ShopKirana");
            ms.setText("Dear " + name + "\n\nThis is to inform you that you are in the process of submitting the Application for New Registration at Shopkirana Portal. In this regard you have given the e-mail ID for accessing the application form for the first time for submitting this application form. \n\nYour One Time Password for validation of your E-mail ID is "+OTP+" Please note your Unique ShopKirana ID : "+uid );        

            return ms;
        } catch (Exception ex) {

            System.err.println(ex.getMessage() + "Send Mail 57");
        }
        return null;
    }
}
