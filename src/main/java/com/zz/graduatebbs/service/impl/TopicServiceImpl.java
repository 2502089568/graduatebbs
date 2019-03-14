package com.zz.graduatebbs.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zz.graduatebbs.mapper.TopicCategoryMapper;
import com.zz.graduatebbs.mapper.TopicMapper;
import com.zz.graduatebbs.pojo.Topic;
import com.zz.graduatebbs.service.TopicService;
import com.zz.graduatebbs.utils.TimeUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
@Component
public class TopicServiceImpl implements TopicService {
	@Autowired
	TopicMapper topicMapper;
	@Autowired
	TopicCategoryMapper topicCategoryMapper;

	@Override
	public List<Topic> getTopTopic() {
		List<Topic> topicList = topicMapper.getTopTopic();
		for (Topic topic:topicList){
			System.out.println("aaaaaaaaaaa: "+topicCategoryMapper.getTopicCategoryName(topic.getTopicCategory()));
			topic.setTopicCategoryName(topicCategoryMapper.getTopicCategoryName(topic.getTopicCategory()));
	}
		return topicList;
	}

	@Override
	public PageInfo<Topic> getHotTopic(Integer pageIndex, Integer pageSize) {
		/*创建分页工具类*/
		PageHelper.startPage(pageIndex, pageSize);
		PageInfo<Topic> pageInfo =  new PageInfo<>(topicMapper.getHotTopic());
		List<Topic> topicList = pageInfo.getList();
		for (Topic topic:topicList){
			Date createDate = topic.getCreateTime();
			String passDate = TimeUtil.getStringDate(createDate);
			topic.setPassTime(passDate);//添加发表了多少时间
			//拿到帖子类型
			topic.setTopicCategoryName(topicCategoryMapper.getTopicCategoryName(topic.getTopicCategory()));
		}
		pageInfo.setList(topicList);
		return pageInfo;
	}

	@Override
	public Topic getTopicById(long topicId) {
		Topic topic = topicMapper.getTopicById(topicId);
		topic.setTopicCategoryName(topicCategoryMapper.getTopicCategoryName(topic.getTopicCategory()));
		return topic;
	}

	@Override
	public List<Topic> getTopicByUserId(long userId) {
		return topicMapper.getTopicByUserId(userId);
	}
}
