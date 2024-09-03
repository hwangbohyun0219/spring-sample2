package com.example.test1.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.test1.dao.BoardService;
import com.example.test1.dao.ChartService;
import com.google.gson.Gson;

@Controller
public class ChartController {

	@Autowired
	ChartService chartService;
	
	//차트구성하기
	@RequestMapping("/chart.do") 
    public String chart(Model model) throws Exception{

        return "/chart";
    }
	
	@RequestMapping(value = "/chart.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String chartHi(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap 
			= new HashMap<String, Object>();
		System.out.println("con");

		resultMap = chartService.selectPaymentList(map);
		
		return new Gson().toJson(resultMap);
	}
	
	
	
}
