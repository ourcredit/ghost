package com.monkey.appcustomer.services;

import com.monkey.appcustomer.config.FeignConfig;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import result.LoginInput;
import result.Result;

@FeignClient(value = "account-provider",fallback = AccountHystric.class,configuration = FeignConfig.class)
public interface AccountService {
    @PostMapping(value = "/base/account")
    Result auth(@RequestBody LoginInput input);
    @GetMapping(value = "/api/all")
    Result all();
}
