package checkConferenceRoomApp.authentication;

import checkConferenceRoomApp.model.User;
import checkConferenceRoomApp.model.UserRole;
import checkConferenceRoomApp.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
public class MyAuthenticationProvider implements AuthenticationProvider {

    private UserRepository userRepository;

    @Autowired
    public MyAuthenticationProvider(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @Override
    public Authentication authenticate(Authentication authentication) throws AuthenticationException {
        String name = authentication.getName();
        String password = authentication.getCredentials()
                .toString();

        User user = userRepository.findByUserName(name);
        if (!isAuthenticated(user, password)) {
            return null;
        }

        List<SimpleGrantedAuthority> roles = getAllRoles(user);
        return new UsernamePasswordAuthenticationToken(name, password,
                roles);

    }

    private List<SimpleGrantedAuthority> getAllRoles(User user) {
        List<SimpleGrantedAuthority> result = new ArrayList<>();
        for (UserRole userRole : user.getUserRoles()) {
            result.add(new SimpleGrantedAuthority(userRole.getRole()));
        }

        return result;
    }

    private boolean isAuthenticated() {
        return true;
    }

    private boolean isAuthenticated(User user, String providedPassword) {
        return user != null && providedPassword != null && providedPassword.equals(user.getPassword());
    }

    @Override
    public boolean supports(Class<?> authentication) {
        return authentication.equals(UsernamePasswordAuthenticationToken.class);
    }
}
