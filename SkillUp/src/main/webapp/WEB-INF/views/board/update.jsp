<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>作成フォーム</title>
<link rel="stylesheet" type="text/css" href="bootstrap-3.2.2-dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
<script src = "ckeditor/ckeditor.js"></script>
</head>
<body>

<div class="row">
 <div class="col-md-2"></div>
 <div class="col-md-8">
 <form role="form" action="/board/update" method="post">
    <table class="table table-bordered">
    <tr>
     <td>番号</td>
     <td><input style="border:none" name="pNo"
     value="${board.PNo }" readonly></td>
    </tr>
     <tr>
     <td>パスワード</td>
     <td><input class="form-control" name="pass">
    </tr>
    <tr>
     <td>タイトル</td>
     <td><input class="form-control" name="title"
					   			   	   value="${board.title }">
    </tr>
    <tr>
     <td>作成者</td>
     <td><input class="form-control" name="name"
					          		value="${board.name }"></td>
    </tr>
    <tr>
     <td>本文</td>
     <td><textarea rows="10" cols="50" name="content"
      class="form-control">${board.content }</textarea></td>
    </tr>
     <tr>

     <td colspan="2"  class="text-center">
      <button class="btn btn-default" type="submit" style=" border-color: gray;"
      data-oper="update">登録</button>
      <button class="btn btn-default" type="submit"  style=" border-color: gray;"
       data-oper="remove">削除</button>
     </td>
    </tr>

    </table>
  </form>
 </div>
</div>

<script>
CKEDITOR.replace('content', {

 width:'100%',
 height:'350'

});

</script>

<script>
$(function(){

	var formObj = $('form');

	$('button').on('click', function(e){
		e.preventDefault();	//기본 동작 막기

		var operation = $(this).data("oper");

		if(operation === 'remove') { 		//삭제 버튼인 경우
			formObj.attr('action', '/board/remove');
		} else if(operation === 'list'){	//리스트 버튼인 경우

			formObj.attr('action', "/board/list")
				   .attr('method', 'read');
			formObj.empty();

		} else if(operation === 'update'){
			formObj.attr('action', '/board/update');
		}
		formObj.submit();	//전송
	});//END button 이벤트 처리

});
</script>

</body>
</html>