package com.skillup.service;

import java.util.List;

import com.skillup.domain.BoardVO;
import com.skillup.domain.Criteria;

public interface BoardService {
	public int getTotalCount(Criteria cri);		//全体ポスト数呼び出し
	public void register(BoardVO board);		//ポスト作成
	public boolean modify(BoardVO board); //ポスト修正
	public boolean remove(Long pNo,String pass); //ポスト削除
	public BoardVO read(Long pNo);
	public BoardVO get(Long pNo);				//ポスト照会
	public List<BoardVO> getList(Criteria cri);			//ポストリスト照会

}
