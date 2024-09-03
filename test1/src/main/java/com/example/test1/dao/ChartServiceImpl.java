package com.example.test1.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.test1.mapper.ChartMapper;
import com.example.test1.model.Chart;

@Service
public class ChartServiceImpl implements ChartService{

	@Autowired
	ChartMapper  chartMapper;
	
	@Override
	public HashMap<String, Object> selectPaymentList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap <String, Object> resultmap = new HashMap<String, Object>();
		
		
		try {
			List<Chart> list = chartMapper.selectPaymentList(map);
			System.out.println(list);
			resultmap.put("list",list);
			resultmap.put("result","success");
		} catch(Exception e) {
		    resultmap.put("result", "fail");
		}
		
		
		return resultmap;
	}

}
