package com.zz.graduatebbs.controller;

import com.zz.graduatebbs.mapper.TopicMapper;
import com.zz.graduatebbs.pojo.Topic;
import com.zz.graduatebbs.pojo.User;
import com.zz.graduatebbs.service.CommentService;
import com.zz.graduatebbs.service.TopicService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("jie")
public class CommentController {

	@Autowired
	TopicService topicServiceImpl;

	@Autowired
	CommentService commentServiceImpl;

	@RequestMapping("godetail/{id}")
	public ModelAndView godetail(@PathVariable(value = "id") int id,HttpServletRequest request){
		ModelAndView modelAndView = new ModelAndView();
		HttpSession session = request.getSession();
		User userinfo = (User)session.getAttribute("userinfo");
		modelAndView.setViewName("/jie/detail");
		modelAndView.addObject("topic",topicServiceImpl.getTopicById(id));
		modelAndView.addObject("comment",commentServiceImpl.getTopicComment(1,10,id));
		/*if(userinfo!=null){//用户收藏时候要用
			Map<String,Object> collectMap=new HashMap<>();
			collectMap.put("userId",userinfo.getId());
			collectMap.put("topicId",id);
			Map<String, Object> stringObjectMap = userCollectTopicMapper.selectForCollect(collectMap);
			modelAndView.addObject("collectMap",stringObjectMap);
		}*/
		return modelAndView;
	}

	@RequestMapping("pagedDetail/{id}/{pageIndex}/{pageSize}")
	@ResponseBody
	public Map<String,Object> pagedDetail(@PathVariable(value = "id") int id, @PathVariable(value = "pageIndex")Integer pageIndex, @PathVariable(value = "pageSize")Integer pageSize, HttpServletRequest request) {
		Map<String,Object> map=new HashMap<>();
		map.put("topicId",id);
		map.put("comment",commentServiceImpl.getTopicComment(pageIndex,pageSize,id));
		return map;
	}
}
