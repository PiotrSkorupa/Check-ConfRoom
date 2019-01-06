package checkConfroom.repository;


import checkConfroom.model.User;
import org.springframework.data.repository.CrudRepository;

public interface UserRepository extends CrudRepository<User, Integer> {

    User findByUserName(String username);

    User findById(int id);

    User findByEmail(String email);
}
