package com.monkey.authprovider.controller;


import com.baomidou.mybatisplus.core.metadata.IPage;
import com.monkey.authprovider.application.role.IRoleService;
import com.monkey.authprovider.entity.Role;
import com.monkey.authprovider.entity.WrapperUtil;
import input.EntityInput;
import input.PageFilterInputDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;

import result.Result;

import java.util.List;


/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author zhaohejing
 * @since 2018-10-24
 */
@RestController
@RequestMapping(value = "/api/role" ,produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
public class RoleController {
    @Autowired
    IRoleService _roleService;

    @RequestMapping(value = "",method = RequestMethod.GET)
    public Result<IPage<Role>> list(PageFilterInputDto input){
       IPage<Role> res=  _roleService.page(WrapperUtil.toPage(input),WrapperUtil.toWrapper(input));
        return Result.Success(res);
    }
    @RequestMapping(value = "/{id}",method = RequestMethod.GET)
    public Result<Role> get(@PathVariable EntityInput<Integer> input){
        Role res=  _roleService.getById(input.getId());
        return Result.Success(res);
    }
    @RequestMapping(value = "",method = RequestMethod.PUT)
    public Result<Role> modify(@RequestBody Role input){
        Boolean res=  _roleService.saveOrUpdate(input);
        return Result.Success(res);
    }
    @RequestMapping(value = "/{id}",method = RequestMethod.DELETE)
    public Result<Role> delete(@PathVariable EntityInput<Integer> input){
        Boolean res=  _roleService.removeById(input);
        return Result.Success(res);
    }
    @RequestMapping(value = "",method = RequestMethod.DELETE)
    public Result<Role> deletes(@RequestBody List<Integer> input){
        Boolean res=  _roleService.removeByIds(input);
        return Result.Success(res);
    }
}
