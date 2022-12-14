package kr.spring.order.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.spring.order.vo.OrderDetailVO;
import kr.spring.order.vo.OrderVO;

public interface OrderService {
	public void insertOrder(OrderVO order, List<OrderDetailVO> orderDetailList);

	//상품별 결제 대기 수
	public int selectWaitCount(int product_num);

	// 주문 수정
	public void updateOrder(OrderVO order);
	
	//주문의 status 수정하기
	public void updateWaitStatus(int detail_num, int wait_status);

	// 회원별 주문 목록의 수
	public int selectOrderCount(Map<String, Object> map);

	//회원별 주문 대기 주문 가격 합
	public int selectSumWait(int mem_num);

	// 회원별 주문 목록
	public List<OrderVO> selectOrderList(Map<String, Object> map);

	// 회원별 주문 목록
	public List<OrderDetailVO> selectOrderDetailList(Map<String, Object> map);

	//상품별 주문대기 리스트
	public List<OrderDetailVO> selectWaitList(int product_num);

	// 주문 상세
	public OrderVO selectOrder(int order_num);

	//주문대기상태 orderDetail 삭제
	public void deleteWait(int detail_num);

	//Order 삭제
	public void deleteOrder(int order_num);

	//order_num 별 order_detail List
	public List<OrderDetailVO> selectOrderDetailByOrderNum(int order_num);
	
	//detail_num으로 order_num 구하기
	public int selectOrderNumByDetailNum(int detail_num);
}
