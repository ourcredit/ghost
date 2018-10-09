package com.monkey.authprovider;

import com.monkey.authprovider.entity.Account;
import com.monkey.authprovider.repository.AccountRepository;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.List;

@RunWith(SpringRunner.class)
@SpringBootTest
public class AuthProviderApplicationTests {

	@Test
	public void contextLoads() {
	}
	@Autowired
	private AccountRepository _accountRepository;

	@Test
	public void testSelect() {
		System.out.println(("----- selectAll method test ------"));
		List<Account> userList = _accountRepository.selectList(null);
		Assert.assertEquals(5, userList.size());
		userList.forEach(System.out::println);
	}
}
