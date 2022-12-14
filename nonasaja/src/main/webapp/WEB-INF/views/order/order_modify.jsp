<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- 내용 시작 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/order.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/order.css">
<div id="product_register">
	<p id="title_txt"><b>주문서 수정하기</b></p>
	<form action=order_update.do method="post" id="order_form">
	<input type="hidden" name="order_num" value="${order.order_num}">
		<c:forEach var="orderDetail" items="${detailList}">
			<div class="cart_box">
			<img src="${pageContext.request.contextPath}/product/imageView.do?product_num=${orderDetail.product_num}&photo_type=1" width="130" height="130" class="li_left">
				
			<p id="title" class="productbuyinfo">${orderDetail.product_name}</p>
			<p id="sub_total" class="productbuyinfo"><fmt:formatNumber value="${orderDetail.product_total}"/>원</p>
			<p id="quantity" class="productbuyinfo">${orderDetail.order_quantity}개</p>
			
			</div>
			
			<hr class="header-hr">
			
		</c:forEach>
		
	<div class="orderformalign">
		<div class="clearHERE"></div>
		<span id="total_txt"><b>총구매금액 </b>&emsp;</span>
		<span id="total_txt1"><b><fmt:formatNumber value="${order.order_total}"/>원</b></span>
		<input type="hidden" value="${all_total}" name="all_total">
			
		<hr class="header-hr">	

		<ul class="ul-align-padding">
			<li class="text-size-li">
				<label for="receive_name">수령인</label>
				<input type="text" name="receive_name" id="receive_name" class="box-align1" maxlength="10" value="${order.receive_name}">
			</li>
			<li class="text-size-li">
				<label for="zipcode">우편번호</label>
				<input type="text" name="receive_post" id="zipcode" class="box-align" maxlength="5" value="${order.receive_post}">
				<input type="button" onclick="execDaumPostcode()" value="우편번호찾기" class="button3">
			</li>
			<li class="text-size-li">
				<label for="receive_address1">주소</label>
				<input type="text" name="receive_address1" id="address1" class="box-align2" maxlength="30" value="${order.receive_address1}">
			</li>
			<li class="text-size-li">
				<label for="receive_address2">상세주소</label>
				<input type="text" name="receive_address2" id="address2" class="box-align" maxlength="30" value="${order.receive_address2}">
			</li>
			<li class="text-size-li">
				<label for="receive_phone">전화번호</label>
				<input type="text" name="receive_phone" id="receive_phone" class="box-align" maxlength="15" value="${order.receive_phone}">
			</li>
			<li class="text-size-li">
				<label for="notice">남기실 말씀</label>
				<input type="text" name="notice" id="notice" class="box-align3" maxlength="300" value="${order.notice}">
			</li>
		</ul>
		<div class="align-right">
			<input type="button" value="메인으로" onclick="location.href='${pageContext.request.contextPath}/main/main.do'" class="button6">
			<input type="submit" value="수정" class="button7">
		</div>
	</div>
	</form>
</div>
<!-- 우편번호 검색 시작 -->
<div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
<img src="//t1.daumcdn.net/localimg/localimages/07/postcode/320/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
</div>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    // 우편번호 찾기 화면을 넣을 element
    var element_layer = document.getElementById('layer');

    function closeDaumPostcode() {
        // iframe을 넣은 element를 안보이게 한다.
        element_layer.style.display = 'none';
    }

    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = data.address; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 기본 주소가 도로명 타입일때 조합한다.
                if(data.addressType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('zipcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('address1').value = fullAddr;
                //document.getElementById('sample2_addressEnglish').value = data.addressEnglish;

                // iframe을 넣은 element를 안보이게 한다.
                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
                element_layer.style.display = 'none';
            },
            width : '100%',
            height : '100%',
            maxSuggestItems : 5
        }).embed(element_layer);

        // iframe을 넣은 element를 보이게 한다.
        element_layer.style.display = 'block';

        // iframe을 넣은 element의 위치를 화면의 가운데로 이동시킨다.
        initLayerPosition();
    }

    // 브라우저의 크기 변경에 따라 레이어를 가운데로 이동시키고자 하실때에는
    // resize이벤트나, orientationchange이벤트를 이용하여 값이 변경될때마다 아래 함수를 실행 시켜 주시거나,
    // 직접 element_layer의 top,left값을 수정해 주시면 됩니다.
    function initLayerPosition(){
        var width = 300; //우편번호서비스가 들어갈 element의 width
        var height = 400; //우편번호서비스가 들어갈 element의 height
        var borderWidth = 5; //샘플에서 사용하는 border의 두께

        // 위에서 선언한 값들을 실제 element에 넣는다.
        element_layer.style.width = width + 'px';
        element_layer.style.height = height + 'px';
        element_layer.style.border = borderWidth + 'px solid';
        // 실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.
        element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width)/2 - borderWidth) + 'px';
        element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height)/2 - borderWidth) + 'px';
    }
</script>
<!-- 우편번호 검색 끝 -->
<!-- 내용 끝 -->



















