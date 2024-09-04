package com.example.test1.dao;

import java.util.HashMap;

import org.springframework.stereotype.Service;

import com.example.test1.mapper.SchoolMapper;

@Service
public interface SchoolService {
	
	
	HashMap<String, Object> selectSchool(HashMap<String, Object> map);
	
	HashMap<String, Object> deleteSchool(HashMap<String, Object> map);
	
	HashMap<String, Object> selectSchoolCnt(HashMap<String, Object> map);
}
