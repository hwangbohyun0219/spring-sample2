package com.example.test1.model;

import lombok.Data;

@Data
public class Tblitem {
	private int boardNo;
	private String title;
	private String contents;
	private String userId;
	private int hit;
	private String category;
	private String favorite;
	private String tag1;
	private String tag2;
	private String noticeYn;
	private String cdateTime;
	private String udateTime;
	private String email;
	
	private String userName;
	
	private String commentNo;
	private String pCommnetNo;
}
