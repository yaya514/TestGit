package com.design.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.design.mapper.AdminDao;
import com.design.pojo.Admin;
import com.design.pojo.Page;
import com.design.pojo.Student;
import com.design.pojo.Teacher;
import com.design.service.AdminService;
import com.design.service.StudentService;
import com.design.service.TeacherService;
import com.design.utils.MD5Utils;

@Controller
public class AdminController {

	@Autowired
	private StudentService studentService;
	@Autowired
	private TeacherService teacherService;
	@Autowired
	private AdminService adminService;

	@RequestMapping("/")
	private String login() {

		return "login";
	}
	
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

	@RequestMapping("/login.html")
	private String login(String number, String password, int role, Model model, HttpSession session) {
		if (role == 0) {
			// 管理员，从管理员表中查数据
			Admin admin = adminService.getAdminByNumber(number);
			
			if (admin == null) {
				model.addAttribute("error", "用户不存在！");
				return "login";
			} else {
				if (!admin.getPassword().equals(MD5Utils.md5(password))) {
					model.addAttribute("error", "用户名或密码错误！");
					return "login";
				} else {
					session.setAttribute("personal", admin);
					model.addAttribute("personal", admin);
				}
			}
			
		} else if (role == 1) {
			// 教师，从教师表中查数据
			Teacher teacher = teacherService.getTeacherByNumber(number);
			
			if (teacher == null) {
				model.addAttribute("error", "用户不存在！");
				return "login";
			} else {
				if (!teacher.getPassword().equals(MD5Utils.md5(password))) {
					model.addAttribute("error", "用户名或密码错误！");
					return "login";
				} else {
					session.setAttribute("personal", teacher);
					model.addAttribute("personal", teacher);
				}
			}
			
		} else {
			// 学生，从学生表中查数据
			Student student = studentService.getStudentByNumber(number);
			
			if (student == null) {
				model.addAttribute("error", "用户不存在！");
				return "login";
			} else {
				if (!student.getPassword().equals(MD5Utils.md5(password))) {
					model.addAttribute("error", "用户名或密码错误！");
					return "login";
				} else {
					session.setAttribute("personal", student);
					model.addAttribute("personal", student);
				}
			}
		}

		return "redirect:/index.jsp";

	}

	// 修改用户密码
	@RequestMapping("/personal_password.html")
	public String editPersonalPassword(String password, HttpSession session) {
		password = MD5Utils.md5(password);

		Admin admin = (Admin) session.getAttribute("personal");

		admin.setPassword(password);
		adminService.editAdminPasswordByNumber(admin);

		return "login";
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
