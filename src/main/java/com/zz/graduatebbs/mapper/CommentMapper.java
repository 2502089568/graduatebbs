package com.zz.graduatebbs.mapper;

import com.zz.graduatebbs.pojo.Comment;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.List;

@Mapper
@Component
public interface CommentMapper {
	/**
	 * 按主题id得到评论
	 * @return
	 */
	List<Comment> getTopicComment(long topicId);

	/**
	 * 得到帖子回复数目
	 * @param topicId
	 * @return
	 */
	int getTopicCommentCount(long topicId);

	/**
	 * 最多评论数的回复（2条）
	 * @return
	 */
	List<Comment> getHotTopicComment(long topicId);

	/**
	 * 得到楼主的评论
	 * @return
	 */
	List<Comment> getUserTopicComment(@Param("topicId") long topicId,@Param("userId") long userId);

	/**
	 * 得到楼主的评论条数
	 * @param topicId
	 * @param userId
	 * @return
	 */
	int getUserTopicCommentCount(@Param("topicId") long topicId,@Param("userId") long userId);
}
