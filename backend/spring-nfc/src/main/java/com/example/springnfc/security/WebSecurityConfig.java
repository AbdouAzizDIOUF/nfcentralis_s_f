package com.example.springnfc.security;

import com.example.springnfc.security.jwt.AuthEntryPointJwt;
import com.example.springnfc.security.jwt.AuthTokenFilter;
import com.example.springnfc.security.services.UserDetailsServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(
    // securedEnabled = true,
    // jsr250Enabled = true,
    prePostEnabled = true)
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {
  @Autowired
  UserDetailsServiceImpl userDetailsService;

  @Autowired
  private AuthEntryPointJwt unauthorizedHandler;

  @Bean
  public AuthTokenFilter authenticationJwtTokenFilter() {
    return new AuthTokenFilter();
  }

  @Override
  public void configure(AuthenticationManagerBuilder authenticationManagerBuilder) throws Exception {
    authenticationManagerBuilder.userDetailsService(userDetailsService).passwordEncoder(passwordEncoder());
  }

  @Bean
  @Override
  public AuthenticationManager authenticationManagerBean() throws Exception {
    return super.authenticationManagerBean();
  }

  @Bean
  public PasswordEncoder passwordEncoder() {
    return new BCryptPasswordEncoder();
  }

  @Override
  protected void configure(HttpSecurity http) throws Exception {
    http.cors().and().csrf().disable()
<<<<<<< HEAD
      .exceptionHandling().authenticationEntryPoint(unauthorizedHandler).and()
      .sessionManagement().sessionCreationPolicy(SessionCreationPolicy.STATELESS).and()
      .authorizeRequests().antMatchers("/api/auth/**").permitAll()
      .antMatchers("/api/test/**").permitAll()
      .antMatchers("/api/admin/**").permitAll()
      .antMatchers("/utilisateurs/**").permitAll()
      .antMatchers("/clients/**").permitAll()
      .antMatchers("/companies/**").permitAll()
      .antMatchers("/interventions/**").permitAll()
      .antMatchers("/installations/**").permitAll()
      .antMatchers("/orderers/**").permitAll()
      .antMatchers("/orderers/**/**").permitAll()
      .antMatchers("/providers/**").permitAll()
      .antMatchers("//interventionProviders").permitAll()
      /*.antMatchers("/api/providers/**").permitAll()*/
      .antMatchers("/").permitAll()
      .anyRequest().permitAll();
      //s.anyRequest().authenticated();
=======
        .exceptionHandling().authenticationEntryPoint(unauthorizedHandler).and()
        .sessionManagement().sessionCreationPolicy(SessionCreationPolicy.STATELESS).and()
        .authorizeRequests().antMatchers("/api/auth/**").permitAll()
        .antMatchers("/api/test/**").permitAll()
        .antMatchers("/utilisateurs/**").permitAll()
        .antMatchers("/clients/**").permitAll()
        .antMatchers("/companies/**").permitAll()
        .antMatchers("/interventions/**").permitAll()
        .antMatchers("/orderers/**").permitAll()
        .antMatchers("/orderers/**/**").permitAll()
        .antMatchers("/providers/**").permitAll()
        .antMatchers("/").permitAll()
        // .antMatchers("/**").permitAll()
        // .anyRequest().permitAll();
        .anyRequest().authenticated();
>>>>>>> origin/dima_branch

    http.addFilterBefore(authenticationJwtTokenFilter(), UsernamePasswordAuthenticationFilter.class);
  }
}
