package com.monkey.account.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.monkey.account.application.IAccountService;
import com.monkey.account.entity.Account;
import constant.JwtTokenConstant;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import result.LoginInput;
import result.Result;
import result.TokenDto;
import tools.JWTUtil;

@RestController
@RequestMapping(value = "/base/token" ,produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
public class AuthController {
    final
    IAccountService _accountService;

    @Autowired
    public AuthController(IAccountService _accountService) {
        this._accountService = _accountService;
    }

    @RequestMapping(value = "",method = RequestMethod.POST)
    public Result auth(@RequestBody LoginInput input){
        QueryWrapper q=new QueryWrapper<Account>();
        q.eq("account",input.getAccount());
        Account res=_accountService.getOne(q);
        if(res==null)return Result.NotFound();
        if(!res.getPassword().equals(input.getPassword()))return new Result<>(-1,"用户名或密码错误",null);
        //  if(res.getIs_active()!=1)return new Result<>(-1,"用户状态被禁用",null);
        String token=  JWTUtil.sign(res.getUserName(),res.getId(),1, JwtTokenConstant.Secret);
        TokenDto t=new TokenDto(res.getId(),token,res.getUserName(),res.getUserName());
        return new Result<>(1, "成功", t);
    }

}
