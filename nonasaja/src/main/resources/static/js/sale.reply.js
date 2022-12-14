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
			url:'listReply.do',
			type:'post',
			data:{pageNum:pageNum,board_num:$('#board_num').val()},
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
					output += '<h4>';
					output += '<img src="../member/viewProfile.do?mem_num='+ item.mem_num +'" width="30" height="30" class="my-photo2">';
					output += '<h3 class="nicknamemargin">';
					if(item.nickname){
						output += item.nickname + '</h3>';
					}else{
						output += item.id + '</h3>';
					}
					
					output += '<div class="sub-item">';
					output += '<p>' + item.reply_content.replace(/\r\n/g,'<br>') + '</p>';
					output += '<input type="button" data-num="' + item.reply_num + '" value="답글" class="button12">';
					
					if(param.user_num==item.mem_num){
						//로그인한 회원번호와 댓글 작성자 회원번호가 일치
						output += ' <input type="button" data-num="'+ item.reply_num +'" value="수정" class="button10">';
						output += ' <input type="button" data-num="'+ item.reply_num +'" value="삭제" class="button11">';
					}
					
					if(item.reply_date){
						output += '<span class="modify-date">등록일 : ' + item.reply_date + '</span>';
					}
					

					output += '<hr size="1"  width="100%" noshade>';
					output += '</div>';
					output += '</div>'; 
					
					//문서 객체에 추가
					$('#output').append(output);
				});
				
				//paging button 처리
				if(currentPage>=Math.ceil(count/rowCount)){
					//다음 페이지가 없음
					$('.paging-button').hide();
				}else{
					//다음 페이지가 존재
					$('.paging-button').show();
				}
			},
			error:function(){
				//로딩 이미지 감추기
				 $('#loading').hide();
				 alert('네트워크 오류 발생로딩');
			}
		});
		
	}
	
	//다음 댓글 보기 버튼 클릭시 데이터 추가
	$('.paging-button input').click(function(){
		selectList(currentPage + 1);
	});
	
	//댓글 등록
	$('#re_form1').submit(function(event){
		if($('#reply_content').val().trim()==''){
			alert('내용을 입력하세요');
			$('#reply_content').val('').focus();
			return false;
		}
		
		let form_data = $(this).serialize();
		//데이터 전송
		$.ajax({
			url:'writeReply.do',
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
				alert('네트워크 오류 발생');
			}
		});
		//기본 이벤트 제거
		event.preventDefault();
	});
	//댓글 작성 폼 초기화
	function initForm(){
		$('textarea').val('');
		$('#re_first .letter-count').text('300/300');
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
			if($(this).attr('id')=='reply_content'){
				//등록 폼 글자수
				$('#re_first .letter-count').text(remain);
			}else{
				//수정 폼 글자수
				$('#mre_first .letter-count').text(remain);
			}
		}
	});
	//댓글 수정 버튼 클릭시 수정 폼 노출
	$(document).on('click','.button10',function(){
		//댓글 글번호
		let reply_num = $(this).attr('data-num');
		//댓글 내용
		let content = $(this).parent().find('p').html().replace(/<br>/g,'\r\n');
		
		//댓글 수정폼 UI
		let modifyUI = '<form id="mre_form">';
		modifyUI += '<input type="hidden" name="reply_num" id="mreply_num" value="'+ reply_num +'">';
		modifyUI += '<textarea rows="3" cols="50" name="reply_content" id="mreply_content" class="rep-content1">'+ content +'</textarea>';
		modifyUI += '<div id="mre_first"><span class="letter-count">300/300</span></div>';
		modifyUI += '<div id="mre_second" class="align-right">';
		modifyUI += '<input type="submit" value="수정" class="button10">';
		modifyUI += ' <input type="button" value="취소" class="re-reset">';
		modifyUI += '</div>';
		modifyUI += '<hr size="1" noshade width="96%">';
		modifyUI += '</form>';
		
		//이전에 이미 수정하는 댓글이 있을 경우 수정 버튼을
		//클릭하면 숨김 sub-item을 환원시키고 수정폼을 초기화
		//함
		initModifyForm();
		
		//지금 클릭해서 수정하고자 하는 데이터는 감추기
		$(this).parent().hide();
		
		//수정 폼을 수정하고자 하는 데이터가 있는 div에 노출
		$(this).parents('.item').append(modifyUI);
		
		//입력한 글자수 셋팅
		let inputLength = $('#mreply_content').val().length;
		let remain = 300 - inputLength;
		remain += '/300';
		
		//문서 객체에 반영
		$('#mre_first .letter-count').text(remain);
		
	});
	//수정 폼에서 취소 버튼 클릭시 수정 폼 초기화
	$(document).on('click','.reply-reset',function(){
		initModifyForm();
	});
	//수정 폼 초기화
	function initModifyForm(){
		$('.sub-item').show();
		$('#mre_form').remove();
	}
	//댓글 수정
	$(document).on('submit','#mre_form',function(event){
		if($('#mreply_content').val().trim()==''){
			alert('내용을 입력하세요!');
			$('#mreply_content').val('').focus();
			return false;
		}
		
		//폼에 입력한 데이터 반환
		let form_data = $(this).serialize();
		
		//수정
		$.ajax({
			url:'updateReply.do',
			type:'post',
			data:form_data,
			dataType:'json',
			cache:false,
			timeout:30000,
			success:function(param){
				if(param.result=='logout'){
					alert('로그인해야 수정할 수 있습니다.');
				}else if(param.result=='success'){
					$('#mre_form').parent()
					              .find('p')
                                  .html($('#mreply_content').val()
                                         .replace(/</g,'&lt;')
                                         .replace(/>/g,'&gt;')
                                         .replace(/\r\n/g,'<br>')
                                         .replace(/\r/g,'<br>')
                                         .replace(/\n/g,'<br>'));
                    //최근 수정일 처리
                    $('#mre_form').parent()
                                  .find('.modify-date')
                                  .text('최근 수정일 : 5초미만');
					//수정폼 초기화
					initModifyForm();
				}else if(param.result=='wrongAccess'){
					alert('타인의 글은 수정할 수 없습니다.');
				}else{
					alert('수정시 오류 발생');
				}
			},
			error:function(){
				alert('네트워크 오류 발생 수정 ');
			}
		});
		//기본 이벤트 제거
		event.preventDefault();
	});
	//댓글 삭제
	$(document).on('click','.button11',function(){
		//댓글 번호
		let reply_num = $(this).attr('data-num');
		
		$.ajax({
			url:'deleteReply.do',
			type:'post',
			data:{reply_num:reply_num},
			dataType:'json',
			cache:false,
			timeout:30000,
			success:function(param){
				if(param.result == 'logout'){
					alert('로그인해야 삭제할 수 있습니다.');
				}else if(param.result == 'success'){
					alert('삭제 완료!');
					selectList(1);
				}else if(param.result == 'wrongAccess'){
					alert('타인의 글을 삭제할 수 없습니다.');
				}else{
					alert('댓글 삭제시 오류 발생');
				}
			},
			error:function(){
				alert('네트워크 오류 발생');
			}
		});
		
	});

	//초기 데이터(목록) 호출
	selectList(1);
});




