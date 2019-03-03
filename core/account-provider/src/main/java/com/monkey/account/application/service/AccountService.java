package com.monkey.account.application.service;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.monkey.account.application.IAccountService;
import com.monkey.account.entity.Account;
import com.monkey.account.repository.AccountRepository;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author zhaohejing
 * @since 2019-03-03
 */
@Service
public class AccountService extends ServiceImpl<AccountRepository, Account> implements IAccountService {

}
