package com.design.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.design.mapper.TeacherDao;
import com.design.pojo.Page;
import com.design.pojo.Teacher;

@Service
public class TeacherService {
	
	@Autowired
	private TeacherDao teacherDao;
	
	public Teacher getTeacherByNumber(String number) {
		return teacherDao.getTeacherByNumber(number);
	}

	public Page<Teacher> queryPage(Page<Teacher> page) {
		List<Teacher> teacherList = teacherDao.queryPage(page);

		Integer totalCount = teacherDao.queryTotalCount(page);

		// 总记录数
		page.setTotalCount(totalCount);
		// 总页数
		page.setTotalPage((int) Math.ceil(totalCount / (page.getCurrentCount() * 1.0)));
		// personal对象集合
		page.setList(teacherList);

		return page;
	}


	public void teacherAdd(Teacher teacher) {
		teacherDao.teacherAdd(teacher);
	}

	public void deleteTeacher(String number) {
		teacherDao.deleteTeacher(number);
	}

	public void setTeacher(Teacher teacher) {
		teacherDao.setTeacher(teacher);
		
	}

	public List<Teacher> getAllTeacher() {
		return teacherDao.getAllTeacher();
	}

	public List<Teacher> getTeacherByGroupId(int group_id) {
		return teacherDao.getTeacherByGroupId(group_id);
	}

	public void editTeacherPasswordByNumber(Teacher teacher) {
		teacherDao.editTeacherPasswordByNumber(teacher);
	}

	public void updateTeacherGroup_id(Teacher teacher) {
		teacherDao.updateTeacherGroup_id(teacher);
	}

}
