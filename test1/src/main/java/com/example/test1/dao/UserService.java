package com.example.test1.dao;

import java.util.HashMap;

public interface UserService {
	// 중복 체크 및 사용자 상세 정보
	HashMap<String, Object> searchUserInfo(HashMap<String, Object> map);
	
	// 사용자 목록
	HashMap<String, Object> searchUserList(HashMap<String, Object> map);
	
	// 게시글 목록(실습용, 삭제 예정)
	HashMap<String, Object> boardList(HashMap<String, Object> map);
	
	// 사용자 삭제
	HashMap<String, Object> removeUser(HashMap<String, Object> map);
	
	// 사용자 로그인
	HashMap<String, Object> userLogin(HashMap<String, Object> map);
	
}
