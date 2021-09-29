<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>掲示文確認</title>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4"
	crossorigin="anonymous"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x"
	crossorigin="anonymous">

<style type="text/css">
.bold {
	text-align: center;
	background-color: #b3c6ff !important;
}

input:focus {
	outline: none;
}
</style>
<script src="/resources/js/reply.js"></script>
</head>
<body>
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<div align="center">
				<%-- <input type="hidden" name="" value="${pageNum}"> --%>
				<table class="table table-bordered" width="80%">
					<tr>
						<th class="bold" width="10%">作成者</th>
						<td><input style="border: none" name="name"
							value="${board.name }" readonly></td>
						<th class="bold" width="10%">番号</th>
						<td><input style="border: none" name="pNo"
							value="${board.PNo }" readonly></td>
						<%-- <th class="bold" width="10%">照会数</th>
						<td>${xxx.hit}<!-- 画面表示用サンプル -->23</td> --%>
					</tr>
					<tr>
						<th class="bold" width="10%">タイトル</th>
						<td><input style="border: none" name="title"
							value="${board.title }" readonly></td>
						<th class="bold" width="10%">作成日</th>
						<td><fmt:formatDate value="${board.regDate }"
								pattern="yyyy-MM-dd HH:mm:ss" /></td>
					</tr>
					<tr height="200" valign="top">
						<td colspan="4"><input style="border: none" name="content"
							value="${board.content }" readonly></td>
					</tr>
					<tr>
						<td colspan="4" align="left"><a
							href="javascript:history.back();"> <input
								class="btn btn-default" type="button" value="リスト"
								style="border-color: gray;"></a>
							<button data-oper="update" class="btn btn-default"
								style="border-color: gray;">修正</button></td>
					</tr>
				</table>
				<form role="form" action="/board/boardModify" id="operForm">
					<input type="hidden" id="pNo" name="pNo" value="${board.PNo }">
				</form>
			</div>

			<!-- 댓글 목록  -->
			<div class='row'>
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">
							<i class="fa fa-comments fa-fw"></i> Comment
							<button id="addCommentBtn"
								class="btn btn-primary btn-xs pull-right">新規コメント</button>
						</div>
						<div class="panel-body">
							<ul class="chat">
								<!-- start reply -->
								<li class="left clearfix" data-cNo="12">
									<div>
										<div class="header">
											<strong class="primary-font">user00</strong> <small
												class="pull-right text-muted"> 2020-11-01 14:14 </small>
										</div>
									</div>
									<p>Good job!</p>
								</li>
								<!-- END reply -->
							</ul>
						</div>
						<!-- END /.panel-body -->

						<!-- 댓글 목록 페이징  -->
						<div class="panel-footer"></div>
						<!-- END 댓글 목록 페이징  -->
					</div>
					<!-- END /.panel -->
				</div>
				<!-- END /.col-lg-6 -->
			</div>
			<!-- END 댓글 목록  -->

			<!-- 댓글 모달 창 -->
			<!-- Modal -->
			<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">&times;</button>
							<h4 class="modal-title" id="myModalLabel">コメント作成</h4>
						</div>
						<div class="modal-body">
							<div class="form-group">
								<label>コメント番号</label> <input class="form-control" name="cNo"
									readonly>
							</div>
							<div class="form-group">
								<label>作成者</label> <input class="form-control" name="cName">
							</div>
							<div class="form-group">
								<label>パスワード</label> <input class="form-control" name="cPass">
							</div>
							<div class="form-group">
								<label>コメント</label> <input class="form-control" name="cContent">
							</div>
							<div class="form-group">
								<label>作成日時</label> <input class="form-control" name="regDate">
							</div>
						</div>
						<!-- END modal-body -->

						<div class="modal-footer">
							<button type="button" class="btn btn-warning" id='modalModBtn'>修正</button>
							<button type="button" class="btn btn-danger" id='modalRemoveBtn'>削除</button>
							<button type="button" class="btn btn-primary"
								id='modalRegisterBtn'>登録</button>
							<button type="button" class="btn btn-default" id='modalCloseBtn'
								data-dismiss='modal'>閉じる</button>
						</div>
					</div>
					<!-- /.modal-content -->
				</div>
				<!-- /.modal-dialog -->
			</div>
			<!-- /.modal -->
			<!-- END 댓글 모달 창 -->
		</div>
	</div>

	<script>
$(function(){
	var formObj = $('form');

	$('button').on('click', function(e){
		e.preventDefault();	//기본 동작 막기

		var operation = $(this).data("oper");

		if(operation === 'list'){	//리스트 버튼인 경우s
			formObj.find("#pNo").remove();
			formObj.attr('action', "/board/list");
			formObj.submit();
		} else if(operation === 'update') {
			formObj.submit();	//수정 버튼인 경우는 그냥 전송
		} else {
			return;
		}
	});//END button 이벤트 처리
	var pNoValue = "${board.PNo}";
	var commentUl = $(".chat");

 	showList(1);

  	function showList(page){	//댓글 목록 출력 함수 - <li>출력
		commentService.getList(	//commentService의 getList 함수 호출
		 	{ pNo:pNoValue, page: page || 1 },
		 	function(list, ccnt){
		 		if(page == -1) { //page 번호가 -1이면
			 		pageNum = Math.ceil(ccnt/10.0); //마지막 페이지를 찾아서
			 		showList(pageNum);					//다시 목록 표시
			 		return;
		 		}

		 		//댓글 목록이 없는 경우
		 		if(list == null || list.length == 0){
 		 			commentUl.html("");
		 			return;
		 		}

		 		//댓글 목록이 있는 경우
		 		var str = "";
		 		for(var i=0 ; i<list.length ; i++){	//<li> 구성
		 			str += "<li class='left clearfix' data-cNo='" + list[i].cno +"'>" +
						   "	<div><div class='header'><strong class='primary-font'>" +
						  		         list[i].crno + " : " +list[i].cname + "</strong>" +
						   "      <small class='pull-right text-muted'>" +
						 		 	   /*  list[i].regDate */
						 		 	   commentService.displayTime(list[i].regDate) + "</small></div></div>" +
						   "      <p>" + list[i].ccontent + "</p></li>";
		 		}
	 			commentUl.html(str);	//<ul>에 <li> 추가

	 			showCommentPage(ccnt);	//페이지 번호 표시 함수 호출
		 	}
		);//END getList
 	}//END showList()

 	//댓글 목록 페이징 -----------------------------
   	var pageNum = 1;
 	var commentPageFooter = $('.panel-footer');

 	function showCommentPage(ccnt){

		var endNum 		= Math.ceil(pageNum/10.0) * 10;	//끝 페이지 계산
		var startNum 	= endNum - 9;					//시작 페이지 계산

		var prev = startNum != 1;		//이전 페이지
		var next = false; 				//다음 페이지

		//전체 데이터 수를 반영하여 실제 끝 페이지 계산
		if(endNum * 10 >= ccnt) {
			endNum = Math.ceil(ccnt/10.0);
		}
		//다음 페이지 활성화 처리
		if(endNum * 10 < ccnt) {
			next = true;
		}
		//페이지 번호 표시 ul 작성
		var str = "<ul class='pagination pull-right'>";

		//이전 페이지 링크 처리
		if(prev) {
			str += "<li class='page-item'>" +
				   "    <a class='page-link' href='" + (startNum - 1) + "'>"+
				   		"Previous</a></li>";
		}

		//페이지 번호 출력 및 링크 처리
		for(var i=startNum; i<=endNum ; i++){
			var active = pageNum == i ? 'active' : '' ;
			str += "<li class='page-item " + active + "'>" +
				   "    <a class='page-link' href='" + i + "'>" + i + "</a></li>";
		}

		//다음 페이지 링크 처리
		if(next) {
			str += "<li class='page-item'>" +
				   "    <a class='page-link' href='" + (endNum + 1) + "'>"+
				   		"Next</a></li>";
		}
		str += "</ul>";
		commentPageFooter.html(str);	//페이지 번호 출력
 	}//END showCommentPage */

 	//댓글 페이지 번호 클릭 시 새로운 댓글 가져오기
 	 	commentPageFooter.on('click', 'li a', function(e){
 		e.preventDefault();

 		var targetPageNum = $(this).attr('href');
 		pageNum = targetPageNum;
 		showList(pageNum);
	});//END 댓글 페이지 번호 클릭 시 새로운 댓글 가져오기


 	//모달 창 관련 부분-----------------------------
 	var modal = $('.modal');
 	var modalInputCNo 	= modal.find("input[name='cNo']");	//コメント番号
 	var modalInputCName 	= modal.find("input[name='cName']");	//작성자
 	var modalInputCPass 	= modal.find("input[name='cPass']");	//작성자
 	var modalInputCContent 	= modal.find("input[name='cContent']");	//댓글
 	var modalInputRegDate 	= modal.find("input[name='regDate']");//작성일자

 	var modalModBtn 	 = $('#modalModBtn'); 		//수정 버튼
 	var modalRemoveBtn 	 = $('#modalRemoveBtn'); 	//삭제 버튼
 	var modalRegisterBtn = $('#modalRegisterBtn'); 	//등록 버튼
 	var modalCloseBtn 	 = $('#modalCloseBtn');

 	//신규 댓글 버튼 이벤트 처리
 	$('#addCommentBtn').on('click', function(){
 		modal.find('input').val('');	//입력 양식 값 지우기
 		modalInputRegDate.closest('div').hide();			//작성일자 숨기기
 		modal.find('button[id != modalCloseBtn]').hide();	//닫기 버튼 이외 숨기기
 		modalRegisterBtn.show();							//등록 버튼 보이기
 		modal.modal('show');	//모달창 보이기
 	});//END 신규 댓글 버튼 이벤트 처리

 	//댓글 등록 버튼 이벤트 처리
 	modalRegisterBtn.on('click', function(){
 		var comment = {
 			pno 	 : pNoValue,
 			cname	 : modalInputCName.val(),
 			cpass 	 : modalInputCPass.val(),
 			ccontent : modalInputCContent.val()
 		}

 		//commentService의 add 함수 호출
		commentService.add(
				comment,
		 	    function(result){
		 		    alert(result);

		 	 		modal.find('input').val('');	//입력 양식 값 지우기
		 	 		modal.modal('hide');			//모달창 숨기기

		 	 		showList(pageNum);	//         "         - 마지막 페이지 표시
		 	    }
	 	);//END add()
 	});//END 댓글 등록 버튼 이벤트 처리

 	//댓글 클릭 이벤트 처리
 	$('.chat').on('click', 'li', function(){

 		var cNo = $(this).data('cno');	//댓글 번호 가져오기

 		//commentService의 get 함수 호출
 		commentService.get(cNo,  function(data){
 			modalInputCNo.val(data.cno);
		 	modalInputCContent.val(data.ccontent);		//댓글 표시
		 	modalInputCName.val(data.cname);	//작성자 표시
		 	modalInputRegDate						//작성일 표시 및 읽기 전용 처리
		 		.val(commentService.displayTime(data.regDate))
		 		.attr('readonly','readonly');

		 	modal.data('cno', data.cNo);			//댓글 번호 저장

		 	modalInputRegDate.closest('div').show();			//작성일자 보이기
	 		modal.find('button[id != modalCloseBtn]').hide();	//닫기 버튼 이외 숨기기
	 		modalModBtn.show();			//수정 버튼 보이기
	 		modalRemoveBtn.show();		//삭제 버튼 보이기

	 		modal.modal('show');	//모달창 보이기
	 	});//END get
 	});//END 댓글 클릭 이벤트 처리

 	//댓글 수정 버튼 이벤트 처리
 	modalModBtn.on('click', function(){
 		var comment = {
 			cno		 : modalInputCNo.val(),
 			cname	 : modalInputCName.val(),
 			cpass 	 : modalInputCPass.val(),
 			ccontent : modalInputCContent.val()
 		}

 		//commentService의 update 함수 호출
	 	commentService.update(
	 			comment,
		 	    function(result){
		 		    alert(result);
		 		   modal.find('input').val('');
		 		    modal.modal('hide');	//모달창 숨기기
		 		    showList(pageNum);
		 	    }
	 	);//END update()
 	});//END 댓글 수정 버튼 이벤트 처리

 	//댓글 삭제 버튼 이벤트 처리
 	modalRemoveBtn.on('click', function(){
 		var cNo	= modalInputCNo.val();
 		var cPass = modalInputCPass.val();

 		//commentService의 remove 함수 호출 - 댓글 작성자 추가
	 	 commentService.remove(cNo, cPass, function(count){
		 		console.log("replyService.remove count : " + count);
		 		if(count == 'success'){
		 			alert('remove ok');
		 			modal.find('input').val('');
		 		    modal.modal('hide');	//모달창 숨기기
// 		 	 		showList(1);			//수정 댓글 목록 가져오기
		 		    showList(pageNum);
		 		}
		 	}, function(er){
		 		alert('remove error');
		 	}
	 	 );//END remove
 	});//END 댓글 삭제 버튼 이벤트 처리

 	//모달창 닫기
 	modalCloseBtn.on('click',function(){
 		modal.modal('hide');
 	});

});
 </script>
</body>
</html>