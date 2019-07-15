package com.monkey.app.common;

import com.monkey.app.controller.dtos.PermissionDto;

import java.util.ArrayList;
import java.util.List;

public  class PermissionConstant {
    public final static List<PermissionDto> permissions=new ArrayList<PermissionDto>(){{
        add(new PermissionDto("a","a"));
        add(new PermissionDto("b","b"));
        add(new PermissionDto("c","c"));
        add(new PermissionDto("d","d"));
        add(new PermissionDto("e","e"));
        add(new PermissionDto("f","f"));
        add(new PermissionDto("g","g"));
        add(new PermissionDto("h","h"));
        add(new PermissionDto("i","i"));
        add(new PermissionDto("j","j"));
    }};
}
