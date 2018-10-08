package com.monkey.authprovider.application;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.monkey.authprovider.core.User;
import com.monkey.authprovider.repository.UserRepository;
import org.springframework.stereotype.Service;

@Service
public class UserService extends ServiceImpl<UserRepository,User> implements IUserService {
}
