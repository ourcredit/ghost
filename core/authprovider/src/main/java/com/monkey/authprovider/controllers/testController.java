package com.monkey.authprovider.controllers;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class testController {
    @Value("${foo}")
    String foo;
    @GetMapping(value = "/hi")
    public String test(){
        return foo;
    }
}
