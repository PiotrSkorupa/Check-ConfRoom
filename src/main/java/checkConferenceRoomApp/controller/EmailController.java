package checkConferenceRoomApp.controller;

import checkConferenceRoomApp.dao.EmailSender;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class EmailController {
    private final EmailSender emailSender;

    @Autowired
    public EmailController(EmailSender emailSender){
        this.emailSender = emailSender;
    }

    @RequestMapping("/conf/sendEmail")
    public String send() {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String user = (String) auth.getPrincipal();

        emailSender.sendEmail("piotrecom@op.pl", "Report from conference rooms review", "This report has been prepared by: " + user + "\n...................................\n" + "Do not replay - genereted automatically" );
        return "redirect:/home";
    }
}
