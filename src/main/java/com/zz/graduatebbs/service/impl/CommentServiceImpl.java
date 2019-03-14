package com.zz.graduatebbs.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zz.graduatebbs.mapper.CommentMapper;
import com.zz.graduatebbs.pojo.Comment;
import com.zz.graduatebbs.pojo.Topic;
import com.zz.graduatebbs.service.CommentService;
import com.zz.graduatebbs.utils.TimeUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
@Component
public class CommentServiceImpl implements CommentService {

	@Autowired
	CommentMapper commentMapper;

	@Override
	public PageInfo<Comment> getTopicComment(Integer pageIndex, Integer pageSize,long topicId) {
		/*List<Comment> topicComment = commentMapper.getHotTopicComment(topicId);//热评提前显示
		topicComment.addAll();*/
		/*创建分页工具类*/
		PageHelper.startPage(pageIndex, pageSize);
		PageInfo<Comment> pageInfo =  new PageInfo<>(commentMapper.getTopicComment(topicId));
		List<Comment> commentList = pageInfo.getList();
		for (Comment comment:commentList){
			Date createDate = comment.getCommentTime();
			String passDate = TimeUtil.getStringDate(createDate);
			comment.setPassTime(passDate);//添加发表了多少时间
		}
		pageInfo.setList(commentList);
		return pageInfo;
	}

	@Override
	public List<Comment> getHotTopicComment(long topicId) {
		return null;
	}

	@Override
	public List<Comment> getUserTopicComment(long topicId, long userId) {
		return null;
	}
}
