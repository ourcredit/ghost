package com.monkey.accountcustomer.controller;

import com.monkey.accountcustomer.services.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import result.LoginInput;
import result.Result;
import result.TokenDto;

import javax.servlet.http.HttpServletRequest;

@RestController
@RequestMapping(value = "/account")
public class AccountController {
    private final AccountService _authService;

    @Autowired
    public AccountController(AccountService _authService) {
        this._authService = _authService;
    }

    @PostMapping(value = "/login")
    public Result<TokenDto> login(@RequestBody LoginInput input){
        return  _authService.auth(input);
    }
    @GetMapping(value = "/list")
    public Result all(HttpServletRequest request){
        request.getRequestURL();
        Result r=  _authService.all();
        return  r;
    }
}
