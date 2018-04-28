package checkConferenceRoomApp.service;

import checkConferenceRoomApp.model.UserRole;
import checkConferenceRoomApp.repository.UserRoleRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

@Service
public class UserRoleService {

    UserRoleRepository userRoleRepository;

    @Autowired
    public UserRoleService(UserRoleRepository userRoleRepository) {
        this.userRoleRepository = userRoleRepository;
    }

    @Transactional
    public void saveUserRole(List<UserRole> userRole){
        userRoleRepository.save(userRole);
    }


}
