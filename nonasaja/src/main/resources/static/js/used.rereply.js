$(function(){
	let currentPage;
	let count;
	let rowCount;
	
	
	//댓글 목록
	function selectList(pageNum){
		currentPage = pageNum;
		
		//로딩 이미지 노출
		$('#loading').show();
		
		$.ajax({
			url:'listRereply.do',
			type:'post',
			data:{pageNum:pageNum,club_num:$('#club_num').val()},
			dataType:'json',
			cache:false,
			timeout:30000,
			success:function(param){
				//로딩 이미지 감추기
				$('#loading').hide();
				count = param.count;
				rowCount = param.rowCount;
				
				if(pageNum == 1){
					//처음 호출시는 해당 ID의 div의 내부
					//내용물을 제거
					$('#output').empty();
				}
				
			
				//댓글 목록 작업
				$(param.list).each(function(index,item){
					let output = '<div class="item">';
					output += '<img src="../member/viewProfile.do?mem_num='+ item.mem_num + '" width="30" height="30" class="my-photo2">';
					output += '<h3 class="nicknamemargin">';
					if(item.nickname){
						output += item.nickname + '</h3>';
					}else{
						output += item.id + '</h3>';
					}
					
					output += '<div class="sub-item">';
					output += '<p>' + item.rereply_content.replace(/\r\n/g,'<br>') + '</p>';
	
					if(param.user_num==item.mem_num){
						//로그인한 회원번호와 댓글 작성자 회원번호가 일치
						
						output += ' <input type="button" data-num="'+ item.rereply_num +'" value="삭제" class="delete-btn">';
						output += ' <input type="button" data-num="'+ item.rereply_num +'" value="수정" class="modify-btn">';
						
					}output += ' <input type="button" data-num="'+ item.rereply_num +'" value="답글" class="rereply-btn">';
					if(item.reply_date){
						output += '<span class="modify-date">등록일 ' + item.reply_date + '</span>';
					}
					
					output += '<hr size="1"  width="100%" noshade>';
					output += '</div>';
					output += '</div>'; 
					
					//문서 객체에 추가
					$('#output').append(output);
				});
	
	//댓글 등록
	//=========================================대댓글 등록버튼==========================
	$(document).on('click','.rereply-btn',function(){
		//댓글 등록폼 UI
		let rereplyUI = '<form id="re_form2">';
		rereplyUI += '<input type="hidden" name="rereply_num" id="re_num" value="'+ re_num +'">';
		rereplyUI += '<textarea rows="3" cols="50" name="rereply_content" id="re_content2" class="rep-content2">'+ content +'</textarea>';
		rereplyUI += '<div id="mre_first2"><span class="letter-count">300/300</span></div>';
		rereplyUI += '<div id="re_second2" class="align-right">';
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
		
		//댓글 작성 폼 초기화
	function initForm(){
		$('textarea').val('');
		$('#re_first2 .letter-count').text('300/300');
	}
	//textarea에 내용 입력시 글자수 체크
	$(document).on('keyup','textarea',function(){
		//입력한 글자수 구하기
		let inputLength = $(this).val().length;
		
		if(inputLength>300){//300자를 넘어선 경우
			$(this).val($(this).val().substring(0,300));
		}else{//300자 이하인 경우
			//남은 글자수 구하기
			let remain = 300 - inputLength;
			remain += '/300';
			if($(this).attr('id')=='re_content2'){
				//등록 폼 글자수
				$('#re_first2 .letter-count').text(remain);
			}else{
				//수정 폼 글자수
				$('#mre_first2 .letter-count').text(remain);
			}
		}
	});
	
	});
		
		//초기 데이터(목록) 호출
		selectList(1);
})