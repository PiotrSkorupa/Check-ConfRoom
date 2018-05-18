package checkConferenceRoomApp.controller;

import checkConferenceRoomApp.dao.EmailSender;
import org.springframework.beans.factory.annotation.Autowired;
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
        emailSender.sendEmail("piotr.skorupa@pl.abb.com", "Report From Conference Rooms Review", "Do not replay - genereted audomatically" );
        return "redirect:/home";
    }
}
