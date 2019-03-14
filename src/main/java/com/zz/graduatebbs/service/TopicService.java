package com.zz.graduatebbs.service;

import com.github.pagehelper.PageInfo;
import com.zz.graduatebbs.pojo.Topic;

import java.util.List;

public interface TopicService {

	/**
	 * 得到4个置顶帖
	 * @return
	 */
	List<Topic> getTopTopic();

	/**
	 * 得到首页的帖子
	 * @return
	 */
	PageInfo<Topic> getHotTopic(Integer pageIndex, Integer pageSize);

	/**
	 * 通过id得到帖子
	 * @param topicId
	 * @return
	 */
	Topic getTopicById(long topicId);

	/**
	 * 通过用户id得到用户发表的帖子
	 * @return
	 */
	List<Topic> getTopicByUserId(long userId);
}
