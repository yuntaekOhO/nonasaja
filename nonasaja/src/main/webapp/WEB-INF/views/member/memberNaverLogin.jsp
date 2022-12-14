<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!-- 내용 시작 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/otherLogin.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/requiredCheckbox.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/register.css">
<div class="register-wrap">
<div class="register-main">
	<h2>회원가입</h2>
	<form:form id="register_form" action="registerNaverUser.do" modelAttribute="memberVO">
		<ul>
			<li>
				<form:hidden path="id" value="${naverid}"/>
			</li>
			<li>
				<label for="nickname">별명</label>
				<form:input path="nickname" value="${navernick}"/>
				<span id="nick_message"></span>
			</li>
			<li>
				<label for="name">이름</label>
				<form:input path="name" value="${navername}"/>
				<span id="name_message"></span>
			</li>
			<li>
				<label for="phone">전화번호</label>
				<form:input path="phone" value="${naverphone}"/>
				<span id="phone_message"></span>
			</li>
			<li>
				<label for="email">이메일</label>
				<form:input path="email" value="${naveremail}"/>
				<span id="email_message"></span>
			</li>
			<li>
				<label for="zipcode">우편번호</label>
				<form:input path="zipcode"/>
				<input type="button" onclick="execDaumPostcode()" value="우편번호 찾기">
				<span id="zipcode_message"></span>
			</li>
			<li>
				<label for="addr1">주소</label>
				<form:input path="addr1"/>
				<span id="addr1_message"></span>
			</li>
			<li>
				<label for="addr2">상세 주소</label>
				<form:input path="addr2"/>
				<span id="addr2_message"></span>
			</li>
			<li>
				<label for="interest">관심사</label>
				<form:checkbox path="interest" value="운동"/>운동
				<form:checkbox path="interest" value="오락"/>오락
				<form:checkbox path="interest" value="맛집"/>맛집
				<form:checkbox path="interest" value="노래"/>노래
				<form:checkbox path="interest" value="여행"/>여행
				<form:checkbox path="interest" value="스터디"/>스터디
			</li>
			<li class="contract-li">
				<div class="contract-div">
					<input type="checkbox" id="required1"> <span>약관에 동의함 (필수)</span>
					<div class="border">
						제 1장 총칙<br><br>제1 조(목적)<br>
						본 약관은 국가공간정보 포털 웹사이트(이하 "국가공간정보포털")가 제공하는 모든 서비스(이하 "서비스")의
						이용조건 및 절차, 회원과 국가공간정보포털의 권리, 의무, 책임사항과 기타 필요한 사항을 규정함을 목적으로 합니다.
						본 약관은 국가공간정보 포털 웹사이트(이하 "국가공간정보포털")가 제공하는 모든 서비스(이하 "서비스")의
						이용조건 및 절차, 회원과 국가공간정보포털의 권리, 의무, 책임사항과 기타 필요한 사항을 규정함을 목적으로 합니다.
						본 약관은 국가공간정보 포털 웹사이트(이하 "국가공간정보포털")가 제공하는 모든 서비스(이하 "서비스")의
						이용조건 및 절차, 회원과 국가공간정보포털의 권리, 의무, 책임사항과 기타 필요한 사항을 규정함을 목적으로 합니다.
						본 약관은 국가공간정보 포털 웹사이트(이하 "국가공간정보포털")가 제공하는 모든 서비스(이하 "서비스")의
						이용조건 및 절차, 회원과 국가공간정보포털의 권리, 의무, 책임사항과 기타 필요한 사항을 규정함을 목적으로 합니다.
						본 약관은 국가공간정보 포털 웹사이트(이하 "국가공간정보포털")가 제공하는 모든 서비스(이하 "서비스")의
						이용조건 및 절차, 회원과 국가공간정보포털의 권리, 의무, 책임사항과 기타 필요한 사항을 규정함을 목적으로 합니다.
						본 약관은 국가공간정보 포털 웹사이트(이하 "국가공간정보포털")가 제공하는 모든 서비스(이하 "서비스")의
						이용조건 및 절차, 회원과 국가공간정보포털의 권리, 의무, 책임사항과 기타 필요한 사항을 규정함을 목적으로 합니다.
						본 약관은 국가공간정보 포털 웹사이트(이하 "국가공간정보포털")가 제공하는 모든 서비스(이하 "서비스")의
						이용조건 및 절차, 회원과 국가공간정보포털의 권리, 의무, 책임사항과 기타 필요한 사항을 규정함을 목적으로 합니다.
						본 약관은 국가공간정보 포털 웹사이트(이하 "국가공간정보포털")가 제공하는 모든 서비스(이하 "서비스")의
						이용조건 및 절차, 회원과 국가공간정보포털의 권리, 의무, 책임사항과 기타 필요한 사항을 규정함을 목적으로 합니다.
						본 약관은 국가공간정보 포털 웹사이트(이하 "국가공간정보포털")가 제공하는 모든 서비스(이하 "서비스")의
						이용조건 및 절차, 회원과 국가공간정보포털의 권리, 의무, 책임사항과 기타 필요한 사항을 규정함을 목적으로 합니다.
					</div>
					<input type="checkbox" id="required2"> <span>개인정보 수집 및 이용에 대한 안내 (필수)</span>
					<div class="border">
						가. 개인정보의 수집 및 이용 목적<br>
						[1] 국가공간정보포털은 다음의 목적을 위하여 개인정보를 처리합니다. 처리하고 있는 개인정보는 다음의 목적 이외의 용도로는 이용되지 않으며,
						이용 목적이 변경되는 경우에는 개인정보 보호업 제18조에 따라 별도의 동의를 받는 등 필요한 조치를 이행할 예정입니다.
						
						I. 국가공간정보포털 서비스 제공을 위한 회원관리
						1) 공간정보 다운로드, 오픈 API 신청 및 활용 등 포털 서비스 제공과 서비스 부저이용 방지를 목적으로 개인정보를 처리합니다.
						가. 개인정보의 수집 및 이용 목적<br>
						[1] 국가공간정보포털은 다음의 목적을 위하여 개인정보를 처리합니다. 처리하고 있는 개인정보는 다음의 목적 이외의 용도로는 이용되지 않으며,
						이용 목적이 변경되는 경우에는 개인정보 보호업 제18조에 따라 별도의 동의를 받는 등 필요한 조치를 이행할 예정입니다.
						
						I. 국가공간정보포털 서비스 제공을 위한 회원관리
						1) 공간정보 다운로드, 오픈 API 신청 및 활용 등 포털 서비스 제공과 서비스 부저이용 방지를 목적으로 개인정보를 처리합니다.
						가. 개인정보의 수집 및 이용 목적<br>
						[1] 국가공간정보포털은 다음의 목적을 위하여 개인정보를 처리합니다. 처리하고 있는 개인정보는 다음의 목적 이외의 용도로는 이용되지 않으며,
						이용 목적이 변경되는 경우에는 개인정보 보호업 제18조에 따라 별도의 동의를 받는 등 필요한 조치를 이행할 예정입니다.
						
						I. 국가공간정보포털 서비스 제공을 위한 회원관리
						1) 공간정보 다운로드, 오픈 API 신청 및 활용 등 포털 서비스 제공과 서비스 부저이용 방지를 목적으로 개인정보를 처리합니다.
						가. 개인정보의 수집 및 이용 목적<br>
						[1] 국가공간정보포털은 다음의 목적을 위하여 개인정보를 처리합니다. 처리하고 있는 개인정보는 다음의 목적 이외의 용도로는 이용되지 않으며,
						이용 목적이 변경되는 경우에는 개인정보 보호업 제18조에 따라 별도의 동의를 받는 등 필요한 조치를 이행할 예정입니다.
						
						I. 국가공간정보포털 서비스 제공을 위한 회원관리
						1) 공간정보 다운로드, 오픈 API 신청 및 활용 등 포털 서비스 제공과 서비스 부저이용 방지를 목적으로 개인정보를 처리합니다.
						
					</div>
				</div>
			</li>
		</ul>
		<div class="align-center">
			<form:button>전송</form:button>
			<input type="button" value="홈으로" onclick="location.href='${pageContext.request.contextPath}/main/main.do'">
		</div>
	</form:form>
</div>
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
                document.getElementById('addr1').value = fullAddr;
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