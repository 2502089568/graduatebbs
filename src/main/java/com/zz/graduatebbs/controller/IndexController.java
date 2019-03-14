package com.zz.graduatebbs.controller;

import com.zz.graduatebbs.service.CommentService;
import com.zz.graduatebbs.service.TopicService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.Map;

@Controller
public class IndexController {

	@Autowired
	TopicService topicServiceImpl;

	@Autowired
	CommentService commentServiceImpl;

	@RequestMapping(value = "/")
	public ModelAndView indexController(){
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("index");
		modelAndView.addObject("topTopic",topicServiceImpl.getTopTopic());
		return modelAndView;
	}

	@RequestMapping(value = "/page_hot_topic")
	@ResponseBody
	public Map<String,Object> pageHotTopicController(@RequestParam(defaultValue="1")Integer pageIndex, @RequestParam(defaultValue="20")Integer pageSize){
		Map<String,Object> map=new HashMap<>();
		//System.out.println(topicServiceImpl.getHotTopic(pageIndex,pageSize));
		map.put("pageInfo",topicServiceImpl.getHotTopic(pageIndex,pageSize));
		return map;
	}
}
