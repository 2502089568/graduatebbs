package com.zz.graduatebbs.controller;

import com.zz.graduatebbs.pojo.User;
import com.zz.graduatebbs.service.TopicService;
import com.zz.graduatebbs.service.UserService;
import com.zz.graduatebbs.utils.TimeUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.Date;

@Controller
public class UserController {

	@Autowired
	UserService userServiceImpl;

	@Autowired
	TopicService topicServiceImpl;

	@RequestMapping("goUserHome/{id}")
	public ModelAndView goUserHome(@PathVariable int id){
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/user/home");
		User user = userServiceImpl.getUserById(id);
		modelAndView.addObject("userTopic",topicServiceImpl.getTopicByUserId(user.getId()));
		modelAndView.addObject("user",user);
		return modelAndView;
	}


}
