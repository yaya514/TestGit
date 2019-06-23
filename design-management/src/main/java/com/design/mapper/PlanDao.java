package com.design.mapper;

import java.util.List;

import com.design.pojo.Page;
import com.design.pojo.Plan;

public interface PlanDao {
	
	List<Plan> queryPage(Page<Plan> page);

	Integer queryTotalCount(Page<Plan> page);

	void planAdd(Plan plan);

	void deletePlan(Integer id);

	void setPlan(Plan plan);

	Plan getPlanByNumber(Integer id);

	List<Plan> getAllPlan();

	Plan getPlanByid(Integer id);

	Plan getPlanByGroupId(int group_id);
	
}
