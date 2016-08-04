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
	<div class="mainContent clearFix">
		<div id="mainSlider">
			<iframe src="./mainSlider/option/slider.html" width="100%" height="600px"></iframe>
		</div>
		<div id="mainSection">
			<iframe src="./brickfolio/section.html" width="100%" height="294px; " ></iframe>	
		</div>
		<div>
			<ul id="mainRoomList">
				<li>
					<dl>
						<dt>Luxury Pool</dt>
						<dd><img src="./images/roomPre_img01.jpg" /></dd>
						<dd>
							<p style="color:#434343; font-size:14px;">
								5개동의 풀빌라는
								복층형의 모던한 인테리어와 
								개별 수영장과 스파, 바베큐를 이용하실 수 있습니다.
							</p>
						</dd>
					</dl>
				</li>
				<li>
					<dl>
						<dt>Luxury Pool</dt>
						<dd><img src="./images/roomPre_img02.jpg" /></dd>
						<dd>
							<p style="color:#434343; font-size:14px;">
								5개동의 풀빌라는
								복층형의 모던한 인테리어와 
								개별 수영장과 스파, 바베큐를 이용하실 수 있습니다.
							</p>
						</dd>
					</dl>
				</li>
				<li>
					<dl>
						<dt>Luxury Pool</dt>
						<dd><img src="./images/roomPre_img03.jpg" /></dd>
						<dd>
							<p style="color:#434343; font-size:14px;">
								5개동의 풀빌라는
								복층형의 모던한 인테리어와 
								개별 수영장과 스파, 바베큐를 이용하실 수 있습니다.
							</p>
						</dd>
					</dl>
				</li>
			</ul>
		</div>
	</div>
</div>

<%@ include file="./module/footer.jsp" %>

</body>
</html>