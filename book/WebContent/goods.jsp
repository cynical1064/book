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
		
		$('.leftMenu').click(function(){			
			
			var menuIndex = $('.leftMenu').index(this);
			//alert(menuIndex);
			$('.leftMenu').removeClass('activeLeft');			
			
			if(!($(this).hasClass())){
				 
				$(this).addClass('activeLeft');	
				
			}			
			
			$('.hiddenRoomInfo').removeClass('onRoomInfo');				
			
			if(!($(this).hasClass())){
				
				$('.hiddenRoomInfo').eq(menuIndex).addClass('onRoomInfo');	
				
			}
			 
		});
	  
	});
</script>
</head>
<body>
<!-- 헤더 시작 -->
<%@ include file="./module/header.jsp" %>
<!-- 헤더 끝 -->

<!-- 컨테이너 시작 -->
<div id="container">
	<div id="leftMenuWrap">		
		<dl class="leftNav">
			<dt>팬션 미리보기</dt>
			<dd class="leftMenu activeLeft">옥탑방</dd>
			<dd class="leftMenu">반지하</dd>
			<dd class="leftMenu">고시텔</dd>
		</dl>
	</div>
	<div class="content clearFix">
		<!-- 옥탑방 -->
		<div class="hiddenRoomInfo onRoomInfo">
			<div id="roomImg">
				<img src="./images/20091231105691.jpg" />				
			</div>
			<div>
				<h3 class="roomName">옥탑방</h3>
			</div>
			<table>

				<colgroup>
					<col width="18%" /><col width="*" /><col width="18%" /><col width="*" />
				</colgroup>				
				<tr>
					<th>상세주소</th>
					<td colspan="3">
                        	구주소 : 경기 가평군 청평면 대성리 90-24 <br/>
                        	신주소 : 경기 가평군 청평면 큰갈월로1번길 46 

					</td>
				</tr>

                <tr>
					<th>운영객실</th>
					<td colspan="3"><strong><span class="blue">입실시간</span>&nbsp;:&nbsp;15시 이후 &nbsp;<span class="blue">퇴실시간</span>&nbsp;:&nbsp;12시 이전</strong></td>
				</tr>
				<tr>
					<th>픽업여부</th>
					<td colspan="3">

						픽업 제공안함
					</td>
				</tr>
				<tr>
					<th>예약문의</th>
					<td colspan="3">02-307-5173</td>
				</tr>

				<tr>
					<th>성수기구분</th>
					<td colspan="3">


						<span class="blue">[여름 성수기]</span> 2016-07-15~2016-08-14
						<span class="blue">[겨울 성수기]</span> 없음<br />


						<span class="blue">[준 성수기]</span>
						2016-08-15~2016-08-24 까지
							
					</td>
				</tr>
				<tr>
				
				</tr>
			</table>
			<div id="bookBtnWrap">
				<div>
					<span>
						<a href="./NewFile.jsp?roomName=옥탑방">지금예약하기</a>
					</span>
				</div>
			</div>
			<div id="roomExp">
				<div>
					
				</div>
			</div>
		</div>
		<!-- 반지하 -->
		<div class="hiddenRoomInfo">
			<div id="roomImg">
			<img src="./images/20149151027381.jpg" />
			</div>
			<div>
				<h3 class="roomName">반지하</h3>
			</div>
			<table>

				<colgroup>
					<col width="18%" /><col width="*" /><col width="18%" /><col width="*" />
				</colgroup>				
				<tr>
					<th>상세주소</th>
					<td colspan="3">
                        	구주소 : 경기 가평군 청평면 대성리 90-24 <br/>
                        	신주소 : 경기 가평군 청평면 큰갈월로1번길 46 

					</td>
				</tr>

                <tr>
					<th>운영객실</th>
					<td colspan="3"><strong><span class="blue">입실시간</span>&nbsp;:&nbsp;15시 이후 &nbsp;<span class="blue">퇴실시간</span>&nbsp;:&nbsp;12시 이전</strong></td>
				</tr>
				<tr>
					<th>픽업여부</th>
					<td colspan="3">

						픽업 제공안함
					</td>
				</tr>
				<tr>
					<th>예약문의</th>
					<td colspan="3">02-307-5173</td>
				</tr>

				<tr>
					<th>성수기구분</th>
					<td colspan="3">


						<span class="blue">[여름 성수기]</span> 2016-07-15~2016-08-14
						<span class="blue">[겨울 성수기]</span> 없음<br />


						<span class="blue">[준 성수기]</span>
						2016-08-15~2016-08-24 까지
							
					</td>
				</tr>
				<tr>
				
				</tr>
			</table>
			<div id="bookBtnWrap">
				<div>
					<span>
						<a href="./NewFile.jsp?roomName=반지하">지금예약하기</a>
					</span>
				</div>
			</div>
			<div id="roomExp">
				<div>
					
				</div>
			</div>
		</div>
		<!-- 고시텔 -->
		<div class="hiddenRoomInfo">
			<div id="roomImg">
			<img src="./images/201542014554.jpg" />
			</div>
			<div>
				<h3 class="roomName">고시텔</h3>
			</div>
			<table>

				<colgroup>
					<col width="18%" /><col width="*" /><col width="18%" /><col width="*" />
				</colgroup>				
				<tr>
					<th>상세주소</th>
					<td colspan="3">
                        	구주소 : 경기 가평군 청평면 대성리 90-24 <br/>
                        	신주소 : 경기 가평군 청평면 큰갈월로1번길 46 

					</td>
				</tr>

                <tr>
					<th>운영객실</th>
					<td colspan="3"><strong><span class="blue">입실시간</span>&nbsp;:&nbsp;15시 이후 &nbsp;<span class="blue">퇴실시간</span>&nbsp;:&nbsp;12시 이전</strong></td>
				</tr>
				<tr>
					<th>픽업여부</th>
					<td colspan="3">

						픽업 제공안함
					</td>
				</tr>
				<tr>
					<th>예약문의</th>
					<td colspan="3">02-307-5173</td>
				</tr>

				<tr>
					<th>성수기구분</th>
					<td colspan="3">


						<span class="blue">[여름 성수기]</span> 2016-07-15~2016-08-14
						<span class="blue">[겨울 성수기]</span> 없음<br />


						<span class="blue">[준 성수기]</span>
						2016-08-15~2016-08-24 까지
							
					</td>
				</tr>
				<tr>
				
				</tr>
			</table>
			<div id="bookBtnWrap">
				<div>
					<span>
						<a href="./NewFile.jsp?roomName=고시텔">지금예약하기</a>
					</span>
				</div>
			</div>
			<div id="roomExp">
				<div>
					
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