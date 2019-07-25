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
@RequestMapping(value = "/api/friend")
public class FriendController {
    @Autowired
    IIMUserFriendsService _friendService;
    @Autowired
    IMUserServiceImpl _userService;

    /*获取当前用户好友的聊天记录*/
    @RequestMapping(value = "", method = RequestMethod.POST)
    public Result<IPage<IMUserFriends>> friends(@RequestBody PageFilterInputDto page, @CurrentUser IMUser current) throws Exception {
        Wrapper filter = WrapperUtil.toWrapper(page);
        QueryWrapper qw = (QueryWrapper) filter;
        qw.eq("uid", current.getId());
        IPage<IMUserFriends> res = _friendService.page(WrapperUtil.toPage(page), qw);
        if (!res.getRecords().isEmpty()) {
            for (IMUserFriends g : res.getRecords()
                    ) {
                Integer relationId = g.getUid() + g.getFriuid();
                String tableName = "on_IMMessage_" + relationId % 8;
                String content = _friendService.getNearRecord(tableName, relationId);
                g.setLastedMessage(content);
            }
        }
        return new Result<>(RequestConstant.SUCCESSCODE, RequestConstant.SUCCESSMSG, res);
    }

    /*获取好友详情*/
    @RequestMapping(value = "/{fid}", method = RequestMethod.GET)
    public Result<Object> friend(@PathVariable Integer fid, @CurrentUser IMUser current) throws Exception {
        IMUserFriends temp = _friendService.getOne(new QueryWrapper<IMUserFriends>().eq("uid", current.getId()).eq("friuid", fid));
        if (temp == null) {
            return new Result<>(RequestConstant.SUCCESSCODE, "当前用户与您并非好友关系", null);
        }
        IMUser user = _userService.getById(fid);
        if (user == null) {
            return Result.NotFound();
        }
        return new Result<>(RequestConstant.SUCCESSCODE, RequestConstant.SUCCESSMSG, user);
    }
    /*获取好友详情*/
    @RequestMapping(value = "/{fid}/content", method = RequestMethod.GET)
    public Result<Object> contents(@PathVariable Integer fid,@RequestBody PageFilterInputDto page, @CurrentUser IMUser current) throws Exception {
        IMUserFriends temp = _friendService.getOne(new QueryWrapper<IMUserFriends>().eq("uid", current.getId()).eq("friuid", fid));
        if (temp == null) {
            return new Result<>(RequestConstant.SUCCESSCODE, "当前用户与您并非好友关系", null);
        }
        IMUser user = _userService.getById(fid);
        if (user == null) {
            return Result.NotFound();
        }

        return new Result<>(RequestConstant.SUCCESSCODE, RequestConstant.SUCCESSMSG, user);
    }
}
