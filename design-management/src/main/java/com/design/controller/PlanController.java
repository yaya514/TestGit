package com.design.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.design.pojo.Mygroup;
import com.design.pojo.Page;
import com.design.pojo.Plan;
import com.design.service.GroupService;
import com.design.service.PlanService;
import com.design.utils.MD5Utils;

@Controller
public class PlanController {

	@Autowired
	private PlanService planService;
	@Autowired
	private GroupService groupService;

	// 查询所有安排
	@RequestMapping("/plan_list.html")
	public String planList(Integer currentPage, Model model) throws Exception {

		Page<Plan> page = new Page<>();
		if (currentPage == null) {
			currentPage = 1;
		}

		page.setCurrentPage(currentPage);
		page.setCurrentCount(5);

		// 起始索引
		page.setIndex((currentPage - 1) * page.getCurrentCount());

		page = planService.queryPage(page);

		model.addAttribute("page", page);

		return "plan_list";
	}

	// 查询所有安排(非管理员界面)
	@RequestMapping("/plan_listNotAdmin.html")
	public String planListNotAdmin(Integer currentPage, Model model) throws Exception {

		Page<Plan> page = new Page<>();
		if (currentPage == null) {
			currentPage = 1;
		}

		page.setCurrentPage(currentPage);
		page.setCurrentCount(5);

		// 起始索引
		page.setIndex((currentPage - 1) * page.getCurrentCount());

		page = planService.queryPage(page);

		model.addAttribute("page", page);

		return "plan_listNotAdmin";
	}

	// ajxa异步查询返回所有计划信息到页面
	@RequestMapping("plan_listAll.action")
	@ResponseBody
	public List<Plan> planListAll(Model model) {
		List<Plan> planList = planService.getAllPlan();
		model.addAttribute("planList", planList);
		return planList;
	}

	// 根据学号查询回显学生信息
	@RequestMapping("/plan_show.html")
	public String personalShow(Integer id, Model model) {
		Plan plan = planService.getPlanById(id);
		Mygroup mygroup = groupService.getGroupById(plan.getGroup_id());

		plan.setMygroup(mygroup);
		model.addAttribute("personal", plan);

		return "plan_edit";
	}

	// 根据id修改对应的personal信息

	@RequestMapping("/plan_edit.html")
	public String planEdit(Plan plan) {
		planService.setPlan(plan);

		return "redirect:/plan_list.html";
	}

	// 根据id删除对应的plan信息

	@RequestMapping("/plan_delete.html")
	public String planDelete(Integer id) {
		Plan plan = planService.getPlanById(id);

		// 将对应的mygroup中的Group_id设置为null
		groupService.groupSetPlanidNull(plan.getGroup_id());

		// 删除对应的plan
		planService.deletePlan(id);

		return "redirect:/plan_list.html";
	}

	// 管理员添加一个计划
	@RequestMapping("/plan_add.html")
	public String planAdd(Plan plan, Model model) {

		planService.planAdd(plan);

		Plan p = planService.getPlanByGroupId(plan.getGroup_id());

		// 将group中plan_id修改为对应的值
		Mygroup group = groupService.getGroupById(p.getGroup_id());
		group.setPlan_id(p.getPlan_id());

		groupService.groupUPdate(group);

		return "redirect:/plan_list.html";

	}

	// 批量删除学生（删除选中的学生）
	@RequestMapping("/plan_deleteAll.html")
	public String planDeleteAll(Integer[] ids) {
		try {
			if (ids.length > 0 && ids != null) {
				for (Integer id : ids) {
					Plan plan = planService.getPlanById(id);

					// 将对应的mygroup中的Group_id设置为null
					groupService.groupSetPlanidNull(plan.getGroup_id());

					planService.deletePlan(id);
				}
			}
			return "redirect:/plan_list.html";

		} catch (Exception e) {

			return "redirect:/plan_list.html";
		}

	}

}
