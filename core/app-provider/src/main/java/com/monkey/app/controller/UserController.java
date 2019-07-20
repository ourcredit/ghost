package com.monkey.app.controller;

import annotation.CurrentUser;
import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.monkey.app.application.IIMUserService;
import com.monkey.app.application.impl.IMUserExtendServiceImpl;
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
import java.util.List;
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
    @Autowired
    IMUserExtendServiceImpl _extendService;
    @Resource
    ControllerUtil controllerUtil;
    /*用户列表*/
    @RequestMapping(value = "", method = RequestMethod.POST)
    public Result<IPage<IMUser>> users(@RequestBody PageFilterInputDto page) throws Exception {
        Wrapper filter = WrapperUtil.toWrapper(page);
        IPage<IMUser> res = _userService.page(WrapperUtil.toPage(page), filter);
        return new Result<>(RequestConstant.SUCCESSCODE, RequestConstant.SUCCESSMSG, res);
    }

    /*用户详情*/
    @RequestMapping(value = "/{userId}", method = RequestMethod.POST)
    public Result<Object> user(@PathVariable Integer userId) throws Exception {
        IMUser user = _userService.getById(userId);
        if (user == null) return Result.NotFound();

        return new Result<>(RequestConstant.SUCCESSCODE, RequestConstant.SUCCESSMSG, null);
    }
    /*获取同步记录*/
    @RequestMapping(value = "/extend", method = RequestMethod.POST)
    public Result<IPage<IMUserExtend>> getExtend(@RequestBody PageFilterInputDto page) throws Exception {
        Wrapper filter = WrapperUtil.toWrapper(page);
        IPage<IMUserExtend> res = _extendService.page(WrapperUtil.toPage(page), filter);
        return new Result<>(RequestConstant.SUCCESSCODE, RequestConstant.SUCCESSMSG, res);
    }
    /*同步记录*/
    @RequestMapping(value = "/{type}/extend", method = RequestMethod.POST)
    public Result<Object> extend(@PathVariable Integer type, @RequestBody List<IMUserExtend> extend, @CurrentUser IMUser user) throws Exception {
        if (user == null) return Result.AuthNotAllow();
        if(extend.isEmpty())return Result.NotFound();
        _extendService.remove(new QueryWrapper<IMUserExtend>().eq("type",type));
        extend.forEach(w->{
            w.setUserId(user.getId());
            w.setType(type);
        });
      Boolean res=  _extendService.saveBatch(extend);
        return new Result<>(RequestConstant.SUCCESSCODE, RequestConstant.SUCCESSMSG, res);
    }
}
