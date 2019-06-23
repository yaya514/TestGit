package com.design.mapper;

import java.util.List;

import com.design.pojo.Page;
import com.design.pojo.Topic;

public interface TopicDao {

	Topic getTopicById(Integer id);

	List<Topic> queryPage(Page<Topic> page);

	Integer queryTotalCount(Page<Topic> page);

	void topicAdd(Topic topic);

	void deleteTopic(Integer id);

	void setTopic(Topic topic);

	Topic getTopicByName(String name);
	
}
