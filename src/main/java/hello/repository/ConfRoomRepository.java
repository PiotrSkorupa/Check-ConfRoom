package hello.repository;

import hello.dto.ConfRoom;
import hello.model.ConfRoomModel;
import org.springframework.data.repository.CrudRepository;

public interface ConfRoomRepository extends CrudRepository<ConfRoomModel, Integer> {


}
