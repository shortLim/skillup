package com.skillup.domain;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;

@Data
@AllArgsConstructor
@Getter
public class CommentPageDTO {
	private List<CommentVO> list;
	private int cCnt;

}
