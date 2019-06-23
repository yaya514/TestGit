package com.design.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.design.mapper.StudentDao;
import com.design.pojo.Page;
import com.design.pojo.Student;

@Service
public class StudentService {

	@Autowired
	private StudentDao studentDao;
	
	public Student getStudentByNumber(String number) {
		return studentDao.getStudentByNumber(number);
	}

	public Page<Student> queryPage(Page<Student> page) {
		List<Student> studentList = studentDao.queryPage(page);

		Integer totalCount = studentDao.queryTotalCount(page);

		// 总记录数
		page.setTotalCount(totalCount);
		// 总页数
		page.setTotalPage((int) Math.ceil(totalCount / (page.getCurrentCount() * 1.0)));
		// personal对象集合
		page.setList(studentList);

		return page;
	}

	public void studentAdd(Student student) {
		studentDao.studentAdd(student);
	}

	public void deleteStudent(String number) {
		studentDao.deleteStudent(number);
	}

	public void setStudent(Student student) {
		studentDao.setStudent(student);
		
	}

	public List<Student> getStudentByGroupId(int group_id) {
		return studentDao.getStudentByGroupId(group_id);
	}

	public void editStudentPasswordByNumber(Student student) {
		studentDao.editStudentPasswordByNumber(student);
	}

	public void updateStudentTopic_id(Student student) {
		studentDao.updateStudentTopic_id(student);
	}

	public void updateStudentGroup_id(Student student) {
		studentDao.updateStudentGroup_id(student);
	}

	public void updateStudentTeacher_number(Student student) {
		studentDao.updateStudentTeacher_number(student);
	}

	
//	public Personal getPersonalByNumber(String number) {
//		Personal personal = personalDao.getPersonalByNumber(number);
//		return personal;
//	}
//
//	public void register(Personal personal) {
//		personalDao.register(personal);
//		
//	}
//
//	public Personal checkNumber(String number) {
//		Personal personal = personalDao.checkNumber(number);
//		return personal;
//	}
//
//	public void editPersonalInfo(Personal personal) {
//		personalDao.editPersonalInfo(personal);
//	}
//
//	public void editPersonalPasswordByNumber(Personal personal) {
//		personalDao.editPersonalPasswordByNumber(personal);
//	}
//
//	public List<Personal> getPersonalList() {
//		List<Personal> personalList = personalDao.getPersonalList();
//		return personalList;
//	}
//
//	public Personal getPersonalById(Integer id) {
//		Personal personal = personalDao.getPersonalById(id);
//		return personal;
//	}
//
//	public void updatePersonal(Personal personal) {
//		personalDao.updatePersonal(personal);
//	}
//
//	public void deletePersonal(Integer id) {
//		personalDao.deletePersonal(id);
//	}
//
//	public Page<Personal> queryPage(Page<Personal> page) {
//		List<Personal> personalList = personalDao.queryPage(page);
//
//		Integer totalCount = personalDao.queryTotalCount(page);
//
//		// 总记录数
//		page.setTotalCount(totalCount);
//		// 总页数
//		page.setTotalPage((int) Math.ceil(totalCount / (page.getCurrentCount()*1.0)));
//		// personal对象集合
//		page.setList(personalList);
//
//		return page;
//	}
//
//	public void personalAdd(Personal personal) {
//		personalDao.personalAdd(personal);
//	}
//
//	public void updatePersonalMoney(Personal personal) {
//		
//		personalDao.updatePersonalMoney(personal);
//	}
//
//	public void updatePersonalScoreById(Personal personal) {
//		personalDao.updatePersonalScoreById(personal);
//	}

}
