package com.example.test1.dao;

import java.util.HashMap;

import org.springframework.stereotype.Service;

@Service
public interface AreaService {
	
	HashMap<String, Object> selectAreaList(HashMap<String, Object>map);
	
	
}
