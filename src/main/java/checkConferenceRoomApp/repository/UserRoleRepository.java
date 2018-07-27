package checkConferenceRoomApp.repository;

import checkConferenceRoomApp.model.UserRole;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface UserRoleRepository extends CrudRepository<UserRole, Integer> {

    UserRole save(List<UserRole> dsa);
}
