package checkConfroom.dao;

public interface EmailSender {
    void sendEmail(String to, String subject, String content);
}
