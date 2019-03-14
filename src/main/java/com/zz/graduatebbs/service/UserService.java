package com.zz.graduatebbs.service;

import com.zz.graduatebbs.pojo.User;

public interface UserService {
	/**
	 * 通过id的到用户数据
	 * @param userId
	 * @return
	 */
	User getUserById(long userId);
}
