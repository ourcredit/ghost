package com.monkey.authcustomer.services;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@FeignClient(value = "auth-provider",fallback = AuthHystric.class)
public interface AuthService {
    @RequestMapping(value = "test",method = RequestMethod.GET)
    String test(@RequestParam(value = "name") String name);
}
