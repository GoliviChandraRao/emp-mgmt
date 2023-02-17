package com.chandra.spring.security.login.controllers;

import com.chandra.spring.security.login.repository.EmployeeRepository;
import com.chandra.spring.security.login.security.services.UserDetailsImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@CrossOrigin(origins = "*", maxAge = 3600)
@RestController
@RequestMapping("/myapp")
public class HrController {

    @Autowired
    EmployeeRepository employeeRepository;

    @GetMapping({"/hrpage"})
    @PreAuthorize("hasRole('HR')")
    public ModelAndView adminpage(ModelAndView model, Authentication auth) {
        model.setViewName("hrpage");
        return model;
    }

}
