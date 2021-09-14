<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>掲示文確認</title>
<link rel="stylesheet" type="text/css" href="bootstrap-4.0.0-dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
<style type="text/css">
	.bold {
		text-align: center;
		background-color: #b3c6ff !important;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

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
						<td>
						<input class="form-control" name="name" value="${board.name }" readonly>
					    </td>
						<th class="bold" width="10%">番号</th>
						<td><input class="form-control" name="pNo" value="${board.PNo }" readonly></td>
						<%-- <th class="bold" width="10%">照会数</th>
						<td>${xxx.hit}<!-- 画面表示用サンプル -->23</td> --%>
					</tr>
					<tr>
						<th class="bold" width="10%">タイトル</th>
						<td><input class="form-control" name="title" value="${board.title }" readonly></td>
						<th class="bold" width="10%">作成日</th>
						<td>${xxx.writeDate}<!-- 画面表示用サンプル -->2021/09/07</td>
					</tr>
					<tr height="200" valign="top">
						<td colspan="4"><input class="form-control" name="name" value="${board.name }" readonly></td>
					</tr>
					<tr>
						<td colspan="4" align="left">
							<a href="javascript:history.back();">
							<input type="button" value="リスト"></a>
							<input type="button" value="修正">
							<input type="button" value="削除">
						</td>
					</tr>
				</table>
				<%-- <jsp:include page="comment.jsp" flush="flase"></jsp:include> --%>
		</div>

	<form action="comment.jsp" method="post">
	 <table class="table table-bordered" width="80%">
	 <tr>
		<th class="bold" width="10%">コメント</th>
	    <td colspan="3">
			<input type="text" size="10" placeholder="作成者" required>
			<input type="text" size="10" placeholder="パスワード" required><br>
			<input type="text" size="80" placeholder="コメントを入力してください。">
			<input type="submit" value="登録">
		 </td>
	 </tr>
	</table>
	</form>
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
		} else if(operation === 'modify') {
			formObj.submit();	//수정 버튼인 경우는 그냥 전송
		} else {
			return;
		}
	});//END button 이벤트 처리
});
 </script>

</body>
</html>