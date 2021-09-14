package com.skillup.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.skillup.domain.CommentPageDTO;
import com.skillup.domain.CommentVO;
import com.skillup.domain.Criteria;
import com.skillup.mapper.BoardMapper;
import com.skillup.mapper.CommentMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class CommentServiceImpl implements CommentService {

	@Setter(onMethod_ = @Autowired)
	private CommentMapper mapper;

	@Setter(onMethod_ = @Autowired)
	private BoardMapper bMapper;

	@Override
	public CommentPageDTO getListPage(Criteria cri, Long pNo) {
		log.info("CommentServiceImpl getListPage() pNo : "+ pNo);
		return new CommentPageDTO(mapper.getListPage(cri, pNo),mapper.getCountByPNo(pNo));
	}

	/*	@Override
		public List<CommentVO> getList(Criteria cri, Long pNo) {
			log.info("CommentServiceImpl getList() pNo : "+ pNo);
			return mapper.getList(cri, pNo);
		}
	*/
	@Override
	public int modify(CommentVO vo) {
		log.info("CommentServiceImpl modify() vo : "+ vo);
		return mapper.update(vo);
	}

	@Transactional
	@Override
	public int remove(Long cNo, String cPass) {
		log.info("CommentServiceImpl remove() cNo : "+cNo+", cPass : "+ cPass);
		bMapper.updateCCnt(cNo, -1);
		return mapper.delete(cNo, cPass);
	}

	@Override
	public CommentVO get(Long cNo) {
		log.info("CommentServiceImpl get() cNo : "+ cNo);
		return mapper.read(cNo);
	}

	@Override
	public int register(CommentVO vo) {
		log.info("CommentServiceImpl register() vo : "+vo);
		bMapper.updateCCnt(vo.getPNo(), 1);
		return mapper.insert(vo);
	}

}
