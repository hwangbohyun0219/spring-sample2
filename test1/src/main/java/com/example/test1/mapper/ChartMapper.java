package com.example.test1.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.test1.model.Board;
import com.example.test1.model.Chart;
import com.example.test1.model.User;

@Mapper
public interface ChartMapper {
	
	List<Chart> selectPaymentList(HashMap<String, Object> map);
	
	List<Chart> selectAreaList(HashMap<String, Object> map);
	
}