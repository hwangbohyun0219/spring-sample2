package com.example.test1.dao;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.test1.mapper.UserMapper;
import com.example.test1.model.Board;
import com.example.test1.model.User;

@Service
public class UserServiceImpl implements UserService{
	
	@Autowired
	UserMapper userMapper;
	
	@Autowired
	HttpSession session;
	
	@Override
	public HashMap<String, Object> searchUserInfo(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap 
			= new HashMap<String, Object>();
		
		try {
			User user = userMapper.selectUserInfo(map);
			resultMap.put("info", user);
			resultMap.put("result", "success");
			resultMap.put("message", "조회되었음");
		} catch (Exception e) {
			// TODO: handle exception
			resultMap.put("result", "fail");
			resultMap.put("message", "이상한 문제 발생");
		}
		
		return resultMap;
	}

	@Override
	public HashMap<String, Object> searchUserList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap =
				new HashMap<String, Object>();
		try {
			System.out.println(map);
			List<User> list = userMapper.selectUserList(map);
			resultMap.put("list", list);
			resultMap.put("result", "success");
		} catch (Exception e) {
			// TODO: handle exception
			resultMap.put("result", "fail");
		}
		
		return resultMap;
	}

	@Override
	public HashMap<String, Object> boardList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap =
				new HashMap<String, Object>();
		try {
			List<Board> list = userMapper.boardList(map);
			resultMap.put("list", list);
			resultMap.put("result", "success");
		} catch (Exception e) {
			// TODO: handle exception
			resultMap.put("result", "fail");
		}
		
		return resultMap;
	}

	@Override
	public HashMap<String, Object> removeUser(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap =
				new HashMap<String, Object>();
		try {
			userMapper.deleteUser(map);
			resultMap.put("result", "success");
		} catch (Exception e) {
			// TODO: handle exception
			resultMap.put("result", "fail");
		}
		
		return resultMap;
	}

	@Override
	public HashMap<String, Object> userLogin(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap =
				new HashMap<String, Object>();
		try {
			User user = userMapper.userLogin(map);
			if(user == null) {
				resultMap.put("result", "fail");
				User idCheck = userMapper.selectUserInfo(map);
				if(idCheck == null) {
					resultMap.put("message", "없는 아이디 입니다.");
				} else {
					resultMap.put("message", "비밀번호를 다시 확인하세요");
				}
			} else {
				resultMap.put("result", "success");
				resultMap.put("message", "로그인 성공!");
				session.setAttribute("sessionId", user.getUserId());
				session.setAttribute("sessionName", user.getUserName());
			}
		} catch (Exception e) {
			// TODO: handle exception
			resultMap.put("result", "fail");
			resultMap.put("message", "예기치 못한 문제 발생 \n 나중에 다시 시도");
		}
		
		return resultMap;
	}

}
