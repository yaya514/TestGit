package com.design.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.design.mapper.TopicDao;
import com.design.pojo.Page;
import com.design.pojo.Teacher;
import com.design.pojo.Topic;

@Service
public class TopicService {
	
	@Autowired
	private TopicDao topicDao;
	@Autowired
	private TeacherService teacherService;
	
	public Topic getTopicById(Integer id) {
		return topicDao.getTopicById(id);
	}

	public Page<Topic> queryPage(Page<Topic> page) {
		List<Topic> TopicList = topicDao.queryPage(page);
		
		for (Topic topic : TopicList) {
			Teacher teacher = teacherService.getTeacherByNumber(topic.getTeacher_number());
			topic.setTeacher(teacher);
		}

		Integer totalCount = topicDao.queryTotalCount(page);

		// 总记录数
		page.setTotalCount(totalCount);
		// 总页数
		page.setTotalPage((int) Math.ceil(totalCount / (page.getCurrentCount() * 1.0)));
		// personal对象集合
		page.setList(TopicList);

		return page;
	}


	public void topicAdd(Topic topic) {
		topicDao.topicAdd(topic);
	}

	public void deleteTopic(Integer id) {
		topicDao.deleteTopic(id);
	}

	public void setTopic(Topic Topic) {
		topicDao.setTopic(Topic);
		
	}

	public Topic getTopicByName(String name) {
		return topicDao.getTopicByName(name);
	}
}
