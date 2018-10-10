package com.monkey.authprovider.repository;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.monkey.authprovider.entity.Account;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AccountRepository extends BaseMapper<Account> {


    List<Account> selectByFilter(@Param("filter") String filter);
}
