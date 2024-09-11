package com.example.test1.dao;

import java.util.HashMap;

import org.springframework.stereotype.Service;

@Service
public interface EmpService {
	
	HashMap<String, Object> selectEmpList(HashMap<String, Object> map);
	
	
	HashMap<String, Object> changeEmpList(HashMap<String, Object> map);
	
}
