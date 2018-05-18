package checkConferenceRoomApp;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class Application {

    public static void main(String[] args) {
        SpringApplication.run(Application.class, args);
    }

    /*@Bean
    public CommandLineRunner commandLineRunner(UserRepository userRepository, ConfRoomRepository confRoomRepository) {
        return (String... args) -> {
            User user = new User();
            user.setUserName("admin");
            user.setPassword("admin");

            UserRole adminRole = new UserRole();
            adminRole.setRole("ROLE_ADMIN");

            UserRole userRole = new UserRole();
            userRole.setRole("ROLE_USER");

            //user.setUserRoles(Arrays.asList(adminRole, userRole));
            user.setUserRoles(Arrays.asList(adminRole));

            userRepository.save(user);

            ConfRoomModel confRoomModel = ConfRoomModel.builder()
                    .floor(1)
                    .name("Kraków")
                    .hdmi(true)
                    .skypeVc(true)
                    .lan(true)
                    .labels(true)
                    .remotes(true)
                    .instruction(true)
                    .comments("comment")
                    .build();

            confRoomRepository.save(confRoomModel);
        };
    }*/


}