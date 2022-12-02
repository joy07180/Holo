package service;

import java.util.ArrayList;
import java.util.List;

import vo.Board_likeVO;

public interface Board_likeService {
	
	void create(Board_likeVO vo); //추천하기
	
	int countbyLike(int b_no, int b_type);
	
	ArrayList<String> likeuser(int b_no, int b_type);
	
}
