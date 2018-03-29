package hello.controller;

import hello.dto.UserDto;
import hello.model.ConfRoomModel;
import hello.model.User;
import hello.model.UserRole;
import hello.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;

import hello.service.ConfRoomService;

import javax.validation.Valid;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @InitBinder
    public void initBinder(WebDataBinder webDataBinder){
        StringTrimmerEditor stringTrimmerEditor = new StringTrimmerEditor(true);
        webDataBinder.registerCustomEditor(String.class,stringTrimmerEditor);
    }

    @Autowired
    private UserService userService;

    @GetMapping("/")
    public String adminPanel(){
        return "admin-panel";
    }

    @GetMapping("/saveUser")
    public String showSaveUser(Model model){

        User user = new User();

        model.addAttribute("user",user);
        return "save-user";
    }

    @PostMapping("/saveUser")
    public String saveUser(@Valid@ModelAttribute("user") UserDto user, BindingResult bindingResult) {
        System.out.println(">..............>>>>" + user);
        if(bindingResult.hasErrors()){
            return "save-user";
        }
        userService.saveUser(user);
        return "redirect:/showUser";
    }

    @GetMapping("/showUser")
    public String showUser(Model model){

      List<User> users = userService.getAllUsers();
      System.out.println("USERS: " + users);
      List<UserDto> userDto = new ArrayList<>();

        for (User e : users) {
            List<UserRole> userRoleList = e.getUserRoles();
            List<String> userRoles = new ArrayList<>();
            for (UserRole userRole : userRoleList) {
                userRoles.add(userRole.getRole());
                userDto.add(new UserDto(e.getUserId(), e.getUserName(), e.getPassword(), e.getEmail(), e.getEnabled(), userRoles));
            }
        }
        model.addAttribute("userList",userDto);
        return "user-list";
    }

    @DeleteMapping("/deleteUser")
    public String deleteUser(@RequestParam("userId") int id){
        userService.deleteUser(id);
        return "redirect:/showUser";
    }

    @GetMapping("/updateUser")
    public String updateUser(@RequestParam("userId") int id, Model model){
        UserDto user = userService.updateUser(id);
        model.addAttribute("user",user);
        return "save-user";
    }
}
