package com.design.pojo;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class Mygroup implements Serializable {

	private int group_id; 		//小组id
	private String group_name; 	//小组名称
	private List<Teacher> teacherList = new ArrayList<Teacher>(); //小组老师成员（集合）
	private List<Student> studentList = new ArrayList<Student>(); //小组答辩学生（集合）
	private int plan_id;
	
	public int getGroup_id() {
		return group_id;
	}
	public void setGroup_id(int group_id) {
		this.group_id = group_id;
	}
	public String getGroup_name() {
		return group_name;
	}
	public void setGroup_name(String group_name) {
		this.group_name = group_name;
	}
	public List<Teacher> getTeacherList() {
		return teacherList;
	}
	public void setTeacherList(List<Teacher> teacherList) {
		this.teacherList = teacherList;
	}
	public List<Student> getStudentList() {
		return studentList;
	}
	public void setStudentList(List<Student> studentList) {
		this.studentList = studentList;
	}
	public int getPlan_id() {
		return plan_id;
	}
	public void setPlan_id(int plan_id) {
		this.plan_id = plan_id;
	}
	
	
}
