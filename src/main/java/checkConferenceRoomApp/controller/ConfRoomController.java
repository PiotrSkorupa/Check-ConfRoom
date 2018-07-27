package checkConferenceRoomApp.controller;


import checkConferenceRoomApp.model.ConfRoomModel;
import checkConferenceRoomApp.service.ConfRoomService;
import org.jxls.template.SimpleExporter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;

import static java.util.Comparator.comparing;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/conf")
public class ConfRoomController {


    @Autowired
    private ConfRoomService confRoomService;

    @GetMapping("")
    public String listConfs(Model model) {
        List<ConfRoomModel> allConfRooms = confRoomService.getAllConfRooms();
        Collections.sort(allConfRooms, comparing(ConfRoomModel::getFloor));
        model.addAttribute("confRoomModel", allConfRooms);
        return "confRoomList";
    }

    @GetMapping("/saveConf")
    public String addNewConfRoom(Model model) {
        ConfRoomModel confRoomModel = new ConfRoomModel();
        model.addAttribute("confRoom", confRoomModel);
        return "save-confRoom";
    }

    @PostMapping("save")
    public String saveConfRoom(@ModelAttribute("confRoom") ConfRoomModel confRoomModel) {
        confRoomService.saveConfRoom(confRoomModel);
        return "redirect:/conf";
    }

    @DeleteMapping("/delete")
    public String deleteConfRoom(@RequestParam("confRoomId") int id) {
        confRoomService.deleteConfRoom(id);
        return "redirect:/conf";
    }

    @GetMapping("/update")
    public String updateCOnfRoom(@RequestParam("confRoomId") int id, Model model) {
        Optional<ConfRoomModel> confRoomModel = confRoomService.getConfRoomById(id);
        model.addAttribute("confRoom", confRoomModel);
        return "save-confRoom";
    }

    @GetMapping("/confRoomListByFloor/")
    public String listConfRoomsFromFloor(Model model, @RequestParam("floor") int floor) {
        List<ConfRoomModel> allConfs = confRoomService.getConfsByFloor(floor);
        model.addAttribute("confRoomModel", allConfs);
        return "confRoomList";
    }

    @GetMapping("/confRoomList/")
    public String getConfRoomByName(Model model, @RequestParam("name") String name) {
        List<ConfRoomModel> allConfs = confRoomService.getConfsByName(name);
        model.addAttribute("confRoomModel", allConfs);
        return "confRoomList";
    }

    @RequestMapping(value = "/downloadReport", method = RequestMethod.GET)
    public void downloadExcelReport(HttpServletResponse response) {
        List<ConfRoomModel> confs = confRoomService.getAllConfRooms();
        List<String> headers = Arrays.asList("floor", "name", "skypeVC", "hdmi", "lan", "labels", "remotes", "instruction", "sockets", "markers", "floorCondition", "comments", "last modified", "checked by");
        SimpleExporter exporter = new SimpleExporter();

        try {
            response.addHeader("Content-disposition", "attachment; filename=ConferenceRoomReport.xls");
            response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
            exporter.gridExport(headers, confs, "floor, name, skypeVc, hdmi, lan, labels, remotes, instruction, sockets, markers, floorCondition,comments, lastmodified, checkedby", response.getOutputStream());
            response.flushBuffer();

        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @RequestMapping(value = "/sendReport", method = RequestMethod.GET)
    public String sendExcelReport(HttpServletResponse response) {
        List<ConfRoomModel> confs = confRoomService.getAllConfRooms();
        List<String> headers = Arrays.asList("floor", "name", "skypeVC", "hdmi", "lan", "labels", "remotes", "instruction", "sockets", "markers", "floorCondition", "comments", "last modified", "checked by");
        SimpleExporter exporter = new SimpleExporter();

        try {
            OutputStream os1 = new FileOutputStream("src/main/resources/reports/ConferenceRoomReport.xls");
            exporter.gridExport(headers, confs, "floor, name, skypeVc, hdmi, lan, labels, remotes, instruction, sockets, markers, floorCondition, comments, lastmodified, checkedby", os1);

        } catch (IOException e) {
            e.printStackTrace();
        }
        return "redirect:/conf/sendEmail";
    }
}
