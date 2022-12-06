package com.ncs.hhh;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import service.Board_likeService;
import vo.Board_likeVO;
import vo.CommentVO;


@RestController
@RequestMapping("/Like")
public class Board_likeController {
	
	@Autowired
	Board_likeService service;
	
	// 커밋용
	
	
	
	@PostMapping("/InsertLike")
	public String InsertLike(@RequestBody Board_likeVO vo,HttpSession session,
			HttpServletRequest request, HttpServletResponse response) {
		
		System.out.println("id1의 값 => "+service.likeuser(vo.getB_no(), vo.getB_type()));
		List<String> id1 = service.likeuser(vo.getB_no(), vo.getB_type());
		String id2 = (String) session.getAttribute("loginID");
		
		id1.contains(id2);
		
		  if(id2 == null) 
			{
				return "fail";
			}
				else if(id1.contains(id2)){ return "overlap"; }
		  else{
		 
			service.create(vo);
			System.out.println("좋아요 등록 서비스 성공");}
		  	System.out.println(vo);
		  
			return "InsertLike";
		
	}
	
}