package kr.spring.cart.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;

import kr.spring.cart.vo.CartVO;

public interface CartService {
	// 장바구니에 상품 담기
	public void insertCart(CartVO cart);

	// 회원별(mem_num) 총구매액
	public int selectTotalByMem_num(int mem_num);

	//장바구니 주문 수
	public int selectRowCount(Map<String, Object> map);
	
	// 장바구니 목록
	public List<CartVO> selectListCart(Map<String, Object> map);

	// 장바구니 상세
	public CartVO selectCart(CartVO cart);
	
	//장바구니 상세(카트번호로)
	public CartVO selectCartByCartNum(int cart_num);

	// 장바구니 수정 (개별 상품 수량 수정)
	public void updateCart(CartVO cart);
	
	//상품의 주문 대기 수 확인 
	public int selectWait(int product_num);
		
	//구매대기(status)수정 
	public void updateCartWait(int cart_num, int status);

	// 장바구니 삭제
	public void deleteCart(int cart_num);
}
