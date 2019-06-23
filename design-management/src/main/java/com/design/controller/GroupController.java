package com.design.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.design.pojo.Admin;
import com.design.pojo.Mygroup;
import com.design.pojo.Page;
import com.design.pojo.Student;
import com.design.pojo.Teacher;
import com.design.service.GroupService;
import com.design.service.StudentService;
import com.design.service.TeacherService;

@Controller
public class GroupController {

	@Autowired
	private GroupService groupService;
	@Autowired
	private StudentService studentService;
	@Autowired
	private TeacherService teacherService;

	// 查询所有小组
	@RequestMapping("/group_list.html")
	public String groupList(Integer currentPage, Model model, String searchName, HttpSession session) throws Exception {

		Page<Mygroup> page = new Page<>();
		if (currentPage == null) {
			currentPage = 1;
		}

		page.setCurrentPage(currentPage);
		page.setCurrentCount(5);
		page.getParams().put("searchName", searchName);

		// 起始索引
		page.setIndex((currentPage - 1) * page.getCurrentCount());

		page = groupService.queryPage(page);

		model.addAttribute("page", page);

		Object object = session.getAttribute("personal");

		try {
			Admin admin = (Admin) object;
			admin.getId();
			return "group_list";
		} catch (Exception e) {
			try {
				Teacher teacher = (Teacher) object;
				teacher.getTeacher_id();
				return "group_listTeacher";
			} catch (Exception e2) {
				return "group_listStudent";
			}
		}

	}

	@RequestMapping("/group_add.html")
	public String groupAdd(Mygroup mygroup, Model model) {

		String groupName = mygroup.getGroup_name();

		// 判断一下账号number是否存在
		Mygroup m = groupService.getGroupByName(groupName);

		// 如果不为空，则该小组不能添加
		if (m != null) {
			String error = "该小组名已经存在！";
			model.addAttribute("error", error);
			return "group_add";
		}
		// 为空的话，则该小组可以添加
		groupService.groupAdd(mygroup);

		return "redirect:/group_list.html";
	}

	//删除一个小组（把小组中所有的成员的groupId都设置为0）
	@RequestMapping("/group_delete.html")
	public String groupDelete(Integer id) {
		
		List<Student> studentList = studentService.getStudentByGroupId(id);
		for (Student student : studentList) {
			student.setGroup_id(0);
			studentService.updateStudentGroup_id(student);
		}
		
		List<Teacher> teacherList = teacherService.getTeacherByGroupId(id);
		for (Teacher teacher : teacherList) {
			teacher.setGroup_id(0);
			teacherService.updateTeacherGroup_id(teacher);
		}

		groupService.groupDelete(id);
		
		return "redirect:/group_list.html";
	}

	// 批量删除小组（删除选中的小组）
	@RequestMapping("/group_deleteAll.html")
	public String groupDeleteAll(Integer[] ids) {
		try {
			if (ids.length > 0 && ids != null) {
				for (Integer id : ids) {
					groupService.groupDelete(id);
				}
			}
			return "redirect:/group_list.html";

		} catch (Exception e) {

			return "redirect:/group_list.html";
		}

	}

	// ajxa异步查询返回所有小组信息到页面
	@RequestMapping("/group_listAll.action")
	@ResponseBody
	public List<Mygroup> groupListAll(Model model) {
		List<Mygroup> groupList = groupService.getAllGroup();
		model.addAttribute("groupList", groupList);
		return groupList;
	}

	// 学生加入选中的小组
	@RequestMapping("/group_choose.html")
	public String groupChoose(int group_id, HttpSession session) {
		Student student = (Student) session.getAttribute("personal");
		student.setGroup_id(group_id);

		studentService.updateStudentGroup_id(student);
		session.setAttribute("personal", student);

		return "redirect:/group_list.html";
	}

	// 教师加入选中的小组
	@RequestMapping("/group_chooseTeacher.html")
	public String groupChooseTeacher(int group_id, HttpSession session) {
		Teacher teacher = (Teacher) session.getAttribute("personal");
		teacher.setGroup_id(group_id);

		teacherService.updateTeacherGroup_id(teacher);
		session.setAttribute("personal", teacher);

		return "redirect:/group_list.html";
	}

	// 重置学生所选小组
	@RequestMapping("/group_reset.html")
	public String gorupReset(HttpSession session) {
		Student student = (Student) session.getAttribute("personal");
		student.setGroup_id(0);

		studentService.updateStudentGroup_id(student);
		session.setAttribute("personal", student);

		return "redirect:/group_list.html";
	}

	// 重置教师所选小组
	@RequestMapping("/group_resetTeacher.html")
	public String gorupResetTeacher(HttpSession session) {
		Teacher teacher = (Teacher) session.getAttribute("personal");
		teacher.setGroup_id(0);

		teacherService.updateTeacherGroup_id(teacher);
		session.setAttribute("personal", teacher);

		return "redirect:/group_list.html";
	}
}
