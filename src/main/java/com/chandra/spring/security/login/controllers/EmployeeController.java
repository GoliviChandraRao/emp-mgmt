package com.chandra.spring.security.login.controllers;

import com.chandra.spring.security.login.models.Employee;
import com.chandra.spring.security.login.payload.request.EmployeeRequest;
import com.chandra.spring.security.login.payload.response.MessageResponse;
import com.chandra.spring.security.login.repository.EmployeeRepository;
import com.chandra.spring.security.login.repository.UserRepository;
import com.chandra.spring.security.login.security.services.UserDetailsImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;

@CrossOrigin(origins = "*", maxAge = 3600)
@RestController
@RequestMapping("/myapp")
public class EmployeeController {

    @Autowired
    EmployeeRepository employeeRepository;


    @Autowired
    UserRepository userRepository;

    @GetMapping({"/employeepage"})
    @PreAuthorize("hasRole('EMPLOYEE')")
    public ModelAndView bcForm(ModelAndView model, Authentication auth) {
        model.addObject("employeesList", employeeRepository.findAll());
        model.setViewName("employeepage");
        return model;
    }

    @PostMapping({"/employeepage"})
    @PreAuthorize("hasRole('EMPLOYEE')")
    public ResponseEntity<?> requestForBC(@Valid @RequestBody EmployeeRequest req, Authentication auth) {
        Employee employee = Employee.buildEmployeeFromReq(req);
        UserDetailsImpl userDetails = (UserDetailsImpl) auth.getPrincipal();
        employeeRepository.save(employee);
        return ResponseEntity.ok(new MessageResponse("requested successfully"));
    }

}
