package com.example.sweter.service;

import com.example.sweter.model.User;
import com.example.sweter.model.role.Role;
import com.example.sweter.repository.UserRepository;
import org.hamcrest.CoreMatchers;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.mockito.ArgumentMatchers;
import org.mockito.Mockito;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.security.crypto.password.PasswordEncoder;

import java.util.Collections;

@SpringBootTest
class UserServiceTest {
    @Autowired
    private UserService userService;
    @MockBean
    private UserRepository userRepository;
    @MockBean
    private PasswordEncoder passwordEncoder;
    @MockBean
    private MailSenderService mailSender;
    @Test
    void addUser() {
        User user = new User();
        user.setEmail("some@gmail.com");
        boolean isUserCreated = userService.addUser(user);
        Assertions.assertTrue(isUserCreated);
        Assertions.assertNotNull(user.getActivationCode());
        Assertions.assertTrue(CoreMatchers.is(user.getRoles()).matches(Collections.singleton(Role.USER)));
        Mockito.verify(userRepository, Mockito.times(1)).save(user);
        Mockito.verify(mailSender,Mockito.times(1))
                .send(
                        ArgumentMatchers.eq(user.getEmail()),
                        ArgumentMatchers.anyString(),
                        ArgumentMatchers.anyString()
                );
    }
    @Test
    public void addUserFailedTest(){
        User user = new User();
        user.setUsername("John");
        Mockito.doReturn(new User())
                .when(userRepository)
                .findByUsername("John");
        boolean isUserCreated = userService.addUser(user);
        Assertions.assertFalse(isUserCreated);
        Mockito.verify(userRepository, Mockito.times(0)).save(ArgumentMatchers.any(User.class));
        Mockito.verify(mailSender,Mockito.times(0))
                .send(
                        ArgumentMatchers.anyString(),
                        ArgumentMatchers.anyString(),
                        ArgumentMatchers.anyString()
                );
    }

    @Test
    void activateUser() {
        User user = new User();
        Mockito.doReturn(new User())
                .when(userRepository)
                .findByActivationCode("activate");
        boolean isUserActivated = userService.activateUser("activate");
        Assertions.assertTrue(isUserActivated);
        Assertions.assertNull(user.getActivationCode());
        Mockito.verify(userRepository, Mockito.times(1)).save(user);
    }
    @Test
    public void activateUserFailTest(){
        boolean isUserActivated = userService.activateUser("activate me");
        Assertions.assertFalse(isUserActivated);
        Mockito.verify(userRepository,Mockito.times(0)).save(ArgumentMatchers.any(User.class));
    }
}