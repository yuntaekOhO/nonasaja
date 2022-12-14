package kr.spring.cart.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.cart.service.CartService;
import kr.spring.cart.vo.CartVO;
import kr.spring.member.vo.MemberVO;
import kr.spring.product.controller.ProductController;
import kr.spring.product.service.ProductService;
import kr.spring.product.vo.ProductVO;
import kr.spring.util.PagingUtil;

@Controller
public class CartController {
	private static final Logger logger = LoggerFactory.getLogger(ProductController.class);

	@ModelAttribute
	public CartVO initCommand() {
		return new CartVO();
	}

	@Autowired
	private CartService cartService;
	
	@Autowired
	private ProductService productService;

	
	@RequestMapping("/cart/cart_insert.do")
	public String submit(@RequestParam int product_num, @RequestParam int product_price2,
			@RequestParam int product_quantity, @RequestParam int product_req_quantity,
			@RequestParam int order_quantity,
			HttpServletRequest request, HttpSession session, Model model) {
		
		MemberVO user = (MemberVO)session.getAttribute("user");
		CartVO cartVO = new CartVO();
		//상품 정보 담기
		ProductVO productVO = productService.selectProduct(product_num);
		
		//카트 정보 담기
		cartVO.setMem_num(user.getMem_num());
		cartVO.setProduct_num(product_num);
		cartVO.setQuantity(order_quantity); //주문 수량
		int total = order_quantity * product_price2; //이번 주문의 총 금액
		cartVO.setSub_total(total);
		cartVO.setProductVO(productVO);
		logger.debug("<<product_num>> : " + product_num);
		logger.debug("<<mem_num>> : " + user.getMem_num());
		
		//해당 고객이 이미 주문한 상품인지 확인
		CartVO cartProduct = cartService.selectCart(cartVO);
		if(cartProduct == null) { //주문한 적 없는 경우
			cartService.insertCart(cartVO);
			model.addAttribute("message", "상품을 장바구니에 추가했습니다.");
			model.addAttribute("url", request.getContextPath() + "/product/list.do");
		} else { //주문한 적 있는 경우
			if((cartProduct.getQuantity()+order_quantity) > product_quantity) {//이전주문 + 새 주문이 재고수보다 많은 경우 
				model.addAttribute("message", "상품의 재고가 부족합니다.");
				model.addAttribute("url", request.getContextPath() + "/product/detail.do?product_num=" +product_num);
			} else {
				//이전에 주문한 수량+새로 주문한 수량을 cartVO에 넣기
				cartVO.setQuantity(cartVO.getQuantity()+cartProduct.getQuantity());
				cartService.updateCart(cartVO);
				model.addAttribute("message", "상품을 장바구니에 추가했습니다.");
				model.addAttribute("url", request.getContextPath() + "/product/list.do");
			}
		}
		logger.debug("<<장바구니 추가 cartVO>> : " + cartVO);
		logger.debug("<<기존 장바구니 확인 cartProduct>> : " + cartProduct);
		logger.debug("<<장바구니 추가 product>> : " + productVO);

		return "common/resultView";
	}
	
	// 장바구니 삭제
	@RequestMapping("/cart/deleteCart.do")
	@ResponseBody
	public Map<String, String> delete(@RequestParam int cart_num, HttpSession session) {

		Map<String, String> mapAjax = new HashMap<String, String>();
		MemberVO user = (MemberVO) session.getAttribute("user");
		logger.debug("<<장바구니 삭제>> : " +cart_num);
		if (user == null) {
			mapAjax.put("result", "logout");
		} else {
			cartService.deleteCart(cart_num);
			mapAjax.put("result", "success");
		}
		return mapAjax;
	}
	
	// 상품 수량 변경 
	@RequestMapping("/cart/modifyCart.do")
	@ResponseBody
	public Map<String, String> submitModify(CartVO cartVO, HttpSession session) {
		Map<String, String> mapAjax = new HashMap<String, String>();
		MemberVO user = (MemberVO) session.getAttribute("user");
		logger.debug("<<장바구니 수정>> : " +cartVO);
		if (user == null) {
			mapAjax.put("result", "logout");
		} else {
			ProductVO product = productService.selectProduct(cartVO.getProduct_num());
			cartVO.setMem_num(user.getMem_num());
			if (product.getStatus() == 1) { // 상품 미표시 상태일 때
				mapAjax.put("result", "noSale");
			} else if (product.getQuantity() < cartVO.getQuantity()) {
				// 재고 부족
				mapAjax.put("result", "noQuantity");
			} else {
				// 상품 수량 변경 가능
				cartService.updateCart(cartVO);
				mapAjax.put("result", "success");
			}
		}

		return mapAjax;
	}
	
}























