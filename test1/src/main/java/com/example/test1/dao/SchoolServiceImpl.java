package com.example.test1.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.test1.mapper.SchoolMapper;
import com.example.test1.model.School;
import com.example.test1.model.Student;

@Service
public class SchoolServiceImpl implements SchoolService {
	
	@Autowired
	SchoolMapper schoolMapper;
	
	@Override
	public HashMap<String, Object> selectSchool(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		
		
		HashMap<String, Object> resultMap 
		= new HashMap<String, Object>();
		
		
		List<School> school = schoolMapper.selectSchool(map);
		
		
		resultMap.put("stuList", school);
		
		
		return resultMap;
		
		
	}

	

	@Override
	public HashMap<String, Object> deleteSchool(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap
		= new HashMap<String, Object>();
		try {
			schoolMapper.deleteSchool(map);;
			resultMap.put("message", "삭제되었습니다.");
		} catch (Exception e) {
			// TODO: handle exception
			resultMap.put("message", "예기치 못한 문제가 발생했습니다. \n나중에 다시 시도해주세요.");
		}
		
		return resultMap;
	}



	@Override
	public HashMap<String, Object> selectSchoolCnt(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap 
		= new HashMap<String, Object>();
		System.out.println(map);
		
		int count = schoolMapper.selectSchoolCnt(map);
		List<School> list = schoolMapper.selectSchool(map);
		
		resultMap.put("list", list);
		resultMap.put("count", count);
		resultMap.put("message", "success");
		return resultMap;
		
	}
}
