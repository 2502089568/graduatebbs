package com.zz.graduatebbs.mapper;

import com.zz.graduatebbs.pojo.Topic;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Component;

import java.util.List;

@Mapper
@Component
public interface TopicMapper {
	/**
	 * 得到时间排序的前4个置顶帖
	 * @return
	 */
	List<Topic> getTopTopic();

	/**
	 * 得到首页帖子（按时间）
	 * @return
	 */
	List<Topic> getHotTopic();

	/**
	 * 得到帖子通过帖子id
	 * @param topicId
	 * @return
	 */
	Topic getTopicById(long topicId);

	/**
	 * 通过用户id得到用户发表的帖子
	 * @param userId
	 * @return
	 */
	List<Topic> getTopicByUserId(long userId);

	/**
	 * 总共数据条数(首页)
	 * @return
	 */
	/*int getTopicCount();*/

}
