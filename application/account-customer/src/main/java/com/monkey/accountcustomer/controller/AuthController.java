package com.monkey.accountcustomer.controller;

import com.monkey.accountcustomer.services.AuthService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import result.LoginInput;
import result.Result;
import result.TokenDto;

import javax.servlet.http.HttpServletRequest;

@RestController
public class AuthController {
    private final
    AuthService _authService;

    @Autowired
    public AuthController(AuthService _authService) {
        this._authService = _authService;
    }

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
