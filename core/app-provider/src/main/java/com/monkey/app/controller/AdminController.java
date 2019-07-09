package com.monkey.app.controller;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.monkey.app.application.IIMAdminService;
import com.monkey.app.application.IIMRolePermissionService;
import com.monkey.app.application.IIMRoleService;
import com.monkey.app.application.IIMUserRoleService;
import com.monkey.app.common.JavaBeanUtil;
import com.monkey.app.entity.ApiResult;
import com.monkey.app.entity.IMAdmin;
import com.monkey.app.entity.IMUser;
import com.monkey.app.entity.WrapperUtil;
import constant.RequestConstant;
import input.PageFilterInputDto;
import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import result.LoginInput;
import result.Result;
import tools.DateUtil;
import tools.JWTUtil;

import javax.servlet.http.HttpServletRequest;
import java.time.LocalDateTime;
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
@RequestMapping(value = "/api/admin")
public class AdminController {
    @Autowired
    IIMAdminService _adminService;
    @Autowired
    IIMRoleService _roleService;
    @Autowired
    IIMRolePermissionService _rolePermissionService;
    @Autowired
    IIMUserRoleService _userRoleService;

    /*后台登陆接口*/
    @RequestMapping(value = "/login", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    public Result<Object> checkLogin(HttpServletRequest req, @RequestBody LoginInput input) {
        ApiResult returnResult = new ApiResult();
        Map<String, Object> returnData = new HashMap<>();
        String username = input.getAccount();
        String password = input.getPassword();
        IMAdmin admin = _adminService.getOne(new QueryWrapper<IMAdmin>().eq("uname", username));
        if (admin == null || admin.getId() == 0) {
            return Result.NotFound();
        }
        password = DigestUtils.md5Hex(password).toLowerCase();
        if (!admin.getPwd().equals(password)) {
            return new Result<>(RequestConstant.ERRORCODE, "密码错误", null);
        }
        Map<String, Object> returnUsers = JavaBeanUtil.convertBeanToMap(admin);
        LocalDateTime haslogin = admin.getUpdated();
        admin.setUpdated(LocalDateTime.now());
        _adminService.updateById(admin);

        returnUsers.remove("password");
        returnData.put("token", JWTUtil.sign(admin.getUname(), admin.getId(), "88888", "123456789"));
        returnData.put("ipAddress", JWTUtil.getIpAddress(req));
        returnData.put("loginTime", haslogin);
        returnData.put("hasLoginTime", DateUtil.deffTime(haslogin, LocalDateTime.now()));
        returnData.put("userinfo", returnUsers);
        List res = _adminService.getAllPermission(admin.getId());
        returnData.put("access", res);
        returnResult.setCode(ApiResult.SUCCESS);
        returnResult.setData(returnData);
        returnResult.setMessage("登录成功!");
        return new Result<>(1, RequestConstant.SUCCESSMSG, returnResult);
    }
}
