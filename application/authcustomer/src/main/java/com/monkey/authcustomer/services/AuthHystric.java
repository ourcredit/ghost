package com.monkey.authcustomer.services;

import org.springframework.stereotype.Component;

@Component
public class AuthHystric implements AuthService {
    @Override
    public String test(String name) {
        return "net error";
    }
}
