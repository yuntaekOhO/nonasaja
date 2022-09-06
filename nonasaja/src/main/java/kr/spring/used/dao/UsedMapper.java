package kr.spring.used.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;

import kr.spring.used.vo.UsedFavVO;
import kr.spring.used.vo.UsedVO;

@Mapper
public interface UsedMapper {
	//부모글
	public List<UsedVO> selectList(Map<String,Object> map);
	public int selectRowCount(Map<String, Object> map);
	@Insert("INSERT INTO used_board (used_num,title,"
			+ "content,kind,price,status,category,trade,reg_date,hit,region_num) "
			+ "VALUES (used_board_seq.nextval,#{title},#{content},"
			+ "#{kind},#{price},#{status},#{category},#{trade},SYSDATE,#{hit},#{region_num})")
	public void insertUsed(UsedVO used);
	public UsedVO selectUsed(Integer used_num);
	public void updateHit(Integer used_num);
	public void updateUsed(UsedVO used);
	public void deleteUsed(Integer used_num);
	public void deleteFile(Integer used_num);
	
	//부모글 좋아요
	public UsedFavVO selectFav(UsedFavVO fav);
	public int selectFavCount(Integer used_num);
	public void insertFav(UsedFavVO usedFav);
	public void deleteFav(Integer fav_num);
}