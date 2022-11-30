package com.ncs.hhh;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import criTest.PageMaker;
import criTest.SearchCriteria;
import service.CommentService;
import service.Tip_BoardService;
import vo.CommentVO;
import vo.Tip_BoardVO;


@RestController
@RequestMapping("/Comment")
public class CommentController {
	
	@Autowired
	private CommentService service;
	@Autowired
	CommentService service2;
	
	@PostMapping("/InsertComment")
	public String InsertComment(@RequestBody CommentVO vo,HttpSession session) {
		System.out.println("댓글 등록 통신 성공");
		
		  if(session.getAttribute("loginID") == null) { return "fail"; } else {
		 
			System.out.println("로긘함. 스크랩 진행");
			
			service.CommentRegist(vo);
			System.out.println("댓글 등록 서비스 성공");}
		  
			return "InsertSuccess";
		
	}

	// 커밋실험
	@RequestMapping("/CommentList/{com_bno}")
	public Map<String, Object> getList(@PathVariable int com_bno, Model model,
			HttpServletRequest request, HttpServletResponse response, CommentVO vo) {
		int com_type = Integer.parseInt(request.getParameter("com_type"));
		int offset = Integer.parseInt(request.getParameter("offset"));
		int limit = Integer.parseInt(request.getParameter("limit"));
		
		System.out.println("offset => "+offset);
		System.out.println("limit => "+limit);
		System.out.println("com_bno => "+com_bno);
		System.out.println("코맨트VO => "+vo);
		
		
		System.out.println("댓글 목록 컨트롤러 동작");
		List<CommentVO> list = service.getList(com_bno, com_type, offset,limit);
		int total = service.getTotal(com_bno, com_type);
		
		
		
		ModelAndView view = new ModelAndView();
		
		System.out.println("댓글 갯수 " + service.getTotal(com_bno, com_type));
		view.setViewName("/holoBoard/boardDetail");
		
		Map<String, Object> map = new HashMap<>();
		map.put("list", list);
		map.put("total", total);
		
		
		return map;
	}
	
	@PostMapping("/commentDelete")
	public String commentDelete(@RequestBody CommentVO vo,HttpSession session) {
		
		service.commentDelete(vo);
		System.out.println("삭제vo => "+vo);
		System.out.println();
		System.out.println("vo댓글번호"+vo.getCom_no());
			  
		return "DeleteSuccess";
		
	}
}