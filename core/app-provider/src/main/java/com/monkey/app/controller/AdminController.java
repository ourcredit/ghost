package com.monkey.app.controller;

import annotation.CurrentUser;
import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.monkey.app.application.IIMAdminService;
import com.monkey.app.application.IIMRolePermissionService;
import com.monkey.app.application.IIMRoleService;
import com.monkey.app.application.IIMUserRoleService;
import com.monkey.app.common.JavaBeanUtil;
import com.monkey.app.controller.dtos.AdminDto;
import com.monkey.app.controller.dtos.RoleDto;
import com.monkey.app.entity.*;
import constant.RequestConstant;
import input.PageFilterInputDto;
import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import result.LoginInput;
import result.Result;
import tools.DateUtil;
import tools.JWTUtil;

import javax.servlet.http.HttpServletRequest;
import javax.swing.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
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

    /*获取当前用户信息*/
    @RequestMapping(value = "/current", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
    public Result<Object> current(HttpServletRequest req, @CurrentUser IMAdmin user) {
        ApiResult returnResult = new ApiResult();
        Map<String, Object> returnData = new HashMap<>();
        IMAdmin admin = _adminService.getById(user.getId());
        if (admin == null || admin.getId() == 0) {
            return Result.NotFound();
        }
        Map<String, Object> returnUsers = JavaBeanUtil.convertBeanToMap(admin);
        returnUsers.remove("password");
        LocalDateTime haslogin = admin.getUpdated();
        returnData.put("token", JWTUtil.sign(admin.getUname(), admin.getId(), "88888", "123456789"));
        returnData.put("ipAddress", JWTUtil.getIpAddress(req));
        returnData.put("loginTime", haslogin);
        returnData.put("hasLoginTime", DateUtil.deffTime(haslogin, LocalDateTime.now()));
        returnData.put("userinfo", returnUsers);
        List res = _adminService.getAllPermission(admin.getId());
        returnData.put("access", res);
        returnResult.setCode(ApiResult.SUCCESS);
        returnResult.setData(returnData);
        returnResult.setMessage("获取信息成功!");
        return new Result<Object>(1, RequestConstant.SUCCESSMSG, returnResult);
    }

    /*用户列表*/
    @RequestMapping(value = "/admins", method = RequestMethod.POST)
    public Result<IPage<IMAdmin>> admins(@RequestBody PageFilterInputDto page) throws Exception {
        Wrapper filter = WrapperUtil.toWrapper(page);
        IPage<IMAdmin> res = _adminService.page(WrapperUtil.toPage(page), filter);
        return new Result<>(RequestConstant.SUCCESSCODE, RequestConstant.SUCCESSMSG, res);
    }

    /*用户列表*/
    @RequestMapping(value = "/roles", method = RequestMethod.POST)
    public Result<IPage<IMRole>> roles(@RequestBody PageFilterInputDto page) throws Exception {
        Wrapper filter = WrapperUtil.toWrapper(page);
        IPage<IMRole> res = _roleService.page(WrapperUtil.toPage(page), filter);
        return new Result<>(RequestConstant.SUCCESSCODE, RequestConstant.SUCCESSMSG, res);
    }

    /*更新用户*/
    @RequestMapping(value = "/updateadmin", method = RequestMethod.POST)
    public Result<Object> updateadmin(@RequestBody AdminDto adminInput, @CurrentUser IMAdmin current) throws Exception {
        IMAdmin admin;
        if (adminInput.getId() == null) {
            admin = new IMAdmin();
            admin.setUname(adminInput.getUname());
            admin.setPwd(DigestUtils.md5Hex(adminInput.getPwd()).toLowerCase());
            admin.setCreaterUser(current.getUname());
            admin.setStatus(1);
        } else {
            admin = _adminService.getById(adminInput.getId());
            if (admin == null) return Result.NotFound();
            String pwd = DigestUtils.md5Hex(adminInput.getPwd()).toLowerCase();
            if (admin.getPwd() != pwd) {
                admin.setPwd(pwd);
            }
        }
        Boolean bo = _adminService.saveOrUpdate(admin);
        if (adminInput.getRoleIds() != null && !adminInput.getRoleIds().isEmpty()) {
            Boolean b = _userRoleService.remove(new QueryWrapper<IMUserRole>().eq("userId", admin.getId()));
            if (b) {
                List<IMUserRole> list = new ArrayList<>();
                for (Integer i : adminInput.getRoleIds()) {
                    list.add(new IMUserRole(admin.getId(), i));
                }
                _userRoleService.saveBatch(list);
            }
        }

        return new Result<>(RequestConstant.SUCCESSCODE, RequestConstant.SUCCESSMSG, bo);
    }

    /*更新用户*/
    @RequestMapping(value = "/updaterole", method = RequestMethod.POST)
    public Result<Object> updateRole(@RequestBody RoleDto roleInput) throws Exception {
        IMRole role;
        if (roleInput.getId() == null) {
            role = new IMRole();
            role.setRoleName(roleInput.getRoleName());
            role.setDisplayName(roleInput.getDisplayName());
        } else {
            role = _roleService.getById(roleInput.getId());
            if (role == null) return Result.NotFound();
            role.setDisplayName(roleInput.getDisplayName());
        }
        Boolean bo = _roleService.saveOrUpdate(role);
        if (roleInput.getPermissionIds() != null && !roleInput.getPermissionIds().isEmpty()) {
            Boolean b = _rolePermissionService.remove(new QueryWrapper<IMRolePermission>().eq("roleId", role.getId()));
            if (b) {
                List<IMRolePermission> list = new ArrayList<>();
                for (String i : roleInput.getPermissionIds()) {
                    list.add(new IMRolePermission(role.getId(), i));
                }
                _rolePermissionService.saveBatch(list);
            }
        }
        return new Result<>(RequestConstant.SUCCESSCODE, RequestConstant.SUCCESSMSG, bo);
    }

    /*删除用户*/
    @RequestMapping(value = "/deladmin/{adminId}", method = RequestMethod.GET)
    public Result<Boolean> deladmin(@PathVariable Integer adminId) throws Exception {
        Boolean b = _adminService.removeById(adminId);
        return new Result<>(RequestConstant.SUCCESSCODE, RequestConstant.SUCCESSMSG, b);
    }

    /*删除角色*/
    @RequestMapping(value = "/delrole/{roleId}", method = RequestMethod.GET)
    public Result<Boolean> delrole(@PathVariable Integer roleId) throws Exception {
        Boolean b = _roleService.removeById(roleId);
        return new Result<>(RequestConstant.SUCCESSCODE, RequestConstant.SUCCESSMSG, b);
    }
    /*修改密码*/
    @RequestMapping(value = "/password", method = RequestMethod.POST)
    public Result<Boolean> password(@PathVariable Integer roleId) throws Exception {
        Boolean b = _roleService.removeById(roleId);
        return new Result<>(RequestConstant.SUCCESSCODE, RequestConstant.SUCCESSMSG, b);
    }
}
