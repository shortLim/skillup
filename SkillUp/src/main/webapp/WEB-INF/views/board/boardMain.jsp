<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>中古販売サイト</title>

<!-- jQueary -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>

<!-- favicon -->
<link rel="shortcut icon" href="/resources/img/favicon_qaS_icon.ico"
	type="image/x-icon">
<link rel="icon" href="/resources/img/favicon_qaS_icon.ico"
	type="image/x-icon">


<link rel="icon"
	href="/resources/bootstrap-4.0.0/docs/4.0/assets/img/favicons/favicon.ico">
<link rel="canonical"
	href="https://getbootstrap.com/docs/4.0/examples/dashboard/">
<!-- Bootstrap core CSS -->
<link href="/resources/bootstrap-4.0.0/dist/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="/resources/css/dashboard.css" rel="stylesheet">
</head>
<body>
	<header>
		<table>
			<tr>
				<td width="17%" height="180px"><a href="../board/boardMain">
						<img src="../resources/img/boardMainLogo.png" width="100%"
						height="180px" style="margin: 0">
				</a></td>
				<td><iframe src="/board/boardUp" width="100%" height="180px"
						frameborder=0 framespacing=0> </iframe></td>
			</tr>
		</table>
	</header>
	<nav class="navbar navbar-dark sticky-top bg-dark flex-md-nowrap p-0">
		<a class="navbar-brand col-sm-3 col-md-2 mr-0" href="#">会社の名前</a> <input
			class="form-control form-control-dark w-100" type="text"
			placeholder="Search" aria-label="Search">
		<ul class="navbar-nav px-3">
			<li class="nav-item text-nowrap"><a class="nav-link"
				href="signIn">Sign in</a></li>
		</ul>
	</nav>
	<div class="container-fluid">
		<div class="row">
			<nav class="col-md-2 d-none d-md-block bg-light sidebar">
				<div class="sidebar-sticky">
					<ul class="nav flex-column">
						<li class="nav-item"><a class="nav-link active"
							href="/board/boardMain"> <span data-feather="home"></span> ホーム <span
								class="sr-only"></span>
						</a></li>
						<li class="nav-item"><a class="nav-link" href="/board/boardBuy">
								<span data-feather="shopping-cart"></span> 購入
						</a></li>
						<li class="nav-item"><a class="nav-link" href="/board/boardSell">
								<span data-feather="shopping-cart"></span> 販売
						</a></li>
						<li class="nav-item"><a class="nav-link" href="/board/boardFree">
								<span data-feather="users"></span> 自由
						</a></li>
					</ul>
				</div>
			</nav>

		</div>
	</div>
	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script>
		window.jQuery
				|| document
						.write('<script src="/resoureces/bootstrap-4.0.0/assets/js/vendor/jquery-slim.min.js"><\/script>')
	</script>
	<script src="/resources/bootstrap-4.0.0/assets/js/vendor/popper.min.js"></script>
	<script src="/resources/bootstrap-4.0.0/dist/js/bootstrap.min.js"></script>

	<!-- Icons -->
	<script src="https://unpkg.com/feather-icons/dist/feather.min.js"></script>
	<script>
		feather.replace()
	</script>

</body>
</html>