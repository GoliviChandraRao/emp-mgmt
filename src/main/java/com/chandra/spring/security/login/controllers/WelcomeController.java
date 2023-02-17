package com.chandra.spring.security.login.controllers;

import com.chandra.spring.security.login.repository.RoleRepository;
import com.chandra.spring.security.login.repository.UserRepository;
import com.chandra.spring.security.login.security.jwt.JwtUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@CrossOrigin(origins = "*", maxAge = 3600)
@RestController
@RequestMapping("/")
public class WelcomeController {
    @Autowired
    AuthenticationManager authenticationManager;

    @Autowired
    UserRepository userRepository;

    @Autowired
    RoleRepository roleRepository;

    @Autowired
    PasswordEncoder encoder;

    @Autowired
    JwtUtils jwtUtils;

    private boolean isAuthenticated() {
        try {
            Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
            if (authentication == null || AnonymousAuthenticationToken.class.
                    isAssignableFrom(authentication.getClass())) {
                return false;
            }
            return authentication.isAuthenticated();
        } catch (Exception e) {
        }
        return false;
    }

    private boolean isAdmin() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        return authentication != null && authentication.getAuthorities().stream().anyMatch(a -> a.getAuthority().equalsIgnoreCase("ROLE_ADMIN"));
    }

    private boolean isHr() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        return authentication != null && authentication.getAuthorities().stream().anyMatch(a -> a.getAuthority().equalsIgnoreCase("ROLE_HR"));
    }


    @GetMapping({"/", "/myapp"})
    public ModelAndView login(ModelAndView model) {
        String pageName = "login";
        if (isAuthenticated()) {
            pageName = isAdmin() ? "adminpage" : isHr() ? "hrpage" : "employeepage";
        }
        model.setViewName(pageName);
        return model;
    }

    @GetMapping({"myapp/usersignup"})
    public ModelAndView registration(ModelAndView model) {
        String pageName = "registration";

        if (isAuthenticated()) {
            pageName = isAdmin() ? "adminpage" : isHr() ? "hrpage" : "employeepage";
        }
        model.setViewName(pageName);

        return model;
    }
}
