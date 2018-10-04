package com.monkey.authcustomer.controller;

import com.monkey.authcustomer.services.AuthService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class AuthController {
    @Autowired
    AuthService _authService;
    @GetMapping(value = "/test")
    public  String test(@RequestParam(value = "name")String name){
        return  _authService.test(name);
    }
}
