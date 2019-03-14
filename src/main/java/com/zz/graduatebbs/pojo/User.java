package com.zz.graduatebbs.pojo;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;

@Data
public class User implements Serializable {
	private long id;

	private String nickname;

	private String password;

	private String phone;

	private String email;

	private String city;

	private Integer activeState;

	private String sign;

	private String picUrl;

	private Date creatTime;

	private Date endTime;

}
