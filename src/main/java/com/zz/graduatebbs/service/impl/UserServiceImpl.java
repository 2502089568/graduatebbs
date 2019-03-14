package com.zz.graduatebbs.service.impl;

import com.zz.graduatebbs.mapper.UserMapper;
import com.zz.graduatebbs.pojo.User;
import com.zz.graduatebbs.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

@Service
@Component
public class UserServiceImpl implements UserService {
	@Autowired
	UserMapper userMapper;

	@Override
	public User getUserById(long userId) {
		return userMapper.getUserById(userId);
	}
}
