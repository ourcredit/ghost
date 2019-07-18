package com.monkey.app.controller;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.monkey.app.application.impl.IMGroupMemberServiceImpl;
import com.monkey.app.application.impl.IMGroupServiceImpl;
import com.monkey.app.application.impl.IMUserServiceImpl;
import com.monkey.app.entity.IMGroup;
import com.monkey.app.entity.IMGroupMember;
import com.monkey.app.entity.IMUser;
import com.monkey.app.entity.WrapperUtil;
import constant.RequestConstant;
import input.PageFilterInputDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import result.Result;

import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author cloudtalk
 * @since 2019-01-04
 */
@RestController
@RequestMapping(value = "/api/group")
public class GroupController {
    @Autowired
    IMGroupServiceImpl _groupService;
    @Autowired
    IMGroupMemberServiceImpl _groupMemberService;
    @Autowired
    IMUserServiceImpl _userService;

    /*用户列表*/
    @RequestMapping(value = "", method = RequestMethod.POST)
    public Result<IPage<IMGroup>> groups(@RequestBody PageFilterInputDto page) throws Exception {
        Wrapper filter = WrapperUtil.toWrapper(page);
        IPage<IMGroup> res = _groupService.page(WrapperUtil.toPage(page), filter);
        if (!res.getRecords().isEmpty()) {
            List<Integer> arr = new ArrayList();
            res.getRecords().forEach(w -> arr.add(w.getId()));
            for (IMGroup g : res.getRecords()
                    ) {

            }
        }
        return new Result<>(RequestConstant.SUCCESSCODE, RequestConstant.SUCCESSMSG, res);
    }

    /*用户列表*/
    @RequestMapping(value = "/{groupId}", method = RequestMethod.GET)
    public Result<Object> group(@PathVariable Integer groupId) throws Exception {
        IMGroup res = _groupService.getById(groupId);
        if (res == null) return Result.NotFound();
        IMUser creater = _userService.getOne(new QueryWrapper<IMUser>().eq("id", res.getCreator()));
        if (creater != null) {
            res.setCreaterModel(creater);
        }
        return new Result<>(RequestConstant.SUCCESSCODE, RequestConstant.SUCCESSMSG, res);
    }

    /*获取群组下用户列表*/
    @RequestMapping(value = "/members", method = RequestMethod.POST)
    public Result<IPage<IMUser>> groupmember(@RequestBody PageFilterInputDto page) throws Exception {
        Wrapper filter = WrapperUtil.toWrapper(page);
        String groupId = page.getWhere().get("groupId").toString();

        IPage<IMUser> res = _userService.getGroupMembers(WrapperUtil.toPage(page), Integer.parseInt(groupId));
        return new Result<>(RequestConstant.SUCCESSCODE, RequestConstant.SUCCESSMSG, res);
    }

    /*获取群组聊天记录*/
    @RequestMapping(value = "/record", method = RequestMethod.POST)
    public Result<IPage<IMUser>> grouprecord(@RequestBody PageFilterInputDto page) throws Exception {
        String groupId = page.getWhere().get("groupId").toString();
        IPage<IMUser> res = _userService.getGroupMembers(WrapperUtil.toPage(page), Integer.parseInt(groupId));
        return new Result<>(RequestConstant.SUCCESSCODE, RequestConstant.SUCCESSMSG, res);
    }

    /*删除群组*/
    @RequestMapping(value = "/delgroup/{groupId}", method = RequestMethod.GET)
    public Result<Boolean> delgroup(@PathVariable Integer groupId) throws Exception {

        Boolean b = _groupService.removeById(groupId);
        if (b) {
            _groupMemberService.remove(new QueryWrapper<IMGroupMember>().eq("groupId", groupId));
        }
        return new Result<>(RequestConstant.SUCCESSCODE, RequestConstant.SUCCESSMSG, b);
    }
}
