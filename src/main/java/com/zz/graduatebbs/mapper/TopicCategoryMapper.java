package com.zz.graduatebbs.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Component;

@Mapper
@Component
public interface TopicCategoryMapper {
	/**
	 * 得到帖子分类名称
	 * @param TopicCategoryId
	 * @return
	 */
	String getTopicCategoryName(long TopicCategoryId);
}
