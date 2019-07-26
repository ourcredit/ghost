package com.monkey.app.controller;

import ListCom.CollectionHelper;
import annotation.CurrentUser;
import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.monkey.app.application.IIMUserFriendsService;
import com.monkey.app.application.impl.IMUserServiceImpl;
import com.monkey.app.entity.IMGroup;
import com.monkey.app.entity.IMUser;
import com.monkey.app.entity.IMUserFriends;
import com.monkey.app.entity.WrapperUtil;
import constant.RequestConstant;
import input.PageFilterInputDto;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import result.Result;

import java.util.ArrayList;
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
@RequestMapping(value = "/api/friend")
@Api(value = "好友Controller", tags = {"好友相关方法"})
public class FriendController {
    @Autowired
    IIMUserFriendsService _friendService;
    @Autowired
    IMUserServiceImpl _userService;

    /*获取当前用户好友的聊天记录*/
    @ApiOperation(value = "获取当前好友的列表以及最新消息记录", tags = {"标签干啥用的"}, notes = "注意current用户字段忽略")
    @RequestMapping(value = "/{uid}", method = RequestMethod.POST)
    public Result<IPage<IMUser>> friends(@RequestBody PageFilterInputDto page,@PathVariable Integer uid) throws Exception {
        List<IMUserFriends> list = _friendService.list(new QueryWrapper<IMUserFriends>().eq("status", 1).eq("friuid", uid));
        List<Integer> ids = new ArrayList<>();
        list.forEach(w -> ids.add(w.getUid()));
        QueryWrapper qw = WrapperUtil.toWrapper(page);
        qw.in("id", ids);
        IPage<IMUser> res = _userService.page(WrapperUtil.toPage(page), qw);
        if (!res.getRecords().isEmpty()) {
            for (IMUser g : res.getRecords()
                    ) {
                String content = _friendService.getNearRecord(g.getId(),uid);
                g.setLastedMessage(content);
            }
        }
        return new Result<>(RequestConstant.SUCCESSCODE, RequestConstant.SUCCESSMSG, res);
    }

    /*获取好友详情*/
    @ApiOperation(value = "获取好友详情")
    @RequestMapping(value = "/{uid}/{fid}", method = RequestMethod.GET)
    public Result<Object> friend(@PathVariable Integer uid, @PathVariable Integer fid) throws Exception {
        IMUserFriends temp = _friendService.getOne(new QueryWrapper<IMUserFriends>().eq("uid", uid).eq("friuid", fid));
        if (temp == null) {
            return new Result<>(RequestConstant.SUCCESSCODE, "当前用户与您并非好友关系", null);
        }
        IMUser user = _userService.getById(fid);
        if (user == null) {
            return Result.NotFound();
        }
        return new Result<>(RequestConstant.SUCCESSCODE, RequestConstant.SUCCESSMSG, user);
    }

    /*获取好友聊天记录*/
    @ApiOperation(value = "获取好友聊天记录列表")
    @RequestMapping(value = "/{uid}/{fid}/content", method = RequestMethod.GET)
    public Result<Object> contents(@PathVariable Integer uid, @PathVariable Integer fid, @RequestBody PageFilterInputDto page) throws Exception {
        IMUser current=_userService.getById(uid);
        IMUserFriends temp = _friendService.getOne(new QueryWrapper<IMUserFriends>().eq("uid", uid).eq("friuid", fid));
        if (temp == null) {
            return new Result<>(RequestConstant.SUCCESSCODE, "当前用户与您并非好友关系", null);
        }
        IMUser user = _userService.getById(fid);
        if (user == null) {
            return Result.NotFound();
        }
        IPage<Map<String, Object>> res = _friendService.getRecordsByUserId(WrapperUtil.toPage(page),uid, user.getId());
        for (Map map : res.getRecords()
                ) {
            String fromid = map.get("fromid").toString();
            if (uid.toString().equals(fromid)) {
                map.put("fromName", current.getNickname());
                map.put("fromavator", current.getAvatar());
                map.put("toName", user.getNickname());
                map.put("toAvator", user.getAvatar());
            } else {
                map.put("fromName", user.getNickname());
                map.put("fromavator", user.getAvatar());
                map.put("toName", current.getNickname());
                map.put("toAvator", current.getAvatar());
            }
        }
        return new Result<>(RequestConstant.SUCCESSCODE, RequestConstant.SUCCESSMSG, res);
    }
}
