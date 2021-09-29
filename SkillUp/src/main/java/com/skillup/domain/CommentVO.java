package com.skillup.domain;

import java.util.Date;

import lombok.Data;

@Data
public class CommentVO {
	private int crno;
	private long cNo;
	private long pNo;
	private String cName;
	private String cPass;
	private String cContent;
	private Date regDate;
	private Date modiDate;
}
