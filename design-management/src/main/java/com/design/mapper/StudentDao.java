package com.design.mapper;

import java.util.List;

import com.design.pojo.Admin;
import com.design.pojo.Page;
import com.design.pojo.Student;

public interface StudentDao {

	Student getStudentByNumber(String number);

	List<Student> queryPage(Page<Student> page);

	Integer queryTotalCount(Page<Student> page);

	void studentAdd(Student student);

	void deleteStudent(String number);

	void setStudent(Student student);

	List<Student> getStudentByGroupId(int group_id);

	void editStudentPasswordByNumber(Student student);

	void updateStudentTopic_id(Student student);

	void updateStudentGroup_id(Student student);

	void updateStudentTeacher_number(Student student);

	void setStudentGroup_idNull(int student_id);
}
