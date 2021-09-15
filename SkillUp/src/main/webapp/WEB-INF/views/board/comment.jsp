<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>コメント</title>
<link rel="stylesheet" type="text/css" href="bootstrap-3.2.2-dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
<!-- <script type="text/javascript">
	function popup(){
		var url = "popup.jsp";
		var name = "popup";
		window.open(url,name,"width=1000,heightght=1000,toolbar=no,status=no,location=no,
				scrollbar=yes,menubar=no,resizable=yes,left=50,right=50")
	}
</script> -->
</head>
<body>
<div align="center">
<table class="table table-bordered" width="80%">
	<!-- 画面表示用サンプル -->
	<tr>
		   <td  width="10%">kim</td>
		   <td>sample</td>
		   <td><input onclick="popup()" type="button"  value="削除"></td>
	</tr>
	<c:forEach var="" items="${xxx.com}">
		<tr>
		   <td width="10%">${xxx.comWriter}</td>
		   <td width="90%">${xxx.comment}</td>
		   <td><input type="button"  value="削除"></td>
	    </tr>
	</c:forEach>

</table>
</div>
</body>
</html>