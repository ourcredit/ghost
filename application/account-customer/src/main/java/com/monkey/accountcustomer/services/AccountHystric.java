package com.monkey.accountcustomer.services;

import org.springframework.stereotype.Component;
import result.LoginInput;
import result.Result;

@Component
public class AccountHystric implements AccountService {

    @Override
    public Result auth(LoginInput input) {
        return  Result.NotFound();
    }

    @Override
    public Result all() {
        return Result.NotFound();
    }
}
