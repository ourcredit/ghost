package com.monkey.app.controller;


import java.time.LocalDateTime;
import java.util.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import annotation.CurrentUser;
import com.alibaba.fastjson.JSON;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.ctrip.framework.apollo.core.utils.StringUtils;
import com.monkey.app.application.*;
import com.monkey.app.application.impl.IMUserExtendServiceImpl;
import com.monkey.app.common.ControllerUtil;
import com.monkey.app.common.JavaBeanUtil;
import com.monkey.app.entity.*;
import com.monkey.app.config.RedisCacheHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Sort;
import org.springframework.data.geo.GeoResult;
import org.springframework.data.geo.GeoResults;
import org.springframework.data.redis.connection.RedisGeoCommands;
import org.springframework.web.bind.annotation.*;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;

import org.apache.commons.codec.digest.DigestUtils;
import tools.AddressUtil;
import tools.DateUtil;
import tools.JWTUtil;

/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author cloudtalk
 * @since 2019-01-04
 */
@RestController
@RequestMapping(value = "/api")
public class ApiController {

    @Value("${cloudtalk.bqmmplugin.appid}")
    public String bqmmplugin_appid;
    @Value("${cloudtalk.bqmmplugin.appsecret}")
    public String bqmmplugin_appsecret;
    @Value("${cloudtalk.files.msfsprior}")
    public String files_msfsprior;
    @Value("${cloudtalk.files.msfspriorbackup}")
    public String files_msfspriorbackup;

    @Resource
    RedisCacheHelper redisHelper;
    @Resource
    JavaBeanUtil javaBeanUtil;
    @Resource
    ControllerUtil controllerUtil;


    @Resource
    @Qualifier(value = "imUserService")
    private IIMUserService iimUserService;

   @Autowired
    IMUserExtendServiceImpl extendService;
    @Resource
    @Qualifier(value = "imUserGeoDataService")
    private IIMUserGeoDataService iimUserGeoDataService;
    @Resource
    @Qualifier(value = "IMGroupService")
    private IIMGroupService iimGroupService;
    @Resource
    @Qualifier(value = "IMGroupMemberService")
    private IIMGroupMemberService iimGroupMemberService;

    @Resource
    @Qualifier(value = "IMUserFriendsService")
    private IIMUserFriendsService iimUserFriendsService;
    @Resource
    @Qualifier(value = "IMDepartService")
    private IIMDepartService iimDepartService;

    @RequestMapping(value = "test", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
    public ApiResult test(HttpServletRequest req, HttpServletResponse rsp) {
        ApiResult returnResult = new ApiResult();
        controllerUtil.sendIMSystemMessage(137, 4, "FRIEND_INVITE");
        returnResult.setCode(200);
        returnResult.setData(null);
        returnResult.setMessage("helloworld!");
        return returnResult;
    }

    @RequestMapping(value = "addFriend", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    public ApiResult addFriend(HttpServletRequest req, HttpServletResponse rsp, @CurrentUser IMUser user) {
        ApiResult returnResult = new ApiResult();
        Map<String, Object> returnData = new HashMap<>();
        List<Map<String, Object>> returnFriendsList = new LinkedList<>();
        List<Map<String, Object>> userDepartList = new LinkedList<>();
        List<Map<String, Object>> friendsList = new LinkedList<>();
        if (user == null) {
            return ApiResult.AuthError();
        }
        int friduid = controllerUtil.getIntParameter(req, "friuid", 0);
        IMUserFriends imUserFriends = iimUserFriendsService.getOne(new QueryWrapper<IMUserFriends>().eq("uid", friduid).eq("friuid", user.getId()));
        if (imUserFriends == null || imUserFriends.getId() <= 0) {
            IMUserFriends addFriend = new IMUserFriends();
            addFriend.setUid(friduid);
            addFriend.setFriuid(user.getId());
            addFriend.setFriName(user.getNickname());
            addFriend.setGroupId(1);
            addFriend.setMessage("已通过好友请求!");
            addFriend.setStatus(22);
            addFriend.setUpdated(LocalDateTime.now());
            addFriend.setCreated(LocalDateTime.now());
            iimUserFriendsService.save(addFriend);

            controllerUtil.sendIMSystemMessage(137, friduid, "FRIEND_INVITE");

            returnResult.setCode(200);
            returnResult.setData(null);
            returnResult.setMessage("请求成功!");
            return returnResult;
        } else {
            if (imUserFriends.getStatus() == 1) {
                returnResult.setCode(201);
                returnResult.setData(null);
                returnResult.setMessage("已经是好友!");
                return returnResult;
            } else {
                if (DateUtil.GetDateSecond(LocalDateTime.now()) - DateUtil.GetDateSecond(imUserFriends.getUpdated()) > 1000 * 60 * 60 * 24) {
                    imUserFriends.setMessage("请求加为好友");
                    imUserFriends.setStatus(2);
                    imUserFriends.setUpdated(LocalDateTime.now());
                    iimUserFriendsService.updateById(imUserFriends);

                    controllerUtil.sendIMSystemMessage(137, friduid, "FRIEND_INVITE");
                }
                returnResult.setCode(200);
                returnResult.setData(null);
                returnResult.setMessage("请求成功!");
                return returnResult;
            }

        }
    }


    @RequestMapping(value = "agreeFriend", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    public ApiResult agreeFriend(HttpServletRequest req, HttpServletResponse rsp, @CurrentUser IMUser user) {
        ApiResult returnResult = new ApiResult();
        if (user == null) {
            return ApiResult.AuthError();
        }
        int friduid = controllerUtil.getIntParameter(req, "friuid", 0);

        IMUserFriends imUserFriends = iimUserFriendsService.getOne(new QueryWrapper<IMUserFriends>().eq("uid", user.getId()).eq("friuid", friduid));
        if (imUserFriends == null || imUserFriends.getId() <= 0) {
            returnResult.setCode(201);
            returnResult.setData(null);
            returnResult.setMessage("没有找到好友请求!");
            return returnResult;
        } else {
            if (imUserFriends.getStatus() == 1) {
                returnResult.setCode(201);
                returnResult.setData(null);
                returnResult.setMessage("已经是好友!");
                return returnResult;
            } else {
                //更新当前记录的状态
                imUserFriends.setMessage("请求加为好友");
                imUserFriends.setStatus(1);
                imUserFriends.setUpdated(LocalDateTime.now());
                iimUserFriendsService.updateById(imUserFriends);


                //给对方加上自已的好友记录
                IMUserFriends addFriend = new IMUserFriends();
                addFriend.setUid(friduid);
                addFriend.setFriuid(user.getId());
                addFriend.setFriName(user.getNickname());
                addFriend.setGroupId(1);
                addFriend.setMessage("已通过好友请求!");
                addFriend.setStatus(1);
                addFriend.setUpdated(LocalDateTime.now());
                addFriend.setCreated(LocalDateTime.now());
                iimUserFriendsService.save(addFriend);
                controllerUtil.sendIMSystemMessage(137, friduid, "FRIEND_AGEREE");
                returnResult.setCode(200);
                returnResult.setData(null);
                returnResult.setMessage("请求成功!");
                return returnResult;
            }
        }
    }

    @RequestMapping(value = "getFriends", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    public ApiResult getFriends(HttpServletRequest req, HttpServletResponse rsp, @CurrentUser IMUser user) {

        ApiResult returnResult = new ApiResult();
        Map<String, Object> returnData = new HashMap<>();
        List<Map<String, Object>> returnFriendsList;
        List<Map<String, Object>> userDepartList;
        List<Map<String, Object>> friendsList = new LinkedList<>();
        if (user == null) {
            return ApiResult.AuthError();
        }
        returnFriendsList = iimUserFriendsService.getMyFriends(user.getId());
        userDepartList = iimDepartService.getMyAllDepart(user.getId());
        for (Map<String, Object> userMap : returnFriendsList) {
            for (Map<String, Object> departMap : userDepartList) {
                if (userMap.get("departmentId").toString().equals(departMap.get("departId").toString())) {
                    userMap.put("departName", departMap.get("departName").toString());
                    friendsList.add(userMap);
                }
            }
        }
        returnData.put("friendlist", friendsList);
        returnData.put("grouplist", userDepartList);
        returnResult.setCode(ApiResult.SUCCESS);
        returnResult.setData(returnData);
        returnResult.setMessage("查询成功!");
        return returnResult;
    }


    @RequestMapping(value = "getNewFriends", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    public ApiResult getNewFriends(HttpServletRequest req, HttpServletResponse rsp, @CurrentUser IMUser user) {

        ApiResult returnResult = new ApiResult();
        List<Map<String, Object>> returnFriendsList;
        if (user == null) {
            return ApiResult.AuthError();
        }
        returnFriendsList = iimUserFriendsService.getMyNewFriends(user.getId());
        returnResult.setCode(ApiResult.SUCCESS);
        returnResult.setData(returnFriendsList);
        returnResult.setMessage("查询成功!");
        return returnResult;
    }

    @RequestMapping(value = "getGroupMembers", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    public ApiResult getGroupMembers(HttpServletRequest req, HttpServletResponse rsp, @CurrentUser IMUser user) {
        ApiResult returnResult = new ApiResult();
        Map<String, Object> returnData = new HashMap<>();
        if (user == null) {
            return ApiResult.AuthError();
        }
        int groupId = controllerUtil.getIntParameter(req, "groupid", 0);
        List<Map<String, Object>> groupmemberlist = iimGroupMemberService.getGroupMemberInfoById(groupId);
        returnData.put("memberlist", groupmemberlist);

        returnResult.setCode(ApiResult.SUCCESS);
        returnResult.setData(returnData);
        returnResult.setMessage("查询成功!");
        return returnResult;
    }


    @RequestMapping(value = "getGroupList", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    public ApiResult getGroupList(HttpServletRequest req, HttpServletResponse rsp, @CurrentUser IMUser user) {

        ApiResult returnResult = new ApiResult();
        Map<String, Object> returnData = new HashMap<>();
        List<Map<String, Object>> returnGrouplist = new LinkedList<>();
        if (user == null) {
            return ApiResult.AuthError();
        }


        //群信息列表。
        List<Map<String, Object>> grouplist = iimGroupService.getMyGroupList(user.getId());
        List<String> ids = new LinkedList<>();
        for (Map<String, Object> gmap : grouplist) {
            if (Integer.parseInt(gmap.get("type").toString()) < 3) {
                ids.add(gmap.get("id").toString());
            }
        }

        List<Map<String, Object>> groupmemberlist = iimGroupMemberService.getGroupMemberList(StringUtils.join(ids, ","));

        if (grouplist != null && grouplist.size() > 0) {
            for (Map<String, Object> gmap : grouplist) {
                List<String> uids = new LinkedList<>();
                if (groupmemberlist != null && groupmemberlist.size() > 0) {
                    for (Map<String, Object> umap : groupmemberlist) {
                        if (gmap.get("id").toString().equals(umap.get("groupId").toString())) {
                            uids.add(umap.get("userId").toString());
                        }
                    }
                }
                gmap.put("userlist", StringUtils.join(uids, ","));
                returnGrouplist.add(gmap);
            }
        }

        returnData.put("grouplist", returnGrouplist);
        returnResult.setCode(ApiResult.SUCCESS);
        returnResult.setData(returnData);
        returnResult.setMessage("查询成功!");
        return returnResult;
    }


    @RequestMapping(value = "getGroupInfo", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    public ApiResult getGroupInfo(HttpServletRequest req, HttpServletResponse rsp, @CurrentUser IMUser user) {
        ApiResult returnResult = new ApiResult();
        Map<String, Object> returnData = new HashMap<>();
        List<Map<String, Object>> returnGrouplist = new LinkedList<>();
        if (user == null) {
            return ApiResult.AuthError();
        }
        String groupIds = controllerUtil.getStringParameter(req, "groupIds", "");

        //群信息列表。
        List<Map<String, Object>> grouplist = iimGroupService.getGroupList(groupIds);
        List<Map<String, Object>> groupmemberlist = iimGroupMemberService.getGroupMemberList(groupIds);
        if (grouplist != null && grouplist.size() > 0) {
            for (Map<String, Object> gmap : grouplist) {
                List<String> uids = new LinkedList<>();
                if (groupmemberlist != null && groupmemberlist.size() > 0) {
                    for (Map<String, Object> umap : groupmemberlist) {
                        if (gmap.get("id").toString().equals(umap.get("groupId").toString())) {
                            uids.add(umap.get("userId").toString());
                        }
                    }
                }
                gmap.put("userlist", StringUtils.join(uids, ","));
                returnGrouplist.add(gmap);
            }
        }

        returnData.put("grouplist", returnGrouplist);
        returnResult.setCode(ApiResult.SUCCESS);
        returnResult.setData(returnData);
        returnResult.setMessage("查询成功!");
        return returnResult;
    }


    @RequestMapping(value = "getChatRoomList", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    public ApiResult getChatRoomList(@CurrentUser IMUser user) {
        ApiResult returnResult = new ApiResult();
        if (user == null || user.getId() == null) {
            return ApiResult.AuthError();
        }
        Map<String, Object> groups = iimGroupService.getMap(new QueryWrapper<IMGroup>().eq("type", 3).eq("status", 0));
        returnResult.setCode(ApiResult.SUCCESS);
        returnResult.setData(groups);
        returnResult.setMessage("查询成功!");
        return returnResult;
    }


    @RequestMapping(value = "getNearByUser", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    public ApiResult getNearByUser(HttpServletRequest req, HttpServletResponse rsp) {
        ApiResult returnResult = new ApiResult();
        IMUser myinfo = controllerUtil.checkToken(req);
        if (myinfo == null) {
            return ApiResult.AuthError();
        }

        int page = controllerUtil.getIntParameter(req, "page", 1);
        int pagesize = controllerUtil.getIntParameter(req, "pagesize", 20);
        double lng = controllerUtil.getDoubleParameter(req, "lng", 0);
        double lat = controllerUtil.getDoubleParameter(req, "lat", 0);


        List<GeoBean> geoBeanList = new LinkedList<>();
        List<GeoBean> pageGeoList = new LinkedList<>();

        //redisHelper.cacheGeo("hunan22",113.37322,23.126153,"1",13600*10);
        redisHelper.cacheGeo("hunan22", 113.37322, 23.126153, "2", 13600 * 1000);
        redisHelper.cacheGeo("hunan22", 113.37322, 23.126153, "3", 13600 * 1000);
        redisHelper.cacheGeo("hunan22", 113.37322, 23.126153, "4", 13600 * 1000);

        redisHelper.cacheGeo("hunan22", lng, lat, myinfo.getId().toString(), 13600 * 10000);

        String geojson = "";


        //流程:先从数据库查找缓存。看有没有缓存数据，如果有的话，直接读取缓存数据进行查分页查找。没有缓存数据时，用redis geo里面进行搜索
        IMUserGeoData imUserGeoData2 = iimUserGeoDataService.getOne(new QueryWrapper<IMUserGeoData>().eq("uid", myinfo.getId()));
        if (imUserGeoData2 != null && imUserGeoData2.getId() > 0 && DateUtil.GetDateSecond(imUserGeoData2.getUpdated()) > 0 && ((DateUtil.timestamp() - DateUtil.GetDateSecond(imUserGeoData2.getUpdated())) < 60 * 10)) {
            geojson = imUserGeoData2.getData();
            geoBeanList = JSON.parseArray(geojson, GeoBean.class);
        } else {
            GeoResults<RedisGeoCommands.GeoLocation<Object>> geoResults = redisHelper.radiusGeo("hunan22", lng, lat, 10000000, Sort.Direction.ASC, 100);
            List<GeoResult<RedisGeoCommands.GeoLocation<Object>>> geoResults1 = geoResults.getContent();
            for (GeoResult<RedisGeoCommands.GeoLocation<Object>> item : geoResults) {
                GeoBean geoBean = new GeoBean();
                geoBean.setDis(item.getDistance().getValue());
                geoBean.setKey(item.getContent().getName().toString());
                geoBeanList.add(geoBean);
            }
            //将json存到数据库埋在去
            geojson = JSON.toJSONString(geoBeanList);
        }

        if (imUserGeoData2 == null || imUserGeoData2.getUid() <= 0) {
            IMUserGeoData imUserGeoData = new IMUserGeoData();
            imUserGeoData.setId(null);
            imUserGeoData.setUid(myinfo.getId());
            imUserGeoData.setData(geojson);
            imUserGeoData.setStatus(1);
            imUserGeoData.setLat(lat);
            imUserGeoData.setLng(lng);

            imUserGeoData.setUpdated(LocalDateTime.now());
            iimUserGeoDataService.save(imUserGeoData);
        }

        pageGeoList = javaBeanUtil.sublist(geoBeanList, page, pagesize);
        List<String> userids = new LinkedList<>();
        for (GeoBean geoBean : pageGeoList) {
            if (!geoBean.getKey().equals(myinfo.getId())) {//把自已排除
                userids.add(geoBean.getKey());
            }
        }

        String uids = StringUtils.join(userids, ",");
        List<Map<String, Object>> userslist = iimUserService.getUsersInfo(uids);


        //哈哈。连环for。主要是为了排序和输出dists
        List<Map<String, Object>> returndatalist = new LinkedList<>();
        for (GeoBean geoBean : pageGeoList) {
            for (Map<String, Object> map : userslist) {
                if (geoBean.getKey().equals(map.get("id").toString())) {
                    map.put("dists", geoBean.getDis());
                    returndatalist.add(map);
                    break;
                }
            }
        }

        returnResult.setCode(ApiResult.SUCCESS);
        returnResult.setData(returndatalist);
        returnResult.setMessage("查询成功!");
        return returnResult;
    }

    @RequestMapping(value = "reg", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    public ApiResult reg(HttpServletRequest req, HttpServletResponse rsp) {

        ApiResult returnResult = new ApiResult();
        Map<String, Object> returnData = new HashMap<>();
        int outid = controllerUtil.getIntParameter(req, "outid", 0);
        String username = controllerUtil.getStringParameter(req, "username", "0");
        String password = controllerUtil.getStringParameter(req, "password", "0");
        String code = controllerUtil.getStringParameter(req, "code", "0");
        String nickname = controllerUtil.getStringParameter(req, "nickname", "");
        String state = controllerUtil.getStringParameter(req, "phonestate", "");//手机信息
        String latitude = controllerUtil.getStringParameter(req, "latitude", "0");//经纬度
        String longitude = controllerUtil.getStringParameter(req, "longitude", "0");//经纬度
        int salt = new Random().nextInt(8888) + 1000;

        if (username.length() != 11) {
            returnResult.setCode(ApiResult.ERROR);
            returnResult.setData(returnData);
            returnResult.setMessage("请使用正确的手机号码!");
            return returnResult;
        }

        IMUser users = iimUserService.getOne(new QueryWrapper<IMUser>().eq("username", username));
        if (users != null && users.getId() > 0) {
            returnResult.setCode(ApiResult.ERROR);
            returnResult.setData(returnData);
            returnResult.setMessage("账号已存在!");
            return returnResult;
        }

        users = new IMUser();
        users.setAvatar("http://d.lanrentuku.com/down/png/1807/if-family/if_daughter_3231126.png");
        users.setOutId(outid);
        users.setUsername(username);
        users.setSalt(salt + "");
        //对密码进行加密
        String enPass = DigestUtils.md5Hex(password + users.getSalt()).toLowerCase();
        users.setPassword(enPass);
        if (nickname.equals("")) {
            nickname = "ghost_" + salt;
        }
        users.setNickname(nickname);
        Map<String, Object> map = AddressUtil.getAddress(longitude, latitude);
        String country="";
        String city="";
        if (map.get("status").toString().equals("0")) {
            Map<String, Object> temp=(Map<String, Object>) map.get("result");
            Map<String, Object> temp1=(Map<String, Object>) temp.get("addressComponent");
            country= temp1.get("country").toString();
            city=temp1.get("city").toString();
            users.setCountry(country);
            users.setCity(city);
        }
        users.setRealname(nickname);
        users.setApiToken(controllerUtil.getRandomString(32));
        users.setCreated(LocalDateTime.now());
        users.setUpdated(LocalDateTime.now());
        users.setSex(1);
        users.setDomain("0");
        users.setPhone(username);
        users.setLatitude(Float.parseFloat(latitude));
        users.setLongitude(Float.parseFloat(longitude));
        users.setDepartId(1);
        users.setStatus(0);
        users.setPhoneState(state);
        users.setAppVersion("0.0.1");
        iimUserService.save(users);
        returnResult.setCode(ApiResult.SUCCESS);
        returnResult.setData(null);
        returnResult.setMessage("注册成功!");
        return returnResult;
    }

    @RequestMapping(value = "checkLogin", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    public ApiResult checkLogin(HttpServletRequest req) {
        ApiResult returnResult = new ApiResult();
        Map<String, Object> returnData = new HashMap<>();
        ServerInfoEntity serverinfo = new ServerInfoEntity();
        Map<String, Object> bmqq_plugin = new HashMap<>();
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String state = controllerUtil.getStringParameter(req, "phonestate", "");//手机信息
        String latitude = controllerUtil.getStringParameter(req, "latitude", "0");//经纬度
        String longitude = controllerUtil.getStringParameter(req, "longitude", "0");//经纬度
        IMUser users = iimUserService.getOne(new QueryWrapper<IMUser>().eq("username", username));
        if (users == null || users.getId() == 0) {
            returnResult.setCode(ApiResult.ERROR);
            returnResult.setData(returnData);
            returnResult.setMessage("账号不存在!");
            return returnResult;
        }
        password = DigestUtils.md5Hex(password + users.getSalt()).toLowerCase();
        if (!users.getPassword().equals(password)) {
            returnResult.setCode(ApiResult.ERROR);
            returnResult.setData(returnData);
            returnResult.setMessage("密码错误!");
            return returnResult;
        }
        //*********从redis中获取 负载量小的 聊天服务器************
        //****************************************************
        Map<Object, Object> serveries = redisHelper.hmget("msg_srv_list");
        if (serveries != null && serveries.size() > 0) {
            serveries = javaBeanUtil.sortMapByValue(serveries);
            String selectServerInfo = javaBeanUtil.getFirstKeyFromMap(serveries).toString();
            serverinfo.setServer_ip(selectServerInfo.split("\\|")[0]);
            serverinfo.setServer_ip2(selectServerInfo.split("\\|")[1]);
            serverinfo.setServer_port(Integer.parseInt(selectServerInfo.split("\\|")[2]));
        }
        bmqq_plugin.put("appid", bqmmplugin_appid);
        bmqq_plugin.put("appsecret", bqmmplugin_appsecret);
        Map<String, Object> returnUsers = JavaBeanUtil.convertBeanToMap(users);
        returnUsers.put("peerId", users.getId());
        returnUsers.remove("password");
        returnData.put("token", JWTUtil.sign(users.getUsername(), users.getId(), 2, users.getSalt()));
        returnData.put("userinfo", returnUsers);
        returnData.put("serverinfo", serverinfo);
        returnData.put("bqmmplugin", bmqq_plugin);

        String ip = JWTUtil.getIpAddress(req);
        users.setIpAddress(ip);
        users.setPhoneState(state);
        users.setUpdated(LocalDateTime.now());
        String country="";
        String city="";
        if (!latitude.equals("0") && !longitude.equals("0")) {
            users.setLatitude(Float.parseFloat(latitude));
            users.setLongitude(Float.parseFloat(longitude));

            Map map=AddressUtil.getAddress(longitude,latitude);
            if (map.get("status").toString().equals("0")) {
                Map<String, Object> temp=(Map<String, Object>) map.get("result");
                Map<String, Object> temp1=(Map<String, Object>) temp.get("addressComponent");
                country= temp1.get("country").toString();
                city=temp1.get("city").toString();
                users.setCountry(country);
                users.setCity(city);
            }
        }
        iimUserService.updateById(users);
        List<IMUserExtend> arr = new ArrayList<>();

        arr.add(new IMUserExtend(2, users.getId(), users.getUsername(), users.getNickname(), ip, "", LocalDateTime.now()));
        arr.add(new IMUserExtend(7, users.getId(), ip, country, city, latitude + "," + longitude, LocalDateTime.now()));
        extendService.saveBatch(arr);
        //TODO 写入 ip地址 记录表
        returnResult.setCode(ApiResult.SUCCESS);
        returnResult.setData(returnData);
        returnResult.setMessage("登录成功!");
        return returnResult;
    }

    @RequestMapping(value = "getUserInfo", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    public ApiResult getUserInfo(HttpServletRequest req, HttpServletResponse rsp, @CurrentUser IMUser user) {
        ApiResult returnResult = new ApiResult();
        Map<String, Object> returnData = new HashMap<>();
        if (user == null) {
            return ApiResult.AuthError();
        }
        String friuid = req.getParameter("friuids");
        List<Map<String, Object>> userslist = iimUserService.getUsersInfo(friuid);
        if (userslist.size() > 0) {
            returnData.put("userinfo", userslist);
            returnResult.setCode(ApiResult.SUCCESS);
            returnResult.setData(returnData);
        } else {
            returnResult.setCode(ApiResult.ERROR);
        }
        returnResult.setMessage("查询成功!");
        return returnResult;
    }

    @RequestMapping(value = "getSrvInfo", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
    public ApiResult getSrvInfo() {

        ApiResult returnResult = new ApiResult();
        ServerInfoEntity serverinfo = new ServerInfoEntity();
        //*********从redis中获取 负载量小的 聊天服务器************
        //***************************************************
        Map<Object, Object> serverlistmap;
        String selectServerInfo;
        serverlistmap = redisHelper.hmget("msg_srv_list");
        if (serverlistmap != null && serverlistmap.size() > 0) {
            serverlistmap = javaBeanUtil.sortMapByValue(serverlistmap);
            selectServerInfo = javaBeanUtil.getFirstKeyFromMap(serverlistmap).toString();
            serverinfo.setServer_ip(selectServerInfo.split("\\|")[0]);
            serverinfo.setServer_ip2(selectServerInfo.split("\\|")[1]);
            serverinfo.setServer_port(Integer.parseInt(selectServerInfo.split("\\|")[2]));
        }
        serverinfo.setMsfsPrior(files_msfsprior);
        serverinfo.setMsfsBackup(files_msfspriorbackup);
        returnResult.setCode(ApiResult.SUCCESS);
        returnResult.setData(serverinfo);
        returnResult.setMessage("登录成功!");

        return returnResult;
    }

    @RequestMapping("/users/{page}/{size}")
    public Map<String, Object> users(@PathVariable Integer page, @PathVariable Integer size) {
        Map<String, Object> map = new HashMap<>();
        Page<IMUser> questionStudent = iimUserService.getAllUserBypage(new Page<>(page, size));
        IMUser users = iimUserService.getById(1);
        List<Map<String, Object>> list = iimUserService.selectUser2();
        if (questionStudent.getRecords().size() == 0) {
            map.put("code", 400);
        } else {
            map.put("code", 200);
            map.put("data", questionStudent);
        }
        return map;
    }
}
