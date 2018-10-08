package com.monkey.authprovider.controllers;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.monkey.authprovider.application.IUserService;
import com.monkey.authprovider.controllers.filters.UserLoginInput;
import com.monkey.authprovider.core.User;

import input.PageFilterInputDto;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import result.NgUserModel;
import result.Result;
import tools.ComUtil;

import java.util.Date;

@RestController
@RequestMapping(value = "/api/user")
public class UserController {
    @Autowired
    IUserService _userService;
    @RequestMapping(value = "", method = RequestMethod.POST)
    public Result<Page<User>> users(@RequestBody PageFilterInputDto page) throws Exception {
        EntityWrapper<User> filter = new EntityWrapper<User>();
        filter = ComUtil.genderFilter(filter, page.getWhere());
        Page<User> res = _userService.selectPage(new Page<>(page.getIndex(), page.getSize()), null );
        return new Result<>(1,"", res);
    }
    private Logger logger = LoggerFactory.getLogger(UserController.class);


    @RequestMapping(value = "/login",method = RequestMethod.POST)
    public Result<NgUserModel> login(@RequestBody UserLoginInput input) throws Exception{
        if (ComUtil.isEmpty(input.getUsername()) || ComUtil.isEmpty(input.getPassword())) {
            return new Result<NgUserModel>(-1, "用户名密码不能为空",null);
        }
     EntityWrapper e=new EntityWrapper();
        e.eq("account",input.getUsername());
        User user = _userService.selectOne(e);
        if (ComUtil.isEmpty(user) ) {
            return new Result<>(-1, "密码错误",null);
        }
        user.setLastLoginTime(new Date());
        _userService.updateById(user);
        NgUserModel u= new NgUserModel();
        return new Result<>(1,"", u);
    }


}
