package com.monkey.app.common;

import com.monkey.app.controller.dtos.PermissionDto;

import java.util.ArrayList;
import java.util.List;

public  class PermissionConstant {
    public final static List<PermissionDto> permissions=new ArrayList<PermissionDto>(){{
        add(new PermissionDto("index","首页"));
        add(new PermissionDto("user","人员管理"));
        add(new PermissionDto("role","角色管理"));
        add(new PermissionDto("system","系统管理"));
        add(new PermissionDto("test","www"));
        add(new PermissionDto("统计","统计"));
    }};
}
