package com.zz.graduatebbs.pojo;

import lombok.Data;

import java.util.Date;

@Data
public class Topic {
	private Integer id;

	private String title;

	private Integer isDelete;

	private Integer likeNum;

	private Integer isTop;

	private Integer isGood;

	private Integer isEnd;

	private Integer commentNum;

	private Date createTime;

	private Integer userId;

	private Integer topicCategory;

	private String content;

	private String picUrl;

	private String userNickname;

	private String userPicUrl;

	private String passTime; //多出的

	private String topicCategoryName;//多出的
}
