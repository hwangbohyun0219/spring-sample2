package com.example.test1.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.beans.factory.annotation.Autowired;

import com.example.test1.model.Area;

@Mapper
public interface AreaMapper {
	
	List<Area> selectAreaList(HashMap<String, Object> map);
	
	
}
