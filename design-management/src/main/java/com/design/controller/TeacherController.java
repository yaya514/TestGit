package com.design.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.design.pojo.Admin;
import com.design.pojo.Page;
import com.design.pojo.Student;
import com.design.pojo.Teacher;
import com.design.service.AdminService;
import com.design.service.StudentService;
import com.design.service.TeacherService;
import com.design.utils.MD5Utils;

@Controller
public class TeacherController {

	@Autowired
	private TeacherService teacherService;
	@Autowired
	private AdminService adminService;
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

	// 修改教师密码
	@RequestMapping("/teacher_password.html")
	public String editPersonalPassword(String password, HttpSession session) {
		password = MD5Utils.md5(password);

		Teacher teacher = (Teacher) session.getAttribute("personal");

		teacher.setPassword(password);
		teacherService.editTeacherPasswordByNumber(teacher);

		return "login";
	}

	// 查询所有老师
	@RequestMapping("/teacher_list.html")
	public String teacherList(Integer currentPage, Model model, String searchName) throws Exception {

		Page<Teacher> page = new Page<>();
		if (currentPage == null) {
			currentPage = 1;
		}

		page.setCurrentPage(currentPage);
		page.setCurrentCount(7);
		page.getParams().put("searchName", searchName);

		// 起始索引
		page.setIndex((currentPage - 1) * page.getCurrentCount());

		page = teacherService.queryPage(page);

		model.addAttribute("page", page);

		return "teacher_list";
	}

	// 查询所有老师(学生界面)
	@RequestMapping("/teacher_listStudent.html")
	public String teacherListStudent(Integer currentPage, Model model, String searchName) throws Exception {

		Page<Teacher> page = new Page<>();
		if (currentPage == null) {
			currentPage = 1;
		}

		page.setCurrentPage(currentPage);
		page.setCurrentCount(7);
		page.getParams().put("searchName", searchName);

		// 起始索引
		page.setIndex((currentPage - 1) * page.getCurrentCount());

		page = teacherService.queryPage(page);

		model.addAttribute("page", page);

		return "teacher_listStudent";
	}

	// ajxa异步查询返回所有教师信息到页面
	@RequestMapping("teacher_listAll.action")
	@ResponseBody
	public List<Teacher> teacherListAll(Model model) {
		List<Teacher> teacherList = teacherService.getAllTeacher();
		model.addAttribute("teacherList", teacherList);
		return teacherList;
	}

	// 根据学号查询回显学生信息
	@RequestMapping("/teacher_show.html")
	public String personalShow(String number, Model model) {
		Teacher teacher = teacherService.getTeacherByNumber(number);
		model.addAttribute("personal", teacher);

		return "teacher_edit";
	}

	// 根据id修改对应的personal信息

	@RequestMapping("/teacher_edit.html")
	public String teacherEdit(Teacher teacher, HttpSession session) {
		Teacher t = teacherService.getTeacherByNumber(teacher.getTeacher_number());

		t.setTeacher_name(teacher.getTeacher_name());
		t.setGender(teacher.getGender());
		t.setTeach_course(teacher.getTeach_course());

		teacherService.setTeacher(t);
		session.setAttribute("personal", t);

		return "redirect:/teacher_list.html";
	}

	// 根据id修改对应的personal信息（教师界面）

	@RequestMapping("/teacher_editTeacher.html")
	public String teacherEditTeacher(Teacher teacher, HttpSession session) {
		Teacher t = teacherService.getTeacherByNumber(teacher.getTeacher_number());

		t.setTeacher_name(teacher.getTeacher_name());
		t.setGender(teacher.getGender());
		t.setTeach_course(teacher.getTeach_course());

		teacherService.setTeacher(t);
		session.setAttribute("personal", t);

		return "index";
	}

	// 根据id删除对应的teacher信息

	@RequestMapping("/teacher_delete.html")
	public String teacherDelete(String number) {
		teacherService.deleteTeacher(number);

		return "redirect:/teacher_list.html";
	}

	// 管理员添加一个教师
	@RequestMapping("/teacher_add.html")
	public String teacherAdd(Teacher teacher, Model model) {
		String number = teacher.getTeacher_number();

		// 判断一下账号number是否存在
		Teacher t = teacherService.getTeacherByNumber(number);

		// 如果不为空，则该手机号不能注册
		if (t != null) {
			String error = "该老师账号已经存在！";
			model.addAttribute("error", error);
			return "teacher_add";
		}
		// 为空的话，则该账号可以注册
		// 设置管理员添加的初始用户的 密码为123

		teacher.setPassword(MD5Utils.md5("123"));

		teacherService.teacherAdd(teacher);
		return "redirect:/teacher_list.html";

	}

	// 批量删除学生（删除选中的学生）
	@RequestMapping("/teacher_deleteAll.html")
	public String teacherDeleteAll(String[] numbers) {
		try {
			if (numbers.length > 0 && numbers != null) {
				for (String number : numbers) {
					teacherService.deleteTeacher(number);
				}
			}
			return "redirect:/teacher_list.html";

		} catch (Exception e) {

			return "redirect:/teacher_list.html";
		}

	}

	// 学生选择指导老师
	@RequestMapping("/teacher_choose.html")
	public String teacherChoose(String teacher_number, HttpSession session) {
		Student student = (Student) session.getAttribute("personal");
		student.setTeacher_number(teacher_number);

		studentService.updateStudentTeacher_number(student);
		session.setAttribute("personal", student);
		return "redirect:/teacher_listStudent.html";
	}

	// 重置学生的所选指导老师
	@RequestMapping("/teacher_reset.html")
	public String teacherReset(HttpSession session) {
		Student student = (Student) session.getAttribute("personal");
		student.setTeacher_number(null);

		studentService.updateStudentTeacher_number(student);
		session.setAttribute("personal", student);

		return "redirect:/teacher_listStudent.html";
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
