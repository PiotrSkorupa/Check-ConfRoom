package checkConfroom.security;

import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

@Configuration
@EnableWebSecurity
public class LoginSecurityConfig extends WebSecurityConfigurerAdapter {

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.authorizeRequests()
                .antMatchers("/check-confroom/admin").access("hasRole('ROLE_ADMIN')")
                .antMatchers("/check-confroom/conf").hasAnyRole("ADMIN", "USER")
                .and()
                .formLogin().loginPage("/check-confroom/login")
                .defaultSuccessUrl("/check-confroom/home")
                .failureUrl("/check-confroom/login?error")
                .usernameParameter("username").passwordParameter("password")
                .and()
                .logout().logoutSuccessUrl("/check-confroom/login?logout")
                .and()
                .exceptionHandling()
                .accessDeniedPage("/check-confroom/access-denied");
    }

}
