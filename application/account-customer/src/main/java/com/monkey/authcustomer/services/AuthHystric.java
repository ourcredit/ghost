package com.monkey.authcustomer.services;

import org.springframework.stereotype.Component;
import result.LoginInput;
import result.Result;

@Component
public class AuthHystric implements AuthService {

    @Override
    public Result auth(LoginInput input) {
        return  Result.NotFound();
    }

    @Override
    public Result all() {
        return Result.NotFound();
    }
}
