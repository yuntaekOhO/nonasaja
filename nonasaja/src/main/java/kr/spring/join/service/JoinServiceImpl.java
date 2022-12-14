package kr.spring.join.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.spring.join.vo.JoinVO;
import kr.spring.join.dao.JoinMapper;
@Service
@Transactional
public class JoinServiceImpl implements JoinService{
	
	@Autowired
	private JoinMapper joinMapper;
	
	@Override
	public void insertJoin(JoinVO join) {
		joinMapper.insertJoin(join);
		
	}
	 @Override
	 public List<JoinVO> selectListJoin(int mem_num) { 
		 return joinMapper.selectListJoin(mem_num); 
	 }
	 
	@Override
	public JoinVO selectJoin(JoinVO join) {
		return joinMapper.selectJoin(join);
	}

	@Override
	public void deleteJoin(int join_num) {
		joinMapper.deleteJoin(join_num);
		
	}
	@Override
	public int selectJoinCount(int club_num) {
		return joinMapper.selectJoinCount(club_num);
	}
	@Override
	public void deleteByJoinNum(Integer club_num) {
		joinMapper.deleteByJoinNum(club_num);
		
	}
	@Override
	public JoinVO selectJoinByJoinNum(int join_num) {
		return joinMapper.selectJoinByJoinNum(join_num);
	}

}
