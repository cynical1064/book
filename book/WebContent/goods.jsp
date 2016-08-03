<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="css/style.css" rel='stylesheet' >
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
<!-- bxSlider Javascript file -->
<link href="./css/jquery.bxslider.css" rel="stylesheet" />
<script src="./js/jquery.bxslider.min.js"></script>
<!-- bxSlider CSS file -->
<script>
	$(document).ready(function(){
		
	 $('.leftNav dd').click(function(){
		 
		 $('.leftNav dd').removeClass();
		 
		 if(!($(this).hasClass())){
			 
			 $(this).addClass('activeLeft'); 
			 
		 }		 
		 
	 })
	  
	});
</script>
</head>
<body>
<!-- 헤더 시작 -->
<%@ include file="./module/header.jsp" %>
<!-- 헤더 끝 -->

<!-- 컨테이너 시작 -->
<div id="container">
	<div id="leftMenu">		
		<dl class="leftNav">
			<dt>팬션 미리보기</dt>
			<dd class="activeLeft">옥탑방</dd>
			<dd>반지하</dd>
			<dd>고시텔</dd>
		</dl>
	</div>
	<div class="content clearFix">
		<div>
		<div id="roomImg">
		<img src="./images/20091231105691.jpg" />
		</div>
		<h4>옥탑방</h4>
		<table id="roomInfo">
			<tr>
				<td><span class="infoTitle">상세주소</span></td>
				<td></td>
			</tr>
			<tr>
				<td><span class="infoTitle">상세주소</span></td>
				<td></td>
			</tr>
			<tr>
				<td><span class="infoTitle">상세주소</span></td>
				<td></td>
			</tr>
			<tr>
				<td><span class="infoTitle">상세주소</span></td>
				<td></td>
			</tr>			
		</table>
		<div>
			<div>
				<span style="color:#434343;">
					<a href="./NewFile.jsp?roomName=옥탑방">지금예약하기</a>
				</span>
			</div>
		</div>
		</div>
	</div>
</div>
<!-- 컨테이너 끝 -->

<!-- 풋터 시작 -->
<footer>
	<div id="footer">
	
	</div>
</footer>
<!-- 풋터 끝 -->
</body>
</html>