<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:useBean id="today" class="java.util.Date"></jsp:useBean>
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Tables</h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->
        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
<!--                    DataTables Advanced Tables -->
						Board List Page

						<!-- 게시물 등록 버튼 -->
						<button id="regBtn" type="button"
								class="btn btn-xs pull-right">
							Register New Board
						</button>
                    </div>
                    <!-- /.panel-heading -->
                    <div class="panel-body">
<!--                    <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example"> -->
						<table class="table table-striped table-bordered table-hover">
                            <thead>
                                <tr>
                                    <th>#No</th>
                                    <th>タイトル</th>
                                    <th>名前</th>
                                    <th>作成日時</th>
                                    <th>修正日時</th>
                                </tr>
                            </thead>
                            <tbody>
                            <!-- Model의 list 속성의 데이터 출력 -->

                            <c:forEach items="${list }" var="board">
                            	<tr><td>${board.PNo }</td>
                            		<td><a href="get?pNo=${board.PNo}" class="move">
                            				${board.title }
                            				<!-- 댓글 개수 표시 -->
                            				<c:if test="${ board.CCnt > 0 }">
	                            				<b>[${board.CCnt }]</b>
                            				</c:if>
                            			</a></td>
                            		<td>${board.name }</td>
                            		<td><c:set value="${today.date - board.regDate.date }" var="dayDiff" />
  										<c:choose>
    										<c:when test="${dayDiff == 0 }">
        										<fmt:formatDate value="${board.regDate }" pattern="HH:mm:ss"/>
   									 		</c:when>
    										<c:otherwise>
        										<fmt:formatDate value="${board.regDate }" pattern="yyyy-MM-dd"/>
   											</c:otherwise>
  										</c:choose></td>
                            		<td><c:set value="${today.date - board.modiDate.date }" var="dayDiff2" />
  										<c:choose>
    										<c:when test="${dayDiff2 == 0 }">
        										<fmt:formatDate value="${board.modiDate }" pattern="HH:mm:ss"/>
   									 		</c:when>
    										<c:otherwise>
        										<fmt:formatDate value="${board.modiDate }" pattern="yyyy-MM-dd"/>
   											</c:otherwise>
  										</c:choose></td>
                            	</tr>
                            </c:forEach>
                            </tbody>
                        </table>	<!-- /.table-responsive -->

                        <!-- 검색 조건 및 키워드 입력  -->
                        <div class="row">
                        	<div class="col-lg-12">
                        		<form id="searchForm"
                        			  action="/board/list">
                        			<select name="type">
                        				<option value="" ${pageMaker.cri.type == null?'selected':''}>
                        					検索条件指定</option>
                        				<option value="T" ${pageMaker.cri.type == 'T'?'selected':''}>
                        					タイトル</option>
                        				<option value="C" ${pageMaker.cri.type == 'C'?'selected':''}>
                        					内容</option>
                        				<option value="W" ${pageMaker.cri.type == 'W'?'selected':''}>
                        					名前</option>
                        				<option value="TC" ${pageMaker.cri.type == 'TC'?'selected':''}>
                        					タイトル or 内容</option>
                        				<option value="TW" ${pageMaker.cri.type == 'TW'?'selected':''}>
                        					タイトル or 名前</option>
                        				<option value="TCW" ${pageMaker.cri.type == 'TCW'?'selected':''}>
                        					すべて</option>
                        			</select>
                        			<input type="text" name="keyword" value="${pageMaker.cri.keyword }">
                        			<button class="btn btn-default">Search</button>
									<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
									<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
                        		</form>
                        	</div>
                        </div>
                        <!-- END 검색 조건 및 키워드 입력  -->

                        <!-- 페이지 번호 출력 -->
                        <div class='pull-right'>
                        	<ul class="pagination">
                        	<c:if test="${pageMaker.prev }">
                        		<li class="paginate_button previous">
                        			<a href="${pageMaker.startPage - 1}">Previous</a></li>
                        	</c:if>
                        	<c:forEach begin="${pageMaker.startPage }"
                        			   end="${pageMaker.endPage }"
                        			   var="num">
                        		<li class="paginate_button
                        				   ${pageMaker.cri.pageNum == num ? 'active' : '' }">
                        			<a href="${num }">${num }</a></li>
                        	</c:forEach>
                        	<c:if test="${pageMaker.next }">
                        		<li class="paginate_button next">
                        			<a href="${pageMaker.endPage + 1}">Next</a></li>
                        	</c:if>
                        	</ul>
                        </div><!-- END 페이지 번호 출력 -->

                        <!-- 페이지 번호 링크 처리 -->
                        <form action="/board/list" id="actionForm" method="get">
                        	<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
                        	<input type="hidden" name="amount"  value="${pageMaker.cri.amount }">
                        	<input type="hidden" name="keyword" value="${pageMaker.cri.keyword }">
                        	<input type="hidden" name="type"    value="${pageMaker.cri.type }">
                        </form><!-- END 페이지 번호 링크 처리 -->

                        <!-- Modal -->
                        <div class="modal fade" id="myModal"
                        	 tabindex="-1" role="dialog"
                        	 aria-labelledby="myModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal"
                                        		aria-hidden="true">&times;</button>
                                        <h4 class="modal-title" id="myModalLabel">
                                        	<!-- Modal title -->
                                        	Notification
                                        </h4>
                                    </div>
                                    <div class="modal-body">
									<!-- Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. -->
										처리가 완료되었습니다.
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button"
                                        		class="btn btn-default"
                                        		data-dismiss="modal">
                                        	Close</button>
                                        <button type="button"
                                        		class="btn btn-primary">
                                        	Save changes</button>
                                    </div>
                                </div>	<!-- /.modal-content -->
                            </div>		<!-- /.modal-dialog -->
                        </div>			<!-- /.modal -->
                    </div>	<!-- /.panel-body -->
                </div>		<!-- /.panel -->
            </div>			<!-- /.col-lg-6 -->
        </div>				<!-- /.row -->
<script>
$("#regBtn").on("click", function(){
	self.location = "/board/register";
});
</script>
<%@ include file="../includes/footer.jsp" %>