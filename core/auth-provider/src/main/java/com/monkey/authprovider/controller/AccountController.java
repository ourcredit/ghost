package com.monkey.authprovider.controller;

import com.monkey.authprovider.entity.Account;
import com.monkey.authprovider.repository.AccountRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api/auth/")
public class AccountController {

    @Autowired
    AccountRepository _accountRepository;
    @RequestMapping(value = "/all",method = RequestMethod.GET)
    public List<Account> getall(){
        List<Account> res=_accountRepository.selectList(null);
        return  res;
    }
}
