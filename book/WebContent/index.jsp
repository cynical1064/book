<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="css/style.css" rel='stylesheet' >
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
<script>

</script>
</head>
<body>

<%@ include file="./module/header.jsp" %>

<div id="container">
	<div class="mainContent">
		<div id="mainSlider">
			<iframe src="./mainSlider/option/slider.html" width="100%" height="600px"></iframe>
		</div>
		<div id="mainSection">
			<iframe src="./brickfolio/section.html" width="100%" height="900px;" ></iframe>	
		</div>
	</div>
</div>

<%@ include file="./module/footer.jsp" %>

</body>
</html>