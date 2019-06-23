package com.design.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.design.mapper.GroupDao;
import com.design.mapper.PlanDao;
import com.design.pojo.Mygroup;
import com.design.pojo.Page;
import com.design.pojo.Plan;

@Service
public class PlanService {
	
	@Autowired
	private PlanDao planDao;
	@Autowired
	private GroupDao groudao;
	
	
	public Plan getPlanById(Integer id) {
		return planDao.getPlanByid(id);
	}

	public Page<Plan> queryPage(Page<Plan> page) {
		List<Plan> PlanList = planDao.queryPage(page);

		Integer totalCount = planDao.queryTotalCount(page);
		
		for (Plan plan : PlanList) {
			int group_id = plan.getGroup_id();
			
			Mygroup group = groudao.getGroupById(group_id);
			plan.setMygroup(group);
		}

		// 总记录数
		page.setTotalCount(totalCount);
		// 总页数
		page.setTotalPage((int) Math.ceil(totalCount / (page.getCurrentCount() * 1.0)));
		// personal对象集合
		page.setList(PlanList);

		return page;
	}


	public void planAdd(Plan plan) {
		planDao.planAdd(plan);
	}

	public void deletePlan(Integer id) {
		planDao.deletePlan(id);
	}

	public void setPlan(Plan plan) {
		planDao.setPlan(plan);
		
	}

	public List<Plan> getAllPlan() {
		return planDao.getAllPlan();
	}

	public Plan getPlanByGroupId(int group_id) {
		return planDao.getPlanByGroupId(group_id);
	}

}
