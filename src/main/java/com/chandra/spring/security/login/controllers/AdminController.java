package com.chandra.spring.security.login.controllers;

import com.chandra.spring.security.login.models.Employee;
import com.chandra.spring.security.login.payload.response.MessageResponse;
import com.chandra.spring.security.login.repository.EmployeeRepository;
import com.chandra.spring.security.login.security.services.UserDetailsImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

@CrossOrigin(origins = "*", maxAge = 3600)
@RestController
@RequestMapping("/myapp")
public class AdminController {

    @Autowired
    EmployeeRepository employeeRepository;

    @GetMapping({"/adminpage"})
    @PreAuthorize("hasRole('ADMIN')")
    public ModelAndView adminpage(ModelAndView model, Authentication auth) {
        UserDetailsImpl userDetails = (UserDetailsImpl) auth.getPrincipal();
        model.setViewName("adminpage");
        return model;
    }

}
