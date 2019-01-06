package checkConfroom.controller;

import checkConfroom.dao.EmailSender;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;


@Controller
public class EmailController extends HttpServlet {
    private final EmailSender emailSender;
    private String mailTo;

    @Autowired
    public EmailController(EmailSender emailSender) {
        this.emailSender = emailSender;
    }

    @RequestMapping("/check-confroom/conf/sendEmail")
    public String doPost(HttpServletRequest request) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String user = (String) auth.getPrincipal();
        mailTo = request.getParameter("email");

        emailSender.sendEmail(mailTo, "Report from conference rooms review", "This report has been prepared by: " + user + ".\n...................................\n" + "Do not replay - genereted automatically");
        return "redirect:/check-confroom/conf";
    }
}
