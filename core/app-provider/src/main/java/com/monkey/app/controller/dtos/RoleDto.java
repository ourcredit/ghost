package com.monkey.app.controller.dtos;

import java.util.List;

public class RoleDto {
    private Integer id;
    private String displayName;
    private String roleName;
    private List<String> permissionIds;
    private List<PermissionDto> allPermissions;
    private List<PermissionDto> hasPermissions;


    public List<String> getPermissionIds() {
        return permissionIds;
    }

    public void setPermissionIds(List<String> permissionIds) {
        this.permissionIds = permissionIds;
    }


    public String getDisplayName() {
        return displayName;
    }

    public void setDisplayName(String displayName) {
        this.displayName = displayName;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    public List<PermissionDto> getHasPermissions() {
        return hasPermissions;
    }

    public void setHasPermissions(List<PermissionDto> hasPermissions) {
        this.hasPermissions = hasPermissions;
    }

    public List<PermissionDto> getAllPermissions() {
        return allPermissions;
    }

    public void setAllPermissions(List<PermissionDto> allPermissions) {
        this.allPermissions = allPermissions;
    }
}
