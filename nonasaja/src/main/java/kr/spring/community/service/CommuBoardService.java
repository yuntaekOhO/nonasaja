package kr.spring.community.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import kr.spring.community.vo.CommunityFavVO;
import kr.spring.community.vo.CommunityVO;

public interface CommuBoardService {
	//유머글
	public List<CommunityVO> selectList(Map<String,Object> map);
	public int selectRowCount(Map<String,Object> map);
	public void insertBoard(CommunityVO board);
	public CommunityVO selectBoard(Integer commu_num);
	public void updateHit(Integer commu_num);
	public void updateBoard(CommunityVO board);
	public void deleteBoard(Integer commu_num);
	
	//부모글 좋아요
	public CommunityFavVO selectFav(CommunityFavVO fav);
	public int selectFavCount(Integer commu_num);
	public void insertFav(CommunityFavVO boardFav);
	public void deleteFav(Integer fav_num);
	
}
