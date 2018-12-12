package com.monkey.authprovider.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.monkey.authprovider.application.account.IAccountService;
import com.monkey.authprovider.entity.Role;
import com.monkey.authprovider.entity.WrapperUtil;
import input.EntityInput;
import input.PageFilterInputDto;
import org.springframework.web.bind.annotation.*;
import com.monkey.authprovider.entity.Account;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import result.Result;

import java.util.List;

@RestController
@RequestMapping(value = "/api/account" ,produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
public class AccountController {

    @Autowired
    IAccountService _accountService;

    @RequestMapping(value = "",method = RequestMethod.GET)
    public Result<IPage<Role>> list(PageFilterInputDto input){
        IPage<Role> res=  _accountService.page(WrapperUtil.toPage(input),WrapperUtil.toWrapper(input));
        return Result.Success(res);
    }
    @RequestMapping(value = "/{id}",method = RequestMethod.GET)
    public Result<Account> get(@PathVariable EntityInput<Integer> input){
        Account res=  _accountService.getById(input.getId());
        return Result.Success(res);
    }
    @RequestMapping(value = "",method = RequestMethod.PUT)
    public Result<Account> modify(@RequestBody Account input){
        Boolean res=  _accountService.saveOrUpdate(input);
        return Result.Success(res);
    }
    @RequestMapping(value = "/{id}",method = RequestMethod.DELETE)
    public Result<Role> delete(@PathVariable EntityInput<Integer> input){
        Boolean res=  _accountService.removeById(input);
        return Result.Success(res);
    }
    @RequestMapping(value = "",method = RequestMethod.DELETE)
    public Result<Role> deletes(@RequestBody List<Integer> input){
        Boolean res=  _accountService.removeByIds(input);
        return Result.Success(res);
    }
}
