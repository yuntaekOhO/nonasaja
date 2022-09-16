package kr.spring.order.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import kr.spring.order.vo.OrderVO;

@Mapper
public interface OrderMapper {
	//주문 등록
	@Insert("insert into norder "
			+ "(order_num,mem_num,total_name,order_total,"
			+ "status,receive_name,receive_post,"
			+ "receive_address1,receive_address2,"
			+ "receive_phone,notice,reg_date) "
			+ "values(norder_seq.nextval,#{mem_num}"
			+ "#{total_name},#{order_total},"
			+ "#{status},#{receive_name},#{receive_post},"
			+ "#{receive_address1},#{receive_address2},"
			+ "#{receive_phone},#{notice},sysdate)")
	public void insertOrder(OrderVO order); 
	
	//주문 상세 등록
	@Insert("insert into norder_detail "
			+ "(detail_num,product_num,product_name,"
			+ "product_price,product_total,"
			+ "order_quantity,order_num)"
			+ "values(norder_detail.seq,"
			+ "#{product_num},#{product_name},"
			+ "#{product_price},#{product_total},"
			+ "#{order_quantity},#{order_num})")
	public void insertOrder_datail(OrderVO order);
	
	//상품별 주문 대기 수 구하기
	@Select("select count(*) from norder_detail where product_num=#{prododuct_num} and wait_status=1")
	public int selectWaitCount(int product_num);
	
	//주문의 status 수정하기
	
	//주문 수정 
	
	//회원별 주문 목록의 수
	public int selectOrderCount(Map<String,Object> map);
	
	//회원별 주문 목록 
	public List<OrderVO> selectOrderList(Map<String,Object> map);
	
	//주문 상세
	
}













