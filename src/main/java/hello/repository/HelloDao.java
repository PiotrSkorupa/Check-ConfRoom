package hello.repository;

import hello.model.ConfRoomModel;
import org.springframework.data.repository.CrudRepository;

public interface HelloDao extends CrudRepository<ConfRoomModel, Integer> {


}
