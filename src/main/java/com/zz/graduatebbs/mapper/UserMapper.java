package com.zz.graduatebbs.mapper;

import com.zz.graduatebbs.pojo.User;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Component;

@Mapper
@Component
public interface UserMapper {

	/**
	 * 通过id的到用户数据
	 * @param userId
	 * @return
	 */
	User getUserById(long userId);

}
