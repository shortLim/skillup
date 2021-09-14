package com.skillup.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.skillup.domain.CommentPageDTO;
import com.skillup.domain.CommentVO;
import com.skillup.domain.Criteria;
import com.skillup.service.CommentService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping("/comments/")
@Log4j
@AllArgsConstructor
public class CommentController {
	private CommentService service;

	@RequestMapping(value="/{cNo}",
					method={ RequestMethod.PUT, RequestMethod.PATCH },
					consumes="application/json",
					produces={ MediaType.TEXT_PLAIN_VALUE } )
	public ResponseEntity<String> modify(@RequestBody CommentVO vo,
										 @PathVariable("cNo") Long cNo){
		log.info("CommentController modify : " + vo);
		log.info("CommentController cNo : " + cNo);
		vo.setCNo(cNo);
		int modifyCount =  service.modify(vo);	//댓글 수정
		log.info("COMMENT MODIFY COUNT : " + modifyCount);

		//성공이면 200, 실패면 500 반환
		return modifyCount == 1
			   ? new ResponseEntity<String>("success", HttpStatus.OK)
			   : new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

	@GetMapping("/{cNo}")
	public ResponseEntity<CommentVO> get(@PathVariable("cNo") Long cNo) {
		log.info("CommentController get : " + cNo);

		return new ResponseEntity<CommentVO>(service.get(cNo), HttpStatus.OK);
	}

	@DeleteMapping("/{cNo}")
	public ResponseEntity<String> remove(@PathVariable("cNo") Long cNo,
										 @RequestBody CommentVO vo) {
		log.info("CommentController remove : " + cNo);
		log.info("cPass : "+ vo.getCPass());
		//戻り値でパスワードをもらうように修正必要 2021-09-08 16:57
		return service.remove(cNo,vo.getCPass()) == 1
				   ? new ResponseEntity<String>("success", HttpStatus.OK)
				   : new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

	@GetMapping("/pages/{pNo}/{page}")
//	public ResponseEntity<List<CommentVO>> getList(
	public ResponseEntity<CommentPageDTO> getListPage(
							@PathVariable("page") int page,
							@PathVariable("pNo") Long pNo ) {
		log.info("CommentController getList : ");
		Criteria cri = new Criteria(page, 10);
		log.info("CommentController cri : " + cri);
		return new ResponseEntity<CommentPageDTO>(service.getListPage(cri, pNo), HttpStatus.OK);
	}

	@PostMapping(value="/new",
				 consumes="application/json",
				 produces= { MediaType.TEXT_PLAIN_VALUE } )
	public ResponseEntity<String> create(@RequestBody CommentVO vo){
		log.info("CommentController create vo : " + vo);
		int insertCount =  service.register(vo);	//댓글 등록
		log.info("COMMENT INSERT COUNT : " + insertCount);

		//성공이면 200, 실패면 500 반환
		return (ResponseEntity<String>) (insertCount == 1
			   ? new ResponseEntity<String>("success", HttpStatus.OK)
			   : new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR));
	}

}










