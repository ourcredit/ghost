package com.monkey.app.controller;

import annotation.CurrentUser;
import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.monkey.app.application.IIMUserService;
import com.monkey.app.common.JavaBeanUtil;
import com.monkey.app.entity.*;
import constant.RequestConstant;
import input.PageFilterInputDto;
import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import result.LoginInput;
import result.Result;
import tools.JWTUtil;

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

    @RequestMapping(value = "", method = RequestMethod.POST)
    // @RequiresPermissions(value = {PermissionConst._devices._device.list})
    public Result<IPage<IMUser>> users(@RequestBody PageFilterInputDto page, @CurrentUser IMUser user) throws Exception {
        Wrapper filter = WrapperUtil.toWrapper(page);
        IPage<IMUser> res = _userService.page(WrapperUtil.toPage(page), filter);
        return new Result<>(RequestConstant.SUCCESSCODE, RequestConstant.SUCCESSMSG, res);
    }
    @RequestMapping(value = "/testlogin", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    public Result<Object> checkLogin(@RequestBody LoginInput input) {
        ApiResult returnResult = new ApiResult();
        Map<String, Object> returnData = new HashMap<>();
        ServerInfoEntity serverinfo = new ServerInfoEntity();
        Map<String, Object> bmqq_plugin = new HashMap<>();
        String appid = input.getTenantName();
        String username = input.getAccount();
        String password = input.getPassword();
        IMUser users = _userService.getOne(new QueryWrapper<IMUser>().eq("appId", appid).eq("username", username));
        if (users == null || users.getId() == 0) {
           return  Result.NotFound();
        }
        password = DigestUtils.md5Hex(password + users.getSalt()).toLowerCase();
        if (!users.getPassword().equals(password)) {
            return new Result<>(RequestConstant.ERRORCODE,"密码错误",null);
        }
        Map<String, Object> returnUsers = JavaBeanUtil.convertBeanToMap(users);
        returnUsers.put("peerId", users.getId());
        returnUsers.remove("password");

        returnData.put("token", JWTUtil.sign(users.getUsername(), users.getId(), users.getAppId(), users.getSalt()));
        returnData.put("userinfo", returnUsers);
        returnData.put("serverinfo", serverinfo);
        returnData.put("bqmmplugin", bmqq_plugin);
        _userService.updateById(users);
        returnResult.setCode(ApiResult.SUCCESS);
        returnResult.setData(returnData);
        returnResult.setMessage("登录成功!");
        return new Result<Object>(1,RequestConstant.SUCCESSMSG,returnResult);
    }

}
