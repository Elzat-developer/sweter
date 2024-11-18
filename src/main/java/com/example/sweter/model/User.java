package com.example.sweter.model;

import com.example.sweter.model.role.Role;
import jakarta.persistence.*;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotEmpty;
import lombok.Getter;
import lombok.Setter;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.util.Collection;
import java.util.Set;

@Entity
@Getter
@Setter
@Table(name = "users")
public class User implements UserDetails {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @NotEmpty(message = "Username cannot be empty")
    private String username;
    @NotEmpty(message = "Password cannot be empty")
    private String password;
    @Transient
    @NotBlank(message = "Password confirmation cannot be empty")
    private String password2;
 //   @Column(name = "active")
    private boolean active;
    @Email(message = "Email is not correct")
    @NotBlank(message = "Email cannot be empty")
    private String email;
    private String activationCode;

    @ElementCollection(targetClass = Role.class, fetch = FetchType.EAGER)
    @CollectionTable(name = "user_role",joinColumns = @JoinColumn(name = "user_id"))
    @Enumerated(EnumType.STRING)
    private Set<Role> roles;

    public User(String username, String password, boolean active) {
        this.username = username;
        this.password = password;
        this.active = active;
    }

    public User() {

    }

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return getRoles();
    }

    @Override
    public boolean isAccountNonExpired() {
        return true; //UserDetails.super.isAccountNonExpired()
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;//UserDetails.super.isAccountNonLocked()
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;//UserDetails.super.isCredentialsNonExpired()
    }

    @Override
    public boolean isEnabled() {
        return isActive();
    }
}
