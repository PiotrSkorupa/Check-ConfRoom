package checkConferenceRoomApp.service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import checkConferenceRoomApp.repository.ConfRoomRepository;
import checkConferenceRoomApp.model.ConfRoomModel;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
public class ConfRoomService {

    private ConfRoomRepository confRoomRepository;

    @Autowired
    public ConfRoomService(ConfRoomRepository confRoomRepository) {
        this.confRoomRepository = confRoomRepository;
    }


    @Transactional
    public List<ConfRoomModel> getAllConfRooms(){
        List<ConfRoomModel> confRoomModel = new ArrayList<>();
                confRoomRepository.findAll().forEach(confRoomModel1 -> confRoomModel.add(confRoomModel1));
        return confRoomModel;
    }

    @Transactional
    public ConfRoomModel saveConfRoom(ConfRoomModel confRoomModel){
        confRoomRepository.save(confRoomModel);
        return confRoomModel;
    }

    @Transactional
    public void deleteConfRoom(int id) {
      confRoomRepository.deleteById(id);
    }

    @Transactional
    public Optional<ConfRoomModel> getConfRoomById(int id) {
        return confRoomRepository.findById(id);
    }

    @Transactional
    public List<ConfRoomModel> getConfsByFloor(int floor) {
        List<ConfRoomModel> confRoomModel = new ArrayList<>();
        for (ConfRoomModel roomModel : confRoomRepository.findAll()) {
            if (roomModel.getFloor() == floor) {
                confRoomModel.add(roomModel);
            }
        }
        return confRoomModel;
    }

    @Transactional
    public List<ConfRoomModel> getConfsByName(String name) {
        List<ConfRoomModel> confRoomModel = new ArrayList<>();
        for (ConfRoomModel roomModel : confRoomRepository.findAll()) {
            if (roomModel.getName().toLowerCase().equals(name.toLowerCase())) {
                confRoomModel.add(roomModel);
            }
        }
        return confRoomModel;
    }
}
