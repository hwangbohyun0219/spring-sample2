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
		System.out.println(map);
		
		HashMap<String, Object> resultMap 
		= new HashMap<String, Object>();
		
		int count = schoolMapper.selectSchoolCnt(map);
		List<School> school = schoolMapper.selectSchool(map);
		System.out.println(map);
		
		resultMap.put("stuList", school);
		resultMap.put("count", count);
		
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
}
