package com.example.test1.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.test1.dao.EmpService;
import com.google.gson.Gson;

@Controller
public class EmpController {

	@Autowired
	EmpService empService;
	
	
	@RequestMapping("/emp1.do") 
    public String boardList(Model model) throws Exception{

        return "/emp-list";
    }
	
	
	@RequestMapping(value = "/emp1.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String select(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap 
			= new HashMap<String, Object>();
		System.out.println("map22" + map);
		resultMap = empService.selectEmpList(map);		
		return new Gson().toJson(resultMap);
	}
	
	
	
}
