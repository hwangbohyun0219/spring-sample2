package com.example.test1.dao;

import java.util.HashMap;

public interface SchoolService {
	
	HashMap<String, Object> selectSchool(HashMap<String, Object> map);
	
	HashMap<String, Object> deleteSchool(HashMap<String, Object> map);
}
