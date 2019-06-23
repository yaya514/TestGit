package com.design.mapper;

import java.util.List;

import com.design.pojo.Page;
import com.design.pojo.Teacher;

public interface TeacherDao {


	List<Teacher> queryPage(Page<Teacher> page);

	Integer queryTotalCount(Page<Teacher> page);

	void teacherAdd(Teacher teacher);

	void deleteTeacher(String number);

	void setTeacher(Teacher teacher);

	Teacher getTeacherByNumber(String number);

	List<Teacher> getAllTeacher();

	List<Teacher> getTeacherByGroupId(int group_id);

	void editTeacherPasswordByNumber(Teacher teacher);

	void updateTeacherGroup_id(Teacher teacher);

}
