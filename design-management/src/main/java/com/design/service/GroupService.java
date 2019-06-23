package com.design.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.design.mapper.GroupDao;
import com.design.pojo.Mygroup;
import com.design.pojo.Page;
import com.design.pojo.Student;
import com.design.pojo.Teacher;

@Service
public class GroupService {

	@Autowired
	private GroupDao groupDao;
	
	@Autowired
	private StudentService studentService;
	@Autowired
	private TeacherService teacherService;

	
	public Page<Mygroup> queryPage(Page<Mygroup> page) {
		List<Mygroup> groupList = groupDao.queryPage(page);

		Integer totalCount = groupDao.queryTotalCount(page);
		
		List<Mygroup> list = new ArrayList<Mygroup>();
		
		for (Mygroup group : groupList) {
			int group_id = group.getGroup_id();

			List<Student> studentList = studentService.getStudentByGroupId(group_id);
			List<Teacher> teacherList = teacherService.getTeacherByGroupId(group_id);
			group.setStudentList(studentList);
			group.setTeacherList(teacherList);

			list.add(group);
		}

		// 总记录数
		page.setTotalCount(totalCount);
		// 总页数
		page.setTotalPage((int) Math.ceil(totalCount / (page.getCurrentCount() * 1.0)));
		// personal对象集合
		page.setList(groupList);

		return page;
	}


	public Mygroup getGroupByName(String groupName) {
		return groupDao.getGroupByName(groupName);
	}


	public void groupAdd(Mygroup mygroup) {
		groupDao.groupAdd(mygroup);
	}


	public void groupDelete(Integer group_id) {
		groupDao.groupDelete(group_id);
	}


	public List<Mygroup> getAllGroup() {
		return groupDao.getAllGroup();
	}


	public Mygroup getGroupById(int group_id) {
		return groupDao.getGroupById(group_id);
	}


	public void groupUPdate(Mygroup group) {
		groupDao.groupUPdate(group);
	}


	public void groupSetPlanidNull(int group_id) {
		groupDao.groupSetPlanidNull(group_id);
	}
}
