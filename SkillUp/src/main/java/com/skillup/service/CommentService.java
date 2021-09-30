package com.skillup.service;

import com.skillup.domain.CommentPageDTO;
import com.skillup.domain.CommentVO;
import com.skillup.domain.Criteria;

public interface CommentService {
	public CommentPageDTO getListPage(Criteria cri, Long pNo);
	public int register(CommentVO vo);
	public int modify(CommentVO vo);
	public int remove(Long cNo, String cPass);
	public CommentVO get(Long cNo);


}
