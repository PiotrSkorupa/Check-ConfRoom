package checkConfroom.service;

import checkConfroom.dao.EmailSender;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

@Service
public class EmailSenderService implements EmailSender {
    private String dataName;
    private String name;
    private File att;

    @Autowired
    private JavaMailSender javaMailSender;

    @Override
    public void sendEmail(String to, String title, String content) {

        dataName = new SimpleDateFormat("yyyyMMdd'.xls'").format(new Date());
        name = "ConferenceRoomReport" + dataName;
        att = new File("C:\\Users\\confapp\\OneDrive\\reports\\" + name);
        DataSource source = new FileDataSource(att);

        MimeMessage mail = javaMailSender.createMimeMessage();
        try {
            MimeMessageHelper message = new MimeMessageHelper(mail, true);
            message.setTo(to);
            message.setFrom("checkConfRoom@outlook.com");
            message.setSubject(title);
            message.addAttachment(name, source);
            message.setText(content, true);

        } catch (MessagingException e) {
            e.printStackTrace();
        }
        javaMailSender.send(mail);
    }
}
