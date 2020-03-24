package com.nwnu.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.nwnu.common.utils.Page;
import com.nwnu.pojo.Student;
import com.nwnu.pojo.User;

public interface StudentService {

	
	public Page<Student> findStudentList(Student student,Integer page,Integer size);
	public Integer insertStudent(Student student);
	public Integer updateStudent(Student student);
	public Integer deleteStudent(Integer id);
	public Student getStudentById(Integer id);
	
}
