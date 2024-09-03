package com.example.test1.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.test1.mapper.AreaMapper;
import com.example.test1.model.Area;


@Service
public class AreaServiceImpl implements AreaService{

	@Autowired
	AreaMapper areaMapper;
	
	@Override
	public HashMap<String, Object> selectAreaList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap <String,Object> resultmap = new HashMap<>();
		
		try {
			System.out.println(map);
			List<Area> list = areaMapper.selectAreaList(map);	
			resultmap.put("list", list);
			resultmap.put("result", "success");
		}catch(Exception e) {
			resultmap.put("result", "fail");
		}
		
		return resultmap;
	}

}
