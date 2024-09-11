package com.example.test1.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.test1.model.Emp;

@Mapper
public interface EmpMapper {
	
	List<Emp> selectEmpList(HashMap<String, Object> map);
	
	
	
}
