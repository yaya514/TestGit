package com.design.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.design.pojo.Admin;
import com.design.pojo.Page;
import com.design.pojo.Student;
import com.design.pojo.Teacher;
import com.design.service.StudentService;
import com.design.utils.MD5Utils;

@Controller
public class StudentController {

	@Autowired
	private StudentService studentService;

	// 修改学生密码
	@RequestMapping("/student_password.html")
	public String editPersonalPassword(String password, HttpSession session) {
		password = MD5Utils.md5(password);

		Student student = (Student) session.getAttribute("personal");

		student.setPassword(password);
		studentService.editStudentPasswordByNumber(student);

		return "login";
	}

	// 查询所有学生

	@RequestMapping("/student_list.html")
	public String personalList(Integer currentPage, Model model, String searchName,HttpSession session) throws Exception {

		Page<Student> page = new Page<>();
		if (currentPage == null) {
			currentPage = 1;
		}

		page.setCurrentPage(currentPage);
		page.setCurrentCount(7);
		page.getParams().put("searchName", searchName);

		// 起始索引
		page.setIndex((currentPage - 1) * page.getCurrentCount());

		page = studentService.queryPage(page);

		model.addAttribute("page", page);
		
		Object object = session.getAttribute("personal");

		try {
			Admin admin = (Admin) object;
			admin.getId();
			return "student_list";
		} catch (Exception e) {
			Teacher teacher = (Teacher) object;
			teacher.getTeacher_id();
			return "student_listTeacher";
		}
	}

	//
	// 根据学号查询回显学生信息
	@RequestMapping("/student_show.html")
	public String personalShow(String number, Model model) {
		Student student = studentService.getStudentByNumber(number);
		model.addAttribute("personal", student);

		return "student_edit";
	}

	// 根据id修改对应的personal信息(管理员)
	@RequestMapping("/student_edit.html")
	public String personalEdit(Student student) {
		Student s = studentService.getStudentByNumber(student.getStudent_number());
		
		s.setStudent_name(student.getStudent_name());
		s.setGender(student.getGender());
		s.setProfession(student.getProfession());
		s.setTeacher_number(student.getTeacher_number());
		
		studentService.setStudent(s);

		return "redirect:/student_list.html";
	}
	
	//根据id修改对应的personal信息(用户自己)
	@RequestMapping("/student_editStudent.html")
	public String personalEditStudent(Student student,HttpSession session) {
		Student s = (Student) session.getAttribute("personal");
		s.setStudent_name(student.getStudent_name());
		s.setGender(student.getGender());
		s.setProfession(student.getProfession());
		
		studentService.setStudent(s);
		session.setAttribute("personal", s);
		return "index";
	}

	// 根据id删除对应的student信息

	@RequestMapping("/student_delete.html")
	public String deleteStudent(String number) {
		studentService.deleteStudent(number);

		return "redirect:/student_list.html";
	}

	// 管理员添加一个学生
	@RequestMapping("/student_add.html")
	public String personalAdd(Student student, Model model) {
		String number = student.getStudent_number();

		// 判断一下账号number是否存在
		Student s = studentService.getStudentByNumber(number);

		// 如果不为空，则该手机号不能注册
		if (s != null) {
			String error = "该学生账号已经存在！";
			model.addAttribute("error", error);
			return "student_add";
		}
		// 为空的话，则该账号可以注册
		// 设置管理员添加的初始用户的 密码为123

		student.setPassword(MD5Utils.md5("123"));

		studentService.studentAdd(student);
		return "redirect:/student_list.html";

	}

	// 批量删除学生（删除选中的学生）
	@RequestMapping("/student_deleteAll.html")
	public String studentDeleteAll(String[] numbers) {
		try {
			if (numbers.length > 0 && numbers != null) {
				for (String number : numbers) {
					studentService.deleteStudent(number);
				}
			}
			return "redirect:/student_list.html";

		} catch (Exception e) {

			return "redirect:/student_list.html";
		}

	}
	
	//教师选择学生
	@RequestMapping("/student_chooseTeacher.html")
	public String studentChooseTeacher(String student_number,HttpSession session) {
		Student student = studentService.getStudentByNumber(student_number);
		Teacher teacher = (Teacher) session.getAttribute("personal");
		
		student.setTeacher_number(teacher.getTeacher_number());
		studentService.updateStudentTeacher_number(student);
		
		return "redirect:/student_list.html";
	}
	
	//教师解除选中的学生
	@RequestMapping("/student_reset.html")
	public String studentReset(String student_number,HttpSession session) {
		Student student = studentService.getStudentByNumber(student_number);
		student.setTeacher_number(null);
		
		studentService.updateStudentTeacher_number(student);
		return "redirect:/student_list.html";
	}
}
