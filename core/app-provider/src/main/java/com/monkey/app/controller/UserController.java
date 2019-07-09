package com.monkey.app.controller;

import annotation.CurrentUser;
import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.monkey.app.application.IIMUserService;
import com.monkey.app.common.ControllerUtil;
import com.monkey.app.common.JavaBeanUtil;
import com.monkey.app.entity.*;
import constant.RequestConstant;
import input.PageFilterInputDto;
import org.apache.commons.codec.digest.DigestUtils;
import org.apache.tomcat.jni.Local;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import result.LoginInput;
import result.Result;
import tools.DateUtil;
import tools.JWTUtil;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

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
public class UserController {
    @Autowired
    IIMUserService _userService;
    @Resource
    ControllerUtil controllerUtil;
    /*用户列表*/
    @RequestMapping(value = "/list", method = RequestMethod.POST)
    // @RequiresPermissions(value = {PermissionConst._devices._device.list})
    public Result<IPage<IMUser>> users(@RequestBody PageFilterInputDto page) throws Exception {
        Wrapper filter = WrapperUtil.toWrapper(page);
        IPage<IMUser> res = _userService.page(WrapperUtil.toPage(page), filter);
        return new Result<>(RequestConstant.SUCCESSCODE, RequestConstant.SUCCESSMSG, res);
    }
}
