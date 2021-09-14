package com.skillup.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.skillup.domain.CommentVO;
import com.skillup.domain.Criteria;

public interface CommentMapper {
	public int getCountByPNo(Long pNo);
	public List<CommentVO> getListPage(@Param("cri") Criteria cri, @Param("pNo") Long pNo);
	public int update(CommentVO vo);
	public int delete(@Param("cNo") Long cNo, @Param("cPass") String cPass);
	public CommentVO read(Long cNo);
	public int insert(CommentVO vo);
}
