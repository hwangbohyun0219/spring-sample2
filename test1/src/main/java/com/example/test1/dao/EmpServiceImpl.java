package com.example.test1.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.example.test1.constants.ResMessage;
import com.example.test1.mapper.EmpMapper;
import com.example.test1.model.Emp;


@Service
public class EmpServiceImpl implements EmpService{

	@Autowired
	EmpMapper empMapper;

	@Override
	public HashMap<String, Object> selectEmpList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<>();
		System.out.println("map : " + map);
		List<Emp> list = empMapper.selectEmpList(map);
		try {
			resultMap.put("list", list);
			resultMap.put("result", "success");
			resultMap.put("message", ResMessage.SUCCESS);
		} catch(DataAccessException e){
			resultMap.put("message", ResMessage.DB_ACCESS_ERROR);
			resultMap.put("result", "fail");
		}catch(PersistenceException e) {
			resultMap.put("message", ResMessage.MYBATIS_ERROR);
			resultMap.put("result", "fail");
		}
		catch(Exception e) {
			resultMap.put("message", ResMessage.UNKNOWN_ERROR);
			resultMap.put("result", "fail");
			
		}
		
		return resultMap;
	}



	
	
	

}
