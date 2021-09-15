<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="/resources/css/sellListStyle.css" rel="stylesheet"
	type="text/css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4"
	crossorigin="anonymous"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x"
	crossorigin="anonymous">
<title>販売リスト</title>
</head>
<body>
	<div id="list"></div>
	<div id="write">
		<a href="boardWrite">
			<button class="btn btn-default" type="button"
				style="border-color: gray;">作成</button>
		</a>
	</div>
	<div>
		<table class="table table-borderd table-hover">
			<thead>
				<tr>
					<th width="10%">番号</th>
					<th width="40%">タイトル</th>
					<th width="20%">作成者</th>
					<th width="20%">作成日</th>
					<th width="10%">照会数</th>
				</tr>
			</thead>
			<tbody>
				<!-- 画面表示用サンプル -->
				<tr>
					<td>1</td>
					<td><a href="">sample(comment})</a></td>
					<td>kim</td>
					<td>2021/09/03</td>
				</tr>
				<tr>
					<td>2</td>
					<td><a href="#">sample2(comment})</a></td>
					<td>kim</td>
					<td>2021/09/03</td>
				</tr>
				<c:if test="${sellPage.hasNoArticle() }">
					<td colspan="5">掲示文がありません。</td>
				</c:if>
				<c:forEach var="board" items="${list }">
					<c:if test="${board.BNo eq 1}">
					<tr>
						<td>${board.PNo}</td>
						<td><a href="${board.PNo}" class="move"> ${board.title }
								<c:if test="${ board.CCnt > 0 }">
									<b>[${board.CCnt }]</b>
								</c:if>
						</a></td>
						<td>${board.name }</td>
						<td><fmt:formatDate value="${board.regDate }"
								pattern="yyyy-MM-dd HH:mm:ss" /></td>
					</tr>
					</c:if>
				</c:forEach>
			</tbody>
		</table>

		<!-- 検索キーワード入力欄  -->
		<div class="row">
			<div class="col-lg-12">
				<form id="searchForm" action="/board/boardSell">
					<select name="type">
						<option value="" ${pageMaker.cri.type == null?'selected':''}>
							検索条件指定</option>
						<option value="T" ${pageMaker.cri.type == 'T'?'selected':''}>
							タイトル</option>
						<option value="C" ${pageMaker.cri.type == 'C'?'selected':''}>
							内容</option>
						<option value="W" ${pageMaker.cri.type == 'W'?'selected':''}>
							名前</option>
						<option value="TCW" ${pageMaker.cri.type == 'TCW'?'selected':''}>
							すべて</option>
					</select> <input type="text" name="keyword"
						value="${pageMaker.cri.keyword }">
					<button class="btn btn-default">Search</button>
					<input type="hidden" name="pageNum"
						value="${pageMaker.cri.pageNum }"> <input type="hidden"
						name="amount" value="${pageMaker.cri.amount }">
				</form>
			</div>
		</div>
		<!-- END 検索キーワード入力欄 -->

		<!-- ページナンバー出力 -->
		<div class="paging-div">
			<ul class="pagination" id="pagination">
				<c:if test="${pageMaker.prev }">
					<li class="page-item"><a class="page-link"
						href="${pageMaker.startPage - 1}">Previous</a></li>
				</c:if>
				<!-- <li class="page-item"><a class="page-link" href="#">Previous</a></li> -->
				<c:forEach begin="${pageMaker.startPage }"
					end="${pageMaker.endPage }" var="num">
					<li
						class="page-item
										${pageMaker.cri.pageNum == num ? 'active' : '' }">
						<a class="page-link" href="${num }">${num }</a>
					</li>
				</c:forEach>
				<c:if test="${pageMaker.next }">
					<li class="page-item"><a class="page-link"
						href="${pageMaker.endPage + 1}">Next</a></li>
				</c:if>
				<!-- <li class="page-item"><a class="page-link" href="#">Next</a></li> -->
			</ul>
		</div>
		<!-- END ページナンバー出力 -->

		<!-- ページナンバーリンク処理 -->
		<form action="/board/boardSell" id="actionForm" method="get">
			<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
			<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
			<input type="hidden" name="keyword" value="${pageMaker.cri.keyword }">
			<input type="hidden" name="type" value="${pageMaker.cri.type }">
		</form>
		<!-- END ページナンバーリンク処理 -->
	</div>
	<script>
		//ページナンバーリンク a タグ 作動 処理
		$(function() {
			//result 속성의 값 저장
			var result = '<c:out value="${result}"/>';
			checkModal(result);
			//모달 창 다시 띄우지 않기 처리
			history.replaceState({}, null, null);
			//result 값 체크 함수 - 모달 창 띄우기 처리
			function checkModal(result) {
				if (result === '' || history.state) {
					return;
				}
				if (parseInt(result) > 0) {
					$(".modal-body").html(result + "번 게시물이 등록되었습니다.");
				}
				$("#myModal").modal("show");
			}
			//게시물 등록 화면으로 이동
			$("#regBtn").on("click", function() {
				self.location = "/board/register";
			});
			//페이지 번호 링크 a 태그 동작 처리
			var actionForm = $("#actionForm");
			$('.page-item a').on(
					'click',
					function(e) {
						e.preventDefault();
						actionForm.find("input[name='pageNum']").val(
								$(this).attr('href'));
						actionForm.submit();
					});
			//제목 링크 a 태그 동작 처리
			$('.move')
					.on(
							'click',
							function(e) {
								e.preventDefault();
								actionForm
										.append("<input type='hidden' name='pNo' value='"
												+ $(this).attr('href') + "'>")
								actionForm.attr('action', '/board/boardRead');
								actionForm.submit();
							});

			//검색 버튼 이벤트 처리
			var searchForm = $('#searchForm');
			$('#searchForm button').on('click', function(e) {
				e.preventDefault();
				if (!searchForm.find('option:selected').val()) {
					alert('검색 종류를 선택해 주세요.');
					return false;
				}
				if (!searchForm.find('input[name="keyword"]').val()) {
					alert('검색 키워드를 입력해 주세요.');
					return false;
				}
				//검색을 하면 페이지 번호가 1이 되도록 처리
				searchForm.find('input[name="pageNum"]').val("1");
				searchForm.submit();
			});
		});
	</script>
</body>
</html>