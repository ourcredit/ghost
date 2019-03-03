package com.monkey.account.application.service;

import com.monkey.account.application.IOrganizationService;
import com.monkey.account.entity.Organization;
import com.monkey.account.repository.OrganizationRepository;
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
public class OrganizationService extends ServiceImpl<OrganizationRepository, Organization> implements IOrganizationService {

}
