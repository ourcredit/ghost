package com.monkey.authcustomer.controller;

import com.monkey.authcustomer.services.AuthService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import result.LoginInput;
import result.Result;
import result.TokenDto;

import javax.servlet.http.HttpServletRequest;

@RestController
public class AuthController {
    @Autowired
    AuthService _authService;
    @PostMapping(value = "auth/login")
    public Result<TokenDto> login(@RequestBody LoginInput input){
        return  _authService.auth(input);
    }
    @GetMapping(value = "auth/all")
    public Result all(HttpServletRequest request){
        request.getRequestURL();
        Result r=  _authService.all();
        return  r;
    }
}
