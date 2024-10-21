package com.example.sweter.controller;

import org.springframework.security.core.Authentication;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

@ControllerAdvice
public class GlobalControllerAdvice {

    @ModelAttribute
    public void addAttributes(Model model, Authentication authentication) {
        if (authentication != null && authentication.isAuthenticated()) {
            model.addAttribute("isAdmin", authentication.getAuthorities()
                    .stream().anyMatch(grantedAuthority -> grantedAuthority.getAuthority().equals("ADMIN")));
            model.addAttribute("name", authentication.getName());
        }
    }
}

