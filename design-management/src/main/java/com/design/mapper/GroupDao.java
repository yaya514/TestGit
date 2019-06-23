package com.design.mapper;

import java.util.List;

import com.design.pojo.Mygroup;
import com.design.pojo.Page;

public interface GroupDao {

	Integer queryTotalCount(Page<Mygroup> page);
	
	List<Mygroup> queryPage(Page<Mygroup> page);

	Mygroup getGroupByName(String groupName);

	void groupAdd(Mygroup mygroup);

	void groupDelete(Integer group_id);

	Mygroup getGroupById(int group_id);

	List<Mygroup> getAllGroup();

	void groupUPdate(Mygroup group);

	void groupSetPlanidNull(int group_id);

}
