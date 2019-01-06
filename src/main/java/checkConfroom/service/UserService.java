package checkConfroom.service;

import checkConfroom.dto.UserDto;
import checkConfroom.model.User;
import checkConfroom.model.UserRole;

import checkConfroom.repository.UserRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
public class UserService {

    private UserRepository userRepository;

    @Autowired
    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @Transactional
    public void saveUser(UserDto userDto) {
        User user = MapUserDto(userDto);
        userRepository.save(user);
    }

    private User MapUserDto(UserDto userDto) {
        UserRole userRole = new UserRole();
        userDto.getUserRoles().forEach(userRoles -> userRole.setRole(userRoles));
        List<UserRole> userRoles = new ArrayList<>();
        userRoles.add(userRole);
        if (userDto.getUserId() == null) {
            User user = new User();
            user.setUserRoles(userRoles);
            user.setUserName(userDto.getUserName());
            user.setPassword(userDto.getPassword());
            user.setEmail(userDto.getEmail());
            return user;

        } else {
            User user = findUser(userDto.getUserId());
            user.setUserRoles(userRoles);
            user.setUserName(userDto.getUserName());
            user.setPassword(userDto.getPassword());
            user.setEmail(userDto.getEmail());
            return user;
        }
    }

    @Transactional
    public List<User> getAllUsers() {
        List<User> users = new ArrayList<>();
        userRepository.findAll().forEach(users::add);
        return users;
    }

    @Transactional
    public User findByEmail(String email) {
        return userRepository.findByEmail(email);
    }

    @Transactional
    public void deleteUser(int id) {
        userRepository.deleteById(id);
    }

    @Transactional
    public UserDto updateUser(int id) {
        User user = userRepository.findById(id);
        List<String> userRoles = new ArrayList<>();
        List<UserRole> userRoleList = user.getUserRoles();
        for (UserRole userRole1 : userRoleList) {
            userRoles.add(userRole1.getRole());
        }
        UserDto userDto = new UserDto();
        userDto.setUserId(user.getUserId());
        userDto.setUserName(user.getUserName());
        userDto.setPassword(user.getPassword());
        userDto.setUserRoles(userRoles);
        userDto.setEmail(user.getEmail());
        return userDto;
    }

    @Transactional
    public User findUser(int id) {
        return userRepository.findById(id);
    }
}
