package com.monkey.app.controller;


import java.util.*;

import javax.annotation.Resource;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.monkey.app.application.IIMUserService;
import com.monkey.app.common.ControllerUtil;
import com.monkey.app.common.JavaBeanUtil;
import com.monkey.app.entity.*;
import com.monkey.tenant.ApplicationContext;
import com.monkey.tenant.CurrentTenant;
import constant.RequestConstant;
import input.PageFilterInputDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import result.Result;

/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author cloudtalk
 * @since 2019-01-04
 */
@RestController
@RequestMapping(value = "/api/user")
public class UserController extends BaseController {
    @Autowired
    IIMUserService _userService;

    @RequestMapping(value = "", method = RequestMethod.POST)
    // @RequiresPermissions(value = {PermissionConst._devices._device.list})
    public Result<IPage<IMUser>> users(@RequestBody PageFilterInputDto page) throws Exception {
        Wrapper filter = WrapperUtil.toWrapper(page);
        IPage<IMUser> res = _userService.page(WrapperUtil.toPage(page), filter);
        return new Result<>(RequestConstant.SUCCESSCODE, RequestConstant.SUCCESSMSG, res);
    }
}
