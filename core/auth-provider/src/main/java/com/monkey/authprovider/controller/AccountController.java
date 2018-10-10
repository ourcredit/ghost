package com.monkey.authprovider.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import result.LoginInput;
import result.TokenDto;
import com.monkey.authprovider.entity.Account;
import com.monkey.authprovider.repository.AccountRepository;
import constant.JwtTokenConstant;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import result.Result;
import tools.JWTUtil;

import java.util.List;

@RestController
@RequestMapping(value = "/api" ,produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
public class AccountController {

    @Autowired
    AccountRepository _accountRepository;

    @RequestMapping(value = "/all",method = RequestMethod.GET)
    public Result<List<Account>> getall(){
        List<Account> res=_accountRepository.selectList(null);
        return new Result<>(1, "", res);
    }

    @RequestMapping(value = "/auth",method = RequestMethod.POST)
    public Result auth(@RequestBody LoginInput input){
        QueryWrapper q=new QueryWrapper<Account>();
        q.eq("account",input.getAccount());
        Account res=_accountRepository.selectOne(q);
        if(res==null)return Result.NotFound();
        if(!res.getPassword().equals(input.getPassword()))return new Result<>(-1,"用户名或密码错误",null);
      //  if(res.getIs_active()!=1)return new Result<>(-1,"用户状态被禁用",null);
      String token=  JWTUtil.sign(res.getUserName(),res.getId(),res.getTenantId(), JwtTokenConstant.Secrit);
      TokenDto t=new TokenDto(res.getId(),token,res.getUserName(),res.getTenantId());
        return new Result<>(1, "成功", t);
    }
}
