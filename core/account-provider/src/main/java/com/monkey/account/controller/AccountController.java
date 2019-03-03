package com.monkey.account.controller;


import com.baomidou.mybatisplus.core.metadata.IPage;
import com.monkey.account.application.IAccountService;
import com.monkey.account.entity.Account;
import com.monkey.account.entity.WrapperUtil;
import input.EntityInput;
import input.PageFilterInputDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;

import result.Result;

import java.util.List;

/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author zhaohejing
 * @since 2019-03-03
 */
@RestController
@RequestMapping(value = "/base/account", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
public class AccountController {
    @Autowired
    IAccountService _accountService;

    @RequestMapping(value = "", method = RequestMethod.POST)
    public Result<IPage<Account>> list(PageFilterInputDto input) {
        IPage<Account> res = _accountService.page(WrapperUtil.toPage(input), WrapperUtil.toWrapper(input));
        return Result.Success(res);
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public Result<Account> get(@PathVariable Integer input) {
        Account res = _accountService.getById(input);
        return Result.Success(res);
    }

    @RequestMapping(value = "", method = RequestMethod.PUT)
    public Result<Account> modify(@RequestBody Account input) {
        Boolean res = _accountService.saveOrUpdate(input);
        return Result.Success(res);
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    public Result<Account> delete(@PathVariable Integer input) {
        Boolean res = _accountService.removeById(input);
        return Result.Success(res);
    }

    @RequestMapping(value = "", method = RequestMethod.DELETE)
    public Result<Account> deletes(@RequestBody List<Integer> input) {
        Boolean res = _accountService.removeByIds(input);
        return Result.Success(res);
    }
}
