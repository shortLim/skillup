package com.skillup.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skillup.domain.BoardVO;
import com.skillup.domain.Criteria;
import com.skillup.mapper.BoardMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
//@AllArgsConstructor
@Log4j
public class BoardServiceImpl implements BoardService {
	@Setter(onMethod_ = @Autowired)
	private BoardMapper mapper;

	@Override
	public int getTotalCount(Criteria cri) {
		log.info("BoardServiceImpl...getTotalCount()");
		return mapper.getTotalCount(cri);
	}

	@Override
	public List<BoardVO> getList(Criteria cri) {
		log.info("BoardServiceImpl...getList()");
		return mapper.getList(cri);
	}

	@Override
	public BoardVO get(Long pNo) {
		log.info("BoardServiceImpl...get()");
		mapper.updateHit(pNo);
		return mapper.read(pNo);
	}

	@Override
 	public void register(BoardVO board) {
		log.info("register... : " + board);
		mapper.insert(board);
	}

	@Override
	public boolean modify(BoardVO board) {
		log.info("BoardServiceImpl...modify() pNo : "+board.getPNo());
		return mapper.update(board) == 1;
	}

	@Override
	public boolean remove(Long pNo,String pass) {
		log.info("BoardServiceImpl...remove("+pNo+"+"+pass+")");
		return mapper.delete(pNo,pass) == 1;

	}

}







