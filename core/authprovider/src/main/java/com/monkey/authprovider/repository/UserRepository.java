package com.monkey.authprovider.repository;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.monkey.authprovider.core.User;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserRepository extends BaseMapper<User> {
}
