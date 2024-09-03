package com.example.test1.dao;

import java.util.HashMap;

public interface ChartService {
	
	// 게시글 목록
	HashMap<String,Object> selectPaymentList(HashMap<String,Object> map);
		
	
	HashMap<String,Object> selectAreaList(HashMap<String,Object> map);
	
}
