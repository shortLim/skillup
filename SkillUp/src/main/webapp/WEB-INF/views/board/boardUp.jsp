<!DOCTYPE html>
<html>
<head>
<title>Slick Playground</title>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="/resources/slick/slick.css">
<link rel="stylesheet" type="text/css" href="/resources/slick/slick-theme.css">
<style type="text/css">
html, body {
	margin: 0;
	padding: 0;
	overflow: hidden;
}

.slick-slide img {
	width: 100%;
	height: 100%;
}

.slick-slide {
	transition: all ease-in-out .3s;
	opacity: .2;
}

.slick-active {
	opacity: .5;
}

.slick-current {
	opacity: 1;
}
</style>
</head>
<body>
	<section class="lazy slider" data-sizes="50vw">
		<div>
			<img src = "/resources/img/1.png">
		</div>
		<div>
			<img src = "/resources/img/2.png">
		</div>
		<div>
			<img src = "/resources/img/3.png">
		</div>
	</section>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="/resources/slick/slick.js" type="text/javascript" charset="utf-8"></script>

	<script type="text/javascript">
		$(".lazy").slick({
			infinite : true,
			autoplay : true,
		    autoplaySpeed : 2000,
		});
	</script>
</body>
</html>
