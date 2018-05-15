package checkConferenceRoomApp.controller;


import checkConferenceRoomApp.model.ConfRoomModel;
import checkConferenceRoomApp.service.ConfRoomService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import static java.util.Comparator.comparing;

import java.util.Collections;
import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/conf")
public class ConfRoomController {

    @Autowired
    private ConfRoomService confRoomService;

    @GetMapping("")
    public String listConfs(Model model){
        List<ConfRoomModel> allConfRooms = confRoomService.getAllConfRooms();
        Collections.sort(allConfRooms, comparing(ConfRoomModel::getFloor));
        model.addAttribute("confRoomModel", allConfRooms);
        return "confRoomList";
    }

    @GetMapping("/saveConf")
    public String addNewConfRoom(Model model){
        ConfRoomModel confRoomModel = new ConfRoomModel();
        model.addAttribute("confRoom",confRoomModel);
        return "save-confRoom";
    }

    @PostMapping("save")
    public String saveConfRoom(@ModelAttribute("confRoom") ConfRoomModel confRoomModel){
        confRoomService.saveConfRoom(confRoomModel);
        return "redirect:/conf";
    }

    @DeleteMapping("/delete")
    public String deleteConfRoom(@RequestParam("confRoomId") int id){
        confRoomService.deleteConfRoom(id);
        return "redirect:/conf";
    }

    @GetMapping("/update")
    public String updateCOnfRoom(@RequestParam("confRoomId") int id, Model model){
        Optional<ConfRoomModel> confRoomModel = confRoomService.getConfRoomById(id);
        model.addAttribute("confRoom",confRoomModel);
        return "save-confRoom";
    }

    @GetMapping("/confRoomListByFloor/")
    public String listConfRoomsFromFloor(Model model, @RequestParam("floor") int floor){
        List<ConfRoomModel> allConfs = confRoomService.getConfsByFloor(floor);
        model.addAttribute("confRoomModel", allConfs);
        return "confRoomList";
    }

    @GetMapping("/confRoomList/")
    public String getConfRoomByName(Model model, @RequestParam("name") String name){
        List<ConfRoomModel> allConfs = confRoomService.getConfsByName(name);
        model.addAttribute("confRoomModel", allConfs);
        return "confRoomList";
    }
}
