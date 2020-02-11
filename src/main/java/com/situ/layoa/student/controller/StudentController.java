package com.situ.layoa.student.controller;

import java.io.Serializable;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.situ.layoa.student.domain.Student;

@RequestMapping("/student")
@RestController
public class StudentController implements Serializable {

	private static final long serialVersionUID = 1L;

	@PostMapping
	public Long doAdd(Student student) {
		System.out.println(student);
		return 1L;
	}

	@GetMapping("/checkname")
	public Integer doGet(String stuName) {
		Integer result = 1;
		if ("zhangsan".equals(stuName)) {
			result = 0;
		}
		return result;
	}
}
