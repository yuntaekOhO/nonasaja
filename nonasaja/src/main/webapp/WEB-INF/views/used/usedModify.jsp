<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 내용 시작 -->
<!-- include libraries(jquery,bootstrap) -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/used.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/used.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style>
.ck-editor__editable_inline{
	min-height:250px;
}
</style>
<!-- include ckeditor js -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/ckeditor.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/uploadAdapter.js"></script>

<div id="page-main">
	<h3>중고거래 상품 수정</h3><br>
	<form:form action="update.do" modelAttribute="usedVO" id="update_form" enctype="multipart/form-data">
		<form:hidden path="used_num"/>
		<form:errors element="div" cssClass="error-color"/>
		
		<div>
			<div class="float_image">
				<c:if test="${!empty usedVO.filename}">	
				<img class="product-img" src="${context.request.contextPath}/used/imageView.do?used_num=${usedVO.used_num}&board_type=2" style="max-width:400px;">
				</c:if>
				<c:if test="${empty usedVO.filename}">	
					<img src="${pageContext.request.contextPath}/images/empty.jpg" class="product-img" id="img2" name="img2" width="350" height="300">
				</c:if>
				<input type="file" name="upload" id="upload" accept="image/gif,image/png,image/jpeg" class="location1">
			</div>
			<div class="float_text"> <br>
				<ul class="radio-button">
					<li>
						<label for="kind" class="input-box2">거래종류</label>
						<form:radiobutton path="kind" value="0"/>&nbsp;&nbsp;중고&nbsp;&nbsp;
						<form:radiobutton path="kind" value="1"/>&nbsp;&nbsp;무료나눔&nbsp;&nbsp;
						<form:radiobutton path="kind" value="2"/>&nbsp;&nbsp;교환&nbsp;&nbsp;
						<form:errors path="kind" cssClass="error-color"/>
					</li>
					<li>
						<label for="status" class="input-box2">거래상태</label>
						<form:radiobutton path="status" value="0"/>&nbsp;&nbsp;판매중&nbsp;&nbsp;
						<form:radiobutton path="status" value="1"/>&nbsp;&nbsp;판매완료&nbsp;&nbsp;
						<form:errors path="status" cssClass="error-color"/>
					</li>
				</ul><br>
				<ul class="ul-text">
					<li>
						<label for="title">제목</label>
						<form:input path="title" placeholder="제목을 입력하세요." class="input-box"/>
						<form:errors path="title" cssClass="error-color"/>
					</li>
					
					
					<li>
						<label for="category">상품종류</label>
						<form:input path="category" placeholder="주방,생활,식품 등" class="input-box1"/>
						<form:errors path="category" cssClass="error-color"/>
					</li>
					<li>
						<label for="price">가격</label>
						<input type="text" name="price" value="${usedVO.price}" placeholder="무료나눔은0, 물물교환은 1이라고 입력해주세요." class="input-box"/>
						<form:errors path="price" cssClass="error-color"/>
					</li>
					
					<li>
						<label for="trade">교환물품</label>
						<form:input path="trade" placeholder="교환일 경우에만 입력하세요." class="input-box1"/>
						<form:errors path="trade" cssClass="error-color"/>
					</li>
					<li>
						<label for="region">판매지역</label>
							<form:input path="region" class="input-box1"/>
							<form:errors path="region" cssClass="error-color"/>
					</li>
				</ul>
			</div>
		</div><br><br>
		<div class="location2">
			<form:textarea path="content" placeholder="거래 물품에 대한 내용을 자세하게 작성하세요." class="location2"/>
			<form:errors path="content" cssClass="error-color"/>
			<script>
			 function MyCustomUploadAdapterPlugin(editor) {
				    editor.plugins.get('FileRepository').createUploadAdapter = (loader) => {
				        return new UploadAdapter(loader);
				    }
				}
			 
			 ClassicEditor
	            .create( document.querySelector( '#content' ),{
	            	extraPlugins: [MyCustomUploadAdapterPlugin]
	            })
	            .then( editor => {
					window.editor = editor;
				} )
	            .catch( error => {
	                console.error( error );
	            } );
			</script>
		</div>
		
		<div class="align-right">
			<form:button class="button2">수정</form:button>
			<input type="button" value="목록" onclick="location.href='list.do'" class="button1">
		</div>
	</form:form>
</div>
<!-- 내용 끝 -->