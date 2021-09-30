package com.skillup.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.skillup.domain.BoardVO;
import com.skillup.domain.Criteria;
import com.skillup.domain.PageDTO;
import com.skillup.service.BoardService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/board/*")
@AllArgsConstructor
public class BoardController {

	private BoardService service;

	//ポスト照会
	@GetMapping({ "/boardRead","/boardModify" })
	public void get(@RequestParam("pNo") long pNo,
			@ModelAttribute("cri") Criteria cri,
			Model model) {
		log.info("BoardController...get()or update()");
		model.addAttribute("board", service.get(pNo));
	}

	//ポスト修正
	@PostMapping("/boardModify")
	public String update(BoardVO board) {
		service.modify(board);
		return "redirect:/board/boardSell";
	}

	//ポスト削除
	@PostMapping("/remove")
	public String remove(Long pNo, String pass, RedirectAttributes rttr) {
		log.info("BoardController...remove(" + pNo + "+" + pass + ")");
		if (service.remove(pNo, pass)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/board/boardSell";
	}

	//各ページへ移動
	@GetMapping({"/boardMain","/boardUp","/boardWrite"})
	public void move() {}

	//ポスト作成処理
	@PostMapping("/boardWrite")
	public String boardWrite(BoardVO board, RedirectAttributes rttr) {
		log.info("BoardController...register()");
		service.register(board);
		rttr.addFlashAttribute("result", board.getPNo());
			return "redirect:/board/boardSell";
	}

	//各掲示板へ移動
	@GetMapping({"/boardBuy","/boardSell","/boardFree"})
	public void list(Criteria cri, Model model) {
		log.info("BoardController...list()");
		int total = service.getTotalCount(cri);
		model.addAttribute("list", service.getList(cri));
		model.addAttribute("pageMaker", new PageDTO(total, cri));
	}

}
