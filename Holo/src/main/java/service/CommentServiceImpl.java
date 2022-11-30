package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mapperInterface.CommentMapper;
import vo.CommentVO;

@Service
public class CommentServiceImpl implements CommentService {
	@Autowired
	CommentMapper mapper;
	
	@Override
	public void CommentRegist(CommentVO vo) {
		mapper.CommentRegist(vo);

	}

	@Override
	public List<CommentVO> getList(int com_bno, int com_type, int offset, int limit) {
		return mapper.getList(com_bno, com_type, offset, limit);
	}

	@Override
	public int getTotal(int com_bno, int com_type) {
		// TODO Auto-generated method stub
		return mapper.getTotal(com_bno, com_type);
	}

	@Override
	public List<CommentVO> myRecord(String writer) {
		return mapper.myRecord(writer);
	}

	@Override
	public void commentDelete(CommentVO vo) {
		mapper.commentDelete(vo);
		
	}
	
	@Override
	public List<CommentVO> getComList(String com_wrtier) {
		return mapper.getComList(com_wrtier);
	}
	
}
