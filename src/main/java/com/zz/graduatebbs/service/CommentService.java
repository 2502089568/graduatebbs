package com.zz.graduatebbs.service;

import com.github.pagehelper.PageInfo;
import com.zz.graduatebbs.pojo.Comment;

import java.util.List;

public interface CommentService {
	/**
	 * 得到主题的评论
	 * @param topicId
	 * @return
	 */
	PageInfo<Comment> getTopicComment(Integer pageIndex, Integer pageSize, long topicId);

	/**
	 * 得到热评（2条）
	 * @param topicId
	 * @return
	 */
	List<Comment> getHotTopicComment(long topicId);

	/**
	 * 只看楼主
	 * @param topicId
	 * @param userId
	 * @return
	 */
	List<Comment> getUserTopicComment( long topicId,long userId);
}
