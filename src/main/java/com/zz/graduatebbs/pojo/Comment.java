package com.zz.graduatebbs.pojo;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;

@Data
public class Comment implements Serializable {
	private long id;

	private Integer userId;

	private Integer topicId;

	private String commentContent;

	private Integer likeNum;

	private Integer isChoose;

	private Integer isDelete;

	private Date commentTime;

	private String userNickname;

	private String userPicUrl;

	private String passTime;
}

