<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- 내용 시작 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/cart.js"></script>
<script>
$(document).ready(function(){
   $(document).on('click','.rating',function(e){
      let elem = e.target;
        if(elem.classList.contains('rate-check')){
           $(this).find('.rate-check').each(function(index, item){
                if(index < elem.value){
                    item.checked = true;
                }else{
                    item.checked = false;
                }
            });
            $(this).find('.rate-star').val(elem.value);
        }
   });
});
</script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/mypage.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/mypageProduct.css">
<div class="mypage-wrap">
	<div class="mypage-left">
		<ul>
			<li><c:if test="${empty member.photo_name}">
					<img src="${pageContext.request.contextPath}/images/face.png"
						width="200" height="200" class="my-photo">
				</c:if> <c:if test="${!empty member.photo_name}">
					<img src="${pageContext.request.contextPath}/member/photoView.do"
						width="200" height="200" class="my-photo">
				</c:if></li>
			<li id="nick"><span>${member.nickname}</span></li>
			<li id="money">사자머니 &nbsp;&nbsp;&nbsp;<a href="paymentList.do">충전
					></a></li>
			<li><span><fmt:formatNumber value="${member.cash}" />원</span></li>
		</ul>
		<br>
		<ul>
			<li><a
				href="${pageContext.request.contextPath}/member/myPage.do">회원정보</a></li>
			<li><h3>
					<a href="myPageProduct.do">공동구매</a>
				</h3></li>
			<li><a href="myPageUsed.do">중고거래</a></li>
			<li><a href="myPageClub.do">동호회</a></li>
			<li><a href="myPageCommu.do">커뮤니티</a></li>
			<c:if test="${member.root == 0}">
				<li><a href="delete.do">회원탈퇴</a></li>
			</c:if>
		</ul>
	</div>
	<!----------------- ^ 페이지 좌측단 -------------->
	<!----------------- 페이지 우측단 v -------------->
	<div class="mypage-right">
		<table>
			<tr>
				<th colspan="5"><h3>공동구매</h3></th>
			</tr>
			<tr>
				<td>
				<c:if test="${type == 1}">
					<b><a href="myPageProduct.do?type=1">장바구니</a></b> |
					<a href="myPageProduct.do?type=2">참여중인 공동구매</a> |
					<a href="myPageProduct.do?type=3">구매 내역</a> |
					<a href="myPageProduct.do?type=4">내 리뷰</a>
				</c:if>
				<c:if test="${type == 2}">
					<a href="myPageProduct.do?type=1">장바구니</a> |
					<b><a href="myPageProduct.do?type=2">참여중인 공동구매</a></b> |
					<a href="myPageProduct.do?type=3">구매 내역</a> |
					<a href="myPageProduct.do?type=4">내 리뷰</a>
				</c:if>
				<c:if test="${type == 3}">
					<a href="myPageProduct.do?type=1">장바구니</a> |
					<a href="myPageProduct.do?type=2">참여중인 공동구매</a> |
					<b><a href="myPageProduct.do?type=3">구매 내역</a></b> |
					<a href="myPageProduct.do?type=4">내 리뷰</a>
				</c:if>
				<c:if test="${type == 4}">
					<a href="myPageProduct.do?type=1">장바구니</a> |
					<a href="myPageProduct.do?type=2">참여중인 공동구매</a> |
					<a href="myPageProduct.do?type=3">구매 내역</a> |
					<b><a href="myPageProduct.do?type=4">내 리뷰</a></b>
				</c:if>
				</td>
			</tr>
		</table>
		<!-- 목록 시작-->
		<!-- 장바구니 목록 -->
			<c:if test="${type==1}">
			<input type="hidden" value="${all_total}" id="all_total">
			<form action="/order/cart_order.do" id="cartOrder" method="post">
			<table>
				<c:if test="${all_total <= 0}">
				<tr>
					<td>
						<span id="no_list">내역이 없습니다.</span>
					</td>
				</tr>
				</c:if>
				<c:if test="${all_total > 0}">
				<tr>
					<td>선택</td>
					<td>사진</td>
					<td>제품명</td>
					<td colspan="2">수량</td>
					<td>금액</td>
				</tr>
				<c:forEach var="cart" items="${list}">
				<tr>
					<td>
						<input class="cart_check" type="checkbox" name="cart_num" value="${cart.cart_num}" data-price="${cart.sub_total}" checked="checked"
								<c:if test="${cart.productVO.status == 1 }">disabled</c:if>>
					</td>
					<td>
						<a href="${pageContext.request.contextPath}/product/detail.do?product_num=${cart.product_num }">
						<img src="${pageContext.request.contextPath}/product/imageView.do?product_num=${cart.product_num}&photo_type=1" width="100" height="100">
						</a>
					</td>
					<td>
						<c:if test="${cart.productVO.status == 1 }">
							<del>${cart.productVO.name}</del>
						</c:if> 
						<c:if test="${cart.productVO.status == 2 }">
							<a href="${pageContext.request.contextPath}/product/detail.do?product_num=${cart.product_num }">${cart.productVO.name}</a>
						</c:if>
					</td>
					<td>
						<input type="number" name="quantity" min="1" max="99999" value="${cart.quantity}">
						<input type="button" value="변경" class="button5 cart-modify" data-cartnum="${cart.cart_num}"
						data-productnum="${cart.product_num}">
					</td>
					<td>
						<fmt:formatNumber value="${cart.productVO.price2 }"/>원
					</td>
					<td>
						<input type="button" class="button4 cart-del" value="삭제" data-cartnum=${cart.cart_num }>
					</td>
				</tr>
				</c:forEach>
				<tr>
					<td colspan="6" class="align-right">
						<b>총구매금액</b><span id="new_price"><fmt:formatNumber value="${all_total}"/></span>원
						<input type="submit" value="주문하기" class="button8">
					</td>
				</tr>
			</c:if>
			</table>
		</form>
		</c:if>
		<!-- 장바구니 목록 끝-->
		<!-- 참여중인 공동구매 시작 -->
		<c:if test="${type==2}">
			<c:if test="${count <= 0}">
				<span id="no_list">내역이 없습니다.</span>
			</c:if>
			<c:if test="${count > 0}">
			<table>
				<c:forEach var="order" items="${orderList}">
				<c:forEach var="orderDetail" items="${orderDetailList}">
				<c:if test="${order.order_num == orderDetail.order_num}">
				<tr>
					<td rowspan="2">
					<a href="${pageContext.request.contextPath}/product/detail.do?product_num=${orderDetail.product_num }">
						<img src="${pageContext.request.contextPath}/product/imageView.do?product_num=${orderDetail.product_num}&photo_type=1" 
							width="150" height="150">
						</a>
					</td>
					<td colspan="2">
					<a href="${pageContext.request.contextPath}/product/detail.do?product_num=${orderDetail.product_num }">
						<b>${orderDetail.product_name}</b>
					</a>
					</td>
					<td>
						<span>${orderDetail.order_quantity}개</span>
					</td>
					<td>
						<span><fmt:formatNumber value="${orderDetail.product_total}"/>원</span>
					</td>
				</tr>
				<tr></tr>
				<tr>
					<td colspan="2" class="align-right">
						<c:if test="${orderDetail.wait_count != 0}">
							<b>주문확정수량</b> <b>${orderDetail.req_quantity}</b>개 중 <b>${orderDetail.wait_count}</b>개 신청
						</c:if>
					</td>
					<td>
						<c:if test="${orderDetail.wait_count == 0}">
							판매중지된 상품입니다
						</c:if>
					</td>
					<td>
						<input type="button" value="주문정보 수정" class="button50" onclick="location.href='/order/order_update.do?order_num=${orderDetail.order_num}'">
					</td>
					<td>
						<input type="button" value="구매취소" class="button40" onclick="location.href='/order/wait_delete.do?detail_num=${orderDetail.detail_num}'">
					</td>
				</tr>
				</c:if>
				</c:forEach>
				</c:forEach>
			</table>
			</c:if>
			</c:if>
		<!-- 참여중인 공동구매 끝 -->
		<!-- 구매 내역 -->
		<c:if test="${type==3}">
			<c:if test="${count <= 0}">
				<span id="no_list">내역이 없습니다.</span>
			</c:if>
			<c:if test="${count > 0}">
			<table>
				<c:forEach var="order" items="${orderList}">
				<c:forEach var="orderDetail" items="${orderDetailList}">
				<c:if test="${order.order_num == orderDetail.order_num}">
				<tr>
					<c:if test="${orderDetail.wait_status == 2}"><!--  -->
					<td class="align-left" colspan="3">
						<h3>주문번호 : ${order.order_num }</h3>
					</td>
					<td>
						<c:if test="${order.status == 1}"><font color="blue"><strong>배송대기</strong></font></c:if>
						<c:if test="${order.status == 2}"><font color="blue"><strong>배송준비</strong></font></c:if>
						<c:if test="${order.status == 3}"><font color="green"><strong>배송중</strong></font></c:if>
						<c:if test="${order.status == 4}"><font color="green"><strong>배송완료</strong></font></c:if>
						<c:if test="${order.status == 5}"><font color="red"><strong>주문취소</strong></font></c:if>
					</td>
					<td class="align-right">
						<h4>${order.reg_date}</h4>
					</td>
					</c:if>
				</tr>
				<tr>
					<td>
						<a href="${pageContext.request.contextPath}/product/detail.do?product_num=${orderDetail.product_num }">
							<img src="${pageContext.request.contextPath}/product/imageView.do?product_num=${orderDetail.product_num}&photo_type=1"
								width="200" height="200">
						</a>
					</td>
					<td>
						<a href="${pageContext.request.contextPath}/product/detail.do?product_num=${orderDetail.product_num }">
							<b>${orderDetail.product_name}</b>
						</a>
					</td>
					<td>
						${orderDetail.order_quantity}개
					</td>
					<td>
						<fmt:formatNumber value="${orderDetail.product_total}"/>원
					</td>
					<td>
						<input type="button" class="button41" value="리뷰작성" 
								onclick="location.href='${pageContext.request.contextPath}/review/write_review.do?product_num=${orderDetail.product_num}'">
					</td>
				</tr>
				</c:if>
				</c:forEach>
				</c:forEach>
			</table>
			</c:if>
		</c:if>
		<!-- 구매 내역 끝 -->
		<!-- 내 리뷰 시작 -->
		<c:if test="${type==4}">
			<c:if test="${empty reviewList}">
				<span id="no_list">내역이 없습니다.</span>
			</c:if>
			<c:if test="${!empty reviewList}">
			<table>
				<c:forEach var="review" items="${reviewList}">
				<tr>
					<td class="align-center">
					<a href="${pageContext.request.contextPath}/product/detail.do?product_num=${review.product_num }">
						<img src="${pageContext.request.contextPath}/product/imageView.do?product_num=${review.product_num}&photo_type=1"
							width="120" height="130"><br>
						 <b>${review.product_name}</b>
					</a>
					</td>
					<td colspan="2" class="margintext">
						${review.content }
					</td>
				</tr>
				<tr>
					<td>
						<div class="rating">
							<input type="hidden" name="score" value="0" class="rate-star">
							<c:forEach var="star" begin="1" end="5" varStatus="status">
								<input type="checkbox" id="rating${status.index}"
									value="${status.index}" class="rate-check"
									<c:if test="${status.index<=review.score}">checked</c:if> disabled>
								<label for="rating${status.index}"></label>
							</c:forEach>
						</div>
					</td>
					<td class="align-right">
						${review.reg_date}
					
						<input type="button" class="button5" value="수정" 
							onclick="location.href='${pageContext.request.contextPath}/review/write_review.do?product_num=${review.product_num}'">
							<input type="button" class="button4" value="삭제" 
							onclick="location.href='${pageContext.request.contextPath}/review/delete_review.do?review_num=${review.review_num}'">
					</td>
				</tr>
				</c:forEach>
			</table>
			</c:if>
			</c:if>
		<!-- 내 리뷰 끝 -->
	</div>
</div>
<!-- 내용 끝 -->


























