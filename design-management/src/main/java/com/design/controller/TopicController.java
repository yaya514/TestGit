package com.design.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.design.pojo.Admin;
import com.design.pojo.Page;
import com.design.pojo.Student;
import com.design.pojo.Teacher;
import com.design.pojo.Topic;
import com.design.service.StudentService;
import com.design.service.TopicService;

@Controller
public class TopicController {

	@Autowired
	private TopicService topicService;
	@Autowired
	private StudentService studentService;

	// 从数据库中查询返回更新后的personal信息，跳转到index.jsp页面
	/*
	 * @RequestMapping("/index.html") private String index(HttpSession session,
	 * Model model) { Personal personal = (Personal)
	 * session.getAttribute("personal"); String number = personal.getNumber();
	 * Personal personalByNumber = personalService.getPersonalByNumber(number);
	 * 
	 * session.setAttribute("personal", personalByNumber);
	 * model.addAttribute("personal", personalByNumber); return "index"; }
	 */

	// 登录页面传过来账号，密码，校验是否正确

//	// 修改用户密码
//	@RequestMapping("/personal_password.html")
//	public String editPersonalPassword(String password, HttpSession session) {
//		password = MD5Utils.md5(password);
//
//		Personal personal = (Personal) session.getAttribute("personal");
//
//		personal.setPassword(password);
//		personalService.editPersonalPasswordByNumber(personal);
//
//		return "login";
//	}
//
	// 查询所有课题

	@RequestMapping("/topic_list.html")
	public String topicList(Integer currentPage, Model model, String searchName,HttpSession session) throws Exception {

		Page<Topic> page = new Page<>();
		if (currentPage == null) {
			currentPage = 1;
		}

		page.setCurrentPage(currentPage);
		page.setCurrentCount(5);
		page.getParams().put("searchName", searchName);

		// 起始索引
		page.setIndex((currentPage - 1) * page.getCurrentCount());

		page = topicService.queryPage(page);

		model.addAttribute("page", page);
		
		Object object = session.getAttribute("personal");
		
		try {
			Admin admin = (Admin) object;
			admin.getId();
			return "topic_list";
		} catch (Exception e) {
			try {
				Teacher teacher = (Teacher) object;
				teacher.getTeacher_id();
				return "topic_listTeacher";
			} catch (Exception e2) {
				return "topic_listStudent"; 
			}
		} 

	}


	// 根据学号查询回显课题信息
	@RequestMapping("/topic_show.html")
	public String topicShow(Integer id, Model model) {
		Topic topic = topicService.getTopicById(id);
		model.addAttribute("topic", topic);

		return "topic_edit";
	}

	// 根据id修改对应的personal信息

	@RequestMapping("/topic_edit.html")
	public String personalEdit(Topic topic) {
		topicService.setTopic(topic);

		return "redirect:/topic_list.html";
	}

	// 根据id删除对应的topic信息

	@RequestMapping("/topic_delete.html")
	public String deletetopic(Integer id) {
		topicService.deleteTopic(id);

		return "redirect:/topic_list.html";
	}

	// 添加一个课题
	@RequestMapping("/topic_add.html")
	public String personalAdd(Topic topic, Model model,HttpSession session) {
		String name = topic.getTopic_name();

		// 判断一下课题name是否存在
		Topic t = topicService.getTopicByName(name);

		// 如果不为空，则该课题不能申报
		if (t != null) {
			String error = "该课题已经存在！";
			model.addAttribute("error", error);
			return "topic_add";
		}
		// 为空的话，则该课题可以申报

		topicService.topicAdd(topic);
		
			return "redirect:/topic_list.html";
	}

	// 批量删除课题（删除选中的课题）
	@RequestMapping("/topic_deleteAll.html")
	public String topicDeleteAll(Integer[] ids) {
		try {
			if (ids.length > 0 && ids != null) {
				for (Integer id : ids) {
					topicService.deleteTopic(id);
				}
			}
			return "redirect:/topic_list.html";

		} catch (Exception e) {

			return "redirect:/topic_list.html";
		}

	}
	
	//学生选中课题
	@RequestMapping("/topic_choose.html")
	public String topicChoose(int topic_id,HttpSession session) {
		Student student = (Student) session.getAttribute("personal");
		student.setTopic_id(topic_id);
		
		studentService.updateStudentTopic_id(student);
		session.setAttribute("personal", student);
		
		return "redirect:/topic_list.html";
	}
	
	//重置学生的所选课题
	@RequestMapping("/topic_reset.html")
	public String topicReset(HttpSession session) {
		Student student = (Student) session.getAttribute("personal");
		student.setTopic_id(0);
		
		studentService.updateStudentTopic_id(student);
		session.setAttribute("personal", student);
		
		return "redirect:/topic_list.html";
	}

//	// ajax异步校验phone是否存在
//	@RequestMapping("checkNumber.action")
//	@ResponseBody
//	private Boolean checkPhone(String number) {
//
//		Personal personal = personalService.checkNumber(number);
//
//		Boolean isExist = false;
//		// 如果不为空，则该手机号不能注册
//		if (personal != null) {
//			isExist = true;
//		}
//
//		return isExist;
//	}
//
//	// 用户注册,注册页面传过来账号，密码，存入到数据库
//	@RequestMapping("/register.html")
//	private String register(Personal personal) {
//		String password = personal.getPassword();
//		// 使用MD5加密算法，对用户的密码进行加密
//		password = MD5Utils.md5(password);
//
//		personal.setPassword(password);
//		
//		//设置默认权限为1，普通用户
//		personal.setPower(1);
//		//设置默认积分为零
//		personal.setScore(0);
//		personalService.register(personal);
//
//		return "login";
//	}
//	
//	//用户签到，增加积分
//	@RequestMapping("/signIn.html")
//	public String signIn(HttpSession session) {
//		Personal personal = (Personal) session.getAttribute("personal");
//		int score = personal.getScore();
//		
//		//签到一次，增加5积分
//		score = score + 5;
//		personal.setScore(score);
//		
//		personalService.updatePersonalScoreById(personal);
//		return "redirect:/index.html";
//	}
}
