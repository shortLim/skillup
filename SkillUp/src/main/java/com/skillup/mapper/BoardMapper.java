package com.skillup.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.skillup.domain.BoardVO;

public interface BoardMapper {
	//전체 게시물 수 가져오기
	public int getTotalCount();

	//게시물 하나 조회
	public BoardVO read(Long pNo);

	//ポスト修正
	public int update(BoardVO board);

	//ポスト削除
	public int delete(@Param("pNo") Long pNo, @Param("pass") String pass);

//	@Select("SELECT * FROM tbl_board WHERE pNo > 0")
	public List<BoardVO> getList();

	//insert만 수행하는 경우
	public void insert(BoardVO board);
}









