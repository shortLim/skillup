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

	@GetMapping({ "/get", "/modify" }) //게시물 조회 또는 수정
	public void get(@RequestParam("pNo") long pNo,
			@ModelAttribute("cri") Criteria cri,
			Model model) {
		log.info("BoardController...get() or modify()");
		model.addAttribute("board", service.get(pNo));
	}

	@PostMapping("/modify") //ポスト修正
	public String modify(BoardVO board, RedirectAttributes rttr) {
		if (service.modify(board)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/board/list";
	}

	@GetMapping({ "/boardRead", "/update" }) //게시물 조회 또는 수정
	public void read(@RequestParam("pNo") long pNo,
			@ModelAttribute("cri") Criteria cri,
			Model model) {
		log.info("BoardController...read() or update()");
		model.addAttribute("board", service.get(pNo));
	}

	@PostMapping("/update") //ポスト修正
	public String update(BoardVO board, RedirectAttributes rttr) {
		if (service.modify(board)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/board/list";
	}

	@PostMapping("/remove") //ポスト削除
	public String remove(Long pNo, String pass, RedirectAttributes rttr) {
		log.info("BoardController...remove(" + pNo + "+" + pass + ")");
		if (service.remove(pNo, pass)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/board/list";
	}

	@GetMapping("/register") //ポスト作成画面へ移動
	public void register() {
	}

	@PostMapping("/register") //ポスト作成処理
	public String register(BoardVO board, RedirectAttributes rttr) {
		log.info("BoardController...register()");
		service.register(board);
		rttr.addFlashAttribute("result", board.getPNo());
		return "redirect:/board/list";
	}

	@RequestMapping(value = "/boardWrite")
	public String boardWrite() {
		return "board/boardWrite";
	}

	@PostMapping("/boardWrite") //ポスト作成処理(board Ver.)
	public String boardWrite(BoardVO board, RedirectAttributes rttr) {
		log.info("BoardController...register()");

		service.register(board);
		rttr.addFlashAttribute("result", board.getPNo());
			return "redirect:/board/boardSell";
	}

	// for the test
	@RequestMapping(value = "/boardModify")
	public String boardModify() {
		return "board/boardModify";
	}

	@GetMapping("/list") //掲示板の全てのポスト呼び出し
	public void list(Criteria cri, Model model) {
		log.info("BoardController...list()");
		int total = service.getTotalCount(cri);
		model.addAttribute("list", service.getList(cri));
		model.addAttribute("pageMaker", new PageDTO(total, cri));
	}

	@RequestMapping(value = "/boardUp")
	public String boardUp() {
		return "board/boardUp";
	}

	@RequestMapping(value = "/boardMain")
	public String boardMain() {
		return "board/boardMain";
	}

	@RequestMapping(value = "/boardBuy")
	public String boardBuy(Criteria cri, Model model) {
		log.info("BoardController...listBuy()");
		int total = service.getTotalCount(cri);
		model.addAttribute("list", service.getList(cri));
		model.addAttribute("pageMaker", new PageDTO(total, cri));
		return "board/boardBuy";
	}

	@RequestMapping(value = "/boardSell")
	public String boardSell(Criteria cri, Model model) {
		log.info("BoardController...listSell()");
		int total = service.getTotalCount(cri);
		model.addAttribute("list", service.getList(cri));
		model.addAttribute("pageMaker", new PageDTO(total, cri));
		return "board/boardSell";
	}

	@RequestMapping(value = "/boardFree")
	public String boardFree(Criteria cri, Model model) {
		log.info("BoardController...listFree()");
		int total = service.getTotalCount(cri);
		model.addAttribute("list", service.getList(cri));
		model.addAttribute("pageMaker", new PageDTO(total, cri));
		return "board/boardFree";
	}

}
