<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
.uploadResult {width: 100%; background-color: gray;}
.uploadResult ul{display:flex; flex-flow: row; justify-content: center;
				align-items: center;}
.uploadResult ul li{list-style: none; padding: 10px;}
.uploadResult ul li img{width: 100px;}
.uploadResult ul li span{color:white;}
.bigPictureWrapper{position: absolute;display: none;justify-content: center;
					align-content: center; top: 0%;width: 100%; height: 100%;background-color: gray;
					z-index: 100;background:rgba(255,255,255,0.5);}
.bigPicture{position: relative;display: flex;justify-content: center; align-items: center;}
.bicPicture img{width: 600px;}
</style>

<script src="/resources/js/reply.js"></script>

  <div class="row">
      <div class="col-lg-12">
          <h1 class="page-header">Board Read Page</h1>
      </div>
      <!-- /.col-lg-12 -->
  </div>
  <!-- /.row -->
  <div class="row">
      <div class="col-lg-12">
          <div class="panel panel-default">
              <div class="panel-heading">
<!--                    DataTables Advanced Tables -->
					Board Read Page
              </div>
              <!-- /.panel-heading -->
              <div class="panel-body">
				<div class="form-group">
					<label>Post no.</label>
					<input class="form-control" name="pNo"
					       value="${board.PNo }" readonly>
				</div>
				<div class="form-group">
					<label>Title</label>
					<input class="form-control" name="title"
					       value="${board.title }" readonly>
				</div>
				<div class="form-group">
					<label>Content</label>
					<textarea class="form-control" name="content"
							  rows="3" readonly>${board.content }</textarea>
				</div>
				<div class="form-group">
					<label>name</label>
					<input class="form-control" name="name"
					          value="${board.name }" readonly>
				</div>


						<button data-oper="modify" class="btn btn-default">
							Modify </button>

				<button data-oper="list" class="btn btn-info">
					List </button>

				<!-- 폼 태그 추가 -->
				<form role="form" action="/board/modify" id="operForm">
					<input type="hidden" id="pNo" name="pNo" value="${board.PNo }">
				</form>
              </div>
              <!-- /.panel-body -->
          </div>
          <!-- /.panel -->
      </div>
      <!-- /.col-lg-6 -->
  </div>
  <!-- /.row -->



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
<%@ include file="../includes/footer.jsp" %>