$(function(){
	let currentPage;
	let count;
	let rowCount;
	
	//댓글 등록
	//=========================================대댓글 등록버튼==========================
	$(document).on('click','.rereply-btn',function(){
		//댓글 수정폼 UI
		let rereplyUI = '<form id="re_form2">';
		rereplyUI += '<input type="hidden" name="rereply_num" id="mre_num" value="'+ re_num +'">';
		rereplyUI += '<textarea rows="3" cols="50" name="rereply_content" id="mre_content2" class="rep-content2">'+ content +'</textarea>';
		rereplyUI += '<div id="mre_first2"><span class="letter-count">300/300</span></div>';
		rereplyUI += '<div id="mre_second2" class="align-right">';
		rereplyUI += ' <input type="button" value="취소" class="re-reset">';	
		rereplyUI += '<input type="submit" value="수정" class="modify-btn">';
		rereplyUI += '</div>';
		rereplyUI += '<hr size="1" noshade width="96%">';
		rereplyUI += '</form>';
		//댓글 등록
		$('#re_form2').submit(function(event){
			if($('#re_content2').val().trim()==''){
				alert('내용을 입력하세요');
				$('#re_content2').val('').focus();
				return false;
			}
			
			let form_data = $(this).serialize();
			//데이터 전송
			$.ajax({
				url:'writeRereply.do',
				type:'post',
				data:form_data,
				dataType:'json',
				cache:false,
				timeout:30000,
				success:function(param){
					if(param.result=='logout'){
						alert('로그인해야 작성할 수 있습니다.');
					}else if(param.result=='success'){
						//폼 초기화
						initForm();
						//댓글 작성이 성공하면 새로 삽입한 글을
						//포함해서 첫번째 페이지의 게시글을 다시 
						//호출
						selectList(1);
					}
				},
				error:function(){
					alert('네트워크 오류 발생22');
				}
			});
			//기본 이벤트 제거
			event.preventDefault();
		});
		
		//초기 데이터(목록) 호출
		selectList(1);
})