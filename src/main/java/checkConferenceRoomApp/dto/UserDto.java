package checkConferenceRoomApp.dto;

import lombok.*;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.util.List;

@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@ToString

public class UserDto {

    private Integer userId;
    @NotNull(message = "login can't be empty")
    @Size(min = 3, message = "login must have at least 3 characters")
    private String userName;

    @Size(min = 3, message = " password must have at least 3 characters")
    @NotNull(message = "password can't be empty")
    private String password;

    @NotNull(message = " email can't be empty")
    @Email
    private String email;

    private int enabled;

    private List<String> userRoles;

}