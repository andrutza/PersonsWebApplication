package person.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter  {

	@Autowired
	@Qualifier("userDetailsService")
	UserDetailsService userService;
	
	@Autowired
	public void configAuthentication(AuthenticationManagerBuilder auth) throws Exception {
		auth.userDetailsService(userService);
	}	
	
	@Override protected void configure(HttpSecurity http) throws Exception {
	      http.authorizeRequests()
//	        .antMatchers("/").permitAll()
	        .antMatchers("/person","/person/**").authenticated().anyRequest().permitAll()
	        .and().formLogin().loginPage("/")
			.usernameParameter("username")
			.passwordParameter("password")
	        .loginProcessingUrl("/login")
	        .defaultSuccessUrl("/person")
			.failureUrl("/?auth=fail")
			.and().logout().logoutUrl("/logout").logoutSuccessUrl("/")
			.and().csrf().disable();
	}
	      
}
