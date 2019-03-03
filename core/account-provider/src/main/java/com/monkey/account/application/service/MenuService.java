package com.monkey.account.application.service;

import com.monkey.account.application.IMenuService;
import com.monkey.account.entity.Menu;
import com.monkey.account.repository.MenuRepository;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
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
public class MenuService extends ServiceImpl<MenuRepository, Menu> implements IMenuService {

}
