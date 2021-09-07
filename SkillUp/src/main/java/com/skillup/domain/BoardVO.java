package com.skillup.domain;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BoardVO {
	private long pNo;
	private int bNo;
	private String name;
	private String pass;
	private String title;
	private String content;
	private Date regDate;
	private Date modiDate;
	private int	cCnt;
	private long hit;
}

