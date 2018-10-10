package com.monkey.authcustomer.services;

import com.monkey.authcustomer.config.FeignConfig;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import result.LoginInput;
import result.Result;

@FeignClient(value = "auth-provider",fallback = AuthHystric.class,configuration = FeignConfig.class)
public interface AuthService {
    @PostMapping(value = "/api/auth")
    Result auth(@RequestBody LoginInput input);
    @GetMapping(value = "/api/all")
    Result all();
}
