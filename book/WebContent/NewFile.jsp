<%@ page contentType = "text/html; charset=UTF-8" pageEncoding = "UTF-8"%>

<%@ page import="java.net.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat, java.util.Calendar, java.util.Date" %>
<%@ page import="com.tour.dto.*" %>
<%@ page import="com.tour.dao.*" %>

<link rel="stylesheet" href="css/monthly.css">
<link href="css/style.css" rel='stylesheet' >
<script type="text/javascript" src="js/jquery.js"></script>
<script src="https://code.jquery.com/ui/1.12.0/jquery-ui.js"></script>
<script type="text/javascript" src="js/monthly.js"></script>
<script src="./dev/pickout.js"></script>


<%
	request.setCharacterEncoding("UTF-8");
	//방가격 정보를 얻어 위해 방 이름을 넘겨 데이터베이스에서 방가격을 가져옵니다.
	String roomName = request.getParameter("roomName");
	GoodsDao goodsDao = new GoodsDao();
	Goods goods = new Goods();
		
	goods = goodsDao.goodsInfo(roomName);
%>
<script>
$(document).ready(function(){

	d = new Date(),//자바스크립트 코드
	currentMonth = d.getMonth() + 1,
	currentYear = d.getFullYear(),
	currentDay = d.getDate();

	var calYear = $('#year').text();
	var calMonth = $('#month').text();
	
	//alert(currentYear == calYear);
	//alert(currentMonth == calMonth);
	
	$('.monthly-day-number').each(function(i){
		
		var calDay = $('.monthly-day-number').eq(i).text();

		if(calYear == currentYear && calMonth == currentMonth && calDay == currentDay){				
			
			$(this).addClass('currentDay');			
			
		}
		
	});
	
	$('.monthly-day').click(function(){
		
		var thisDay = $(this).find('.monthly-day-number').text();
		var bookState = $(this).find('label').text();
		
		var holiday = $(this).attr('id');
		
		//성수기 일때
		if(calMonth > 6 && calMonth < 9){
			//성수기 주말가격 셋팅
			if(holiday == 'sun' || holiday =='sat'){
				$('#price').val(<%=goods.getGoods_ys2()%>);
			//성수기 평일 가격 셋팅
			}else{
				$('#price').val(<%=goods.getGoods_ys1()%>);
			}
		//비수기 일떄
		}else{
			//비수기 주말가격
			if(holiday == 'sun' || holiday =='sat'){
				$('#price').val(<%=goods.getGoods_ns2()%>);
			//비수기 평일가격
			}else{
				$('#price').val(<%=goods.getGoods_ns1()%>);
			}
		}
	
		
		if(bookState == '예약불가'){
			
			alert('예약 가능한 날짜를 선택해주세요');
			
		}else if(thisDay != ''){
			
			$('#chkInTarget').val(currentYear+"/"+currentMonth+"/"+thisDay);
		
		}
		
	});
	$('#chkIn').monthly({
		mode: 'picker',
		target: '#chkInTarget',
		maxWidth: '250px',
		startHidden: true,
		showTrigger: '#chkInTarget',
		stylePast: true,
		disablePast: true
		
	});
	
	$('#chkOut').monthly({
		mode: 'picker',
		target: '#chkOutTarget',
		maxWidth: '250px',
		startHidden: true,
		showTrigger: '#chkOutTarget',
		stylePast: true,
		disablePast: true
		
	});
	

	// With Search
	pickout.to({
		el:'.pickout',
		search: true,
		txtBtnMultiple: 'CONFIRMAR SELECIONADAS'
	});

	
	$('.btn').click(function(){
		
		var chkInVal = $('#chkInTarget').val();
		var chkInArray = chkInVal.split('/');
		var cout1 = Number(chkInArray[2]);
		var chkOutVal = $('#chkOutTarget').val()
		
		var chkOutArray = chkOutVal.split('/');
		var cout2 = Number(chkOutArray[2]);
		//alert(chkInArray[2] > chkOutArray[2]);		

		var chkInArray = chkInVal.split('/');//문자열로 자르기 때문에 parsing작업이 필요함
		var parseChkInArray = parseInt(chkInArray[2]);//parsing작업
		
		var chkOutVal = $('#chkOutTarget').val();
		var chkOutArray = chkOutVal.split('/');
		var parseChkOutArray = parseInt(chkOutArray[2]);
		
		//alert(parseChkInArray>parseChkOutArray);
		
		if($('#chkInTarget').val() == ''){
			
			alert('체크인 날짜를 확인해주세요');
			
		}else if($('#chkOutTarget').val() == ''){
			
			alert('체크아웃 날짜를 확인해주세요');
			
		}else if(cout1 > cout2){
			
			alert('체크아웃 날짜는 체크인 날짜보다 작거나 같을 수 없습니다.');
			$('#chkOutTarget').focus();
			
		}else if(parseChkInArray >= parseChkOutArray){
			
			alert('체크아웃 날짜는 체크인 날짜보다 작거나 같을 수 없습니다.');
			$('#chkOutTarget').focus();
			
		}else if($('#count').val() == ''){
			
			alert('인원 수를 체크해주세요');
			
		}else if($('#pay').val() == ''){
			
			alert('결제 방식을 체크해주세요');
			
		}else if($('#name').val() == ''){
			
			alert('예약자 명을 입력해주세요');
			
		}else if($('#phone').val() == ''){
			
			alert('연락처를 입력해주세요');
			
		}else{
			
			$('form').submit();
			
		}
		
	})
	
});
</script>
<style>
li{list-style:none;}
a{text-decoration:none; color:#434343;}
body{color:#434343;}
#sat{color:#0000ff;}
#sun{color:#ff0000;}
.monthly-day{width: calc(100% / 7);
			box-sizing:border-box;
			position: relative;
			font-weight: bold;
			color:inherit;
			background: #fff;
			box-shadow: 0 0 0 1px #EBEBEB;
			transition:.25s;
			padding:0;
			text-decoration: none;}
#calWrap{float:right;}
#chkWrap{float:right;}
		*{padding:0;margin:0;}
		body {
			font: 300 15px Roboto, Calibri;
		}

		.content {
			margin:50px auto 0;
			width:300px;
		}

		h2 {
			margin-bottom:10px;
		}

		h3 {			
			
		}

		.form-group {
			width:250px;
			float:left;
			margin:5px 0;
		}

		label{
			margin-bottom:10px;
			float:left;			
		}

		.btn{
			margin-top:20px;
			padding:6px 14px 6px;
			background:#1abc9c;
			color:#fff;
			border:none;
			border-radius:100px;
			font:400 14px Roboto;
			cursor:pointer;
		}

		.field-input, select{
			width:calc(100% - 20px);
			float:left;
			padding:10px;
			font-family:inherit;
		}		

</style>
	<link rel="stylesheet" href="./dev/pickout.css">
<%

String[] time_array = {"10:00", "13:30", "15:30"};





//그달에 해당 일에 방이 예약이 되는지 상태 저장 배열
int[] date_data_array = new int[35];
//휴일 저장 배열
int[] holiday = new int [12];
int[][] time_data_array = new int[32][4];



int i = 0;

int toYear = 0;
int toMonth = 0;
int toDay = 0;


int date_year_prve = 0;
int date_month_prve = 0;
int date_year_next = 0;
int date_month_next = 0;

String rq_cmsid = "";
String rq_method = "";
String rq_arg = "";

String rq_yy_str = "";
String rq_mm_str = "";
String rq_dd_str = "";

String calday_str = "";
String req_str = "";


rq_cmsid  = request.getParameter("cmsid");
rq_method = request.getParameter("method");
rq_arg    = request.getParameter("arg");

rq_yy_str = request.getParameter("y");
rq_mm_str = request.getParameter("m");
rq_dd_str = request.getParameter("d");
if(rq_cmsid == null || rq_cmsid.equals("")) { rq_cmsid = ""; }
if(rq_method == null || rq_method.equals("")) { rq_method = ""; }
if(rq_arg == null || rq_arg.equals("")) { rq_arg = ""; }

if(rq_yy_str == null || rq_yy_str.equals("")) { rq_yy_str = ""; }
if(rq_mm_str == null || rq_mm_str.equals("")) { rq_mm_str = ""; }
if(rq_dd_str == null || rq_dd_str.equals("")) { rq_dd_str = ""; }

req_str = request.getContextPath() + "/NewFile.jsp?cmsid=" + rq_cmsid;

// -----------------------------------------------------------------------------

// Calendar 초기화
Calendar today    = Calendar.getInstance();
Calendar firstday = Calendar.getInstance();
Calendar lastday  = Calendar.getInstance();
Calendar lastmonth = Calendar.getInstance();
Calendar calday   = Calendar.getInstance();





// 년/월/일 문자형을 숫자형으로 변환
if(rq_yy_str == null || rq_yy_str.equals(""))
{
  toYear = today.get(Calendar.YEAR);
}
else
{
  try{ toYear = Integer.parseInt(rq_yy_str); }catch(Exception ex){ }
}

if(rq_mm_str == null || rq_mm_str.equals(""))
{
  toMonth = today.get(Calendar.MONTH);                                     // 월은 0부터 시작
}
else
{
  try{ toMonth = Integer.parseInt(rq_mm_str) - 1; }catch(Exception ex){ }  // 월은 0부터 시작
}

if(rq_dd_str == null || rq_dd_str.equals(""))
{
	today.set(toYear, toMonth, 1);      // 해당월의 마지막 날짜 (월은 0부터 시작)
	today.add(Calendar.MONTH, 1);  
	today.add(Calendar.DATE, -1);
	//today.set(toYear,toMonth, 1);
	//today.add(Calendar.MONTH, );
  toDay = today.get(Calendar.DATE);
  //toDay2 = today.get(Calendar.DATE, toMonth);
  System.out.println("일수" + toDay);
 // System.out.println("일수2" + toDay2);
}
else
{
  try{ toDay = Integer.parseInt(rq_dd_str); }catch(Exception ex){ }
}

/* out.println("toYear:"+toYear);
out.println("toMonth:"+toMonth);
out.println("toDay:"+toDay); */

// -----------------------------------------------------------------------------
// 해당 월의 첫번째, 마직막 날짜 계산
// -----------------------------------------------------------------------------
firstday.set(toYear, toMonth, 1);     // 해당월의 첫번째 날짜 (월은 0부터 시작)
lastday.set(toYear, toMonth, 1);      // 해당월의 마지막 날짜 (월은 0부터 시작)
lastday.add(Calendar.MONTH, 1);  
lastday.add(Calendar.DATE, -1);
// -----------------------------------------------------------------------------

// 신청가능한 마지막 년월일(+3)
lastmonth.set(today.get(Calendar.YEAR), today.get(Calendar.MONTH), today.get(Calendar.DATE));  
lastmonth.add(Calendar.MONTH, 3);

// 날짜 형식
SimpleDateFormat sdf = new SimpleDateFormat();
sdf.applyPattern("yyyy-MM-dd");

// 오늘 일짜
Calendar cal = Calendar.getInstance();

// 날짜작성 (년-월-01)
cal.set(toYear, toMonth, 1);  // 월은 0부터 시작

// 이전 달
cal.add(Calendar.MONTH, -1);
date_year_prve = cal.get(Calendar.YEAR);
date_month_prve = cal.get(Calendar.MONTH);

// 다음 달
cal.add(Calendar.MONTH, 2);
date_year_next = cal.get(Calendar.YEAR);
date_month_next = cal.get(Calendar.MONTH);



%>

<%@ include file="./module/header.jsp" %>

<div id="bookWrap" style="display:inline-block; padding-top:58px;">
<div id="calWrap" style="float:left; width:600px; padding-top:18px; box-shadow: 0 13px 40px;" class="calender_box">
			
			<div  class="calender_date">
				<h2>
					<a href="<%=req_str%>&amp;y=<%=date_year_prve%>&amp;m=<%=date_month_prve + 1%>&roomName=<%=roomName%>"><</a>
					<span><strong id="year"><%=toYear%></strong>년 <strong  id="month"><%=toMonth + 1%></strong>월</span>
					<a href="<%=req_str%>&amp;y=<%=date_year_next%>&amp;m=<%=date_month_next + 1%>&roomName=<%=roomName%>">></a>
				</h2>
			</div>


	        <div class="monthly-day-title-wrap">
					
		
							<div id="sun">SUN</div>
							<div>MON</div>
							<div>TUE</div>
							<div>WED</div>
							<div>THU</div>
							<div>FRI</div>
							<div id="sat">SAT</div>
			</div>
									<%-- <form name="form_reservation" action="program.action" method="post">
      
                                         <input type="hidden" name="cmsid"    value="<%=rq_cmsid%>" />
										 <input type="hidden" name="method"   value="step2" />
									     <input type="hidden" name="arg"      value="" />
										 <input type="hidden" name="r_date"   value="" />
										 <input type="hidden" name="r_time"   value="" /> --%>
			<div class="monthly-day-wrap">		
						<%
						int jcount = (int)Math.ceil((double)(lastday.get(Calendar.DATE)-1 + firstday.get(Calendar.DAY_OF_WEEK)) / 7);
						int count  = 2;   // 첫번째 요일까지 공백 때분에...
						int _day   = 0;
						int tcnt   = 0;

						int holidayCount = 0;

						String app_day_str = "";
						String day_str = "";
						String td_str = "";
						String link_str = "";
						
						//DB에서 예약 가능한지 상태 값을 가져오기위해 메서드 호출 객체 생성
						BookDao bookDao = new BookDao();	
						boolean result = false;
						ArrayList<Book> bookList = new ArrayList<Book>();
						bookList = bookDao.bookInfo(roomName);
						
						//예약이 이미 되어있는곳을 달력에 표시해주기 위해
						//배열에 예약이 되어있는 날짜 표시
						for(int j = 0; j < bookList.size(); j++){
							int checkInDay = 0;
							int checkOutDay = 0;
							int checkInMonth = 0;
							int checkOutMonth = 0;
							int checkInYear = 0;
							int indexF = 0;
							int indexL = 0;
							
							indexL = bookList.get(j).getBook_checkin().lastIndexOf("/");
							System.out.println("indexL->" + indexL);
							checkInDay = Integer.parseInt(bookList.get(j).getBook_checkin().substring(indexL+1));
							
							indexL = bookList.get(j).getBook_checkout().lastIndexOf("/");
							System.out.println("indexL->" + indexL);
							checkOutDay = Integer.parseInt(bookList.get(j).getBook_checkout().substring(indexL+1));
							
							indexF = bookList.get(j).getBook_checkin().indexOf("/");
							System.out.println("indexF->" + indexF);
							indexL = bookList.get(j).getBook_checkin().lastIndexOf("/");
							System.out.println("indexL->" + indexL);
							checkInMonth = Integer.parseInt(bookList.get(j).getBook_checkin().substring(indexF+1, indexL));
							System.out.println("checkInMonth ->" + checkInMonth);
							
							indexF = bookList.get(j).getBook_checkout().indexOf("/");
							indexL = bookList.get(j).getBook_checkout().lastIndexOf("/");
							checkOutMonth = Integer.parseInt(bookList.get(j).getBook_checkout().substring(indexF+1, indexL));
							System.out.println("checkOutMonth->" + checkOutMonth);
							
							
							for(int k = checkInDay; k < checkOutDay; k++){
								if((toMonth+1) == checkInMonth && (toMonth+1) == checkOutMonth){
									date_data_array[k] = 1;
								}
								//테스트 출력
								//System.out.println("k->" + k);
							}
						}
						Date date = new Date();
						int nowMonth = date.getMonth();
						System.out.println(nowMonth+1);
						System.out.println(toMonth+1);
						if(nowMonth+1 > toMonth+1){
							for(int j = 0; j < date_data_array.length; j++){
								date_data_array[j] = 1;
							}
							
						}
						/* 테스트 코드(나중에 삭제)
						int tt = 0;
						for(int a : date_data_array){
							System.out.println(tt+"번째"+a);
							tt++;
						} */
		
						for(int ju = 0; ju < jcount; ju++)
						{
        					
								for(i = 0; i < 7; i++)
								{
									String stateDay = toYear+""+(toMonth+1)+(count - firstday.get(Calendar.DAY_OF_WEEK));
									String state = "";
									if(firstday.get(Calendar.DAY_OF_WEEK) < count) {
										_day = count - firstday.get(Calendar.DAY_OF_WEEK);
										
										if(_day > lastday.get(Calendar.DATE)){
											_day = 0;
											day_str = "";
								 		}else{
											day_str = "" + _day;
									  		if(date_data_array[_day] == 1){
												state = "예약불가";
											}else{
												state = "예약가능";
											}
									 
								  		}
								  }	
								  
									 count++;
									 
									 td_str = "";
  								//link_str = "<a href='"+ req_str + "&amp;y=" + toYear + "&amp;m=" + (toMonth+1) + "&amp;d=" + _day +"' title='" + day_str +  "' " + schedule_pin_style + ">" + day_str + "</a>";
										link_str = req_str + "&amp;y=" + toYear + "&amp;m=" + toMonth + "&amp;d=" + _day;
										
										calday.set(toYear, toMonth, _day);
										calday_str = sdf.format(calday.getTime());
										
										
										
										td_str = "";
										
										// 일(SUN)
										if(i == 0)
										{
												td_str += "<a href='#' id='sun' class='monthly-day monthly-day-event'>";
												td_str += "<div class='monthly-day-number'>" + day_str + "</div><br/>";
												td_str += "<label>" + state + "</label>";
												//td_str += "<em class='sun'>" + day_str + "</em>";
												//if(_day!=0) { td_str += "<a href='" + link_str + "' title='" + day_str +  "일 " + schedule_pin_txt + "' " + schedule_pin_style + ">" + day_str + "</a>"; }
												td_str += "</a>";
												holiday[holidayCount] = _day;
												holidayCount++;
										}
										// 토(SAT)
										else if(i == 6)
										{
												td_str += "<a href='#' class='monthly-day monthly-day-event' id='sat'>";
												td_str += "<div class='monthly-day-number'>" + day_str + "</div><br/>";
												td_str += "<label>" + state + "</label>";
												//if(_day!=0) { td_str += "<a href='" + link_str + "' title='" + day_str +  "일 " + schedule_pin_txt + "' " + schedule_pin_style + ">" + day_str + "</a>"; }
												td_str += "</a>";
												holiday[holidayCount] = _day;
												holidayCount++;
										}
										// 월(MON)~금(FRI)
										else
										{
												td_str += "<a href='#' class='monthly-day monthly-day-event'>";
												td_str += "<div class='monthly-day-number'>" + day_str + "</div><br/>";
												td_str += "<label>" + state + "</label>";
												//if(_day!=0) { td_str += "<a href='" + link_str + "' title='" + day_str +  "일 " + schedule_pin_txt + "' " + schedule_pin_style + ">" + day_str + "</a>"; }
												td_str += "</a>";
										}
										//td_str += "</div>";
										
										out.println(td_str);
										
								}

					     	}

			%>
										
				
</div>
</div>
<!-- 체크인 체크아웃 셀렉트 -->
<div id="chkWrap" style="float:left; display:inline-block;">
	<form action="./dateTest.jsp" method="post">
	<ul class="clearFix">
		<li>
			<div>
				<input type="hidden" name="roomName" value="<%=roomName %>">
			</div>
		</li>		
		<li>
			<label for="chkInTarget"><h3>체크인</h3></label>
			<div>
				<input type="text" id="chkInTarget" name="chkInTarget">
				<div class="monthly" id="chkIn" style="z-index:1;"></div>
			</div>
		</li>		
		<li>
			<label for="chkOutTarget"><h3>체크아웃</h3></label>
			<div>
				<input type="text" id="chkOutTarget" name="chkOutTarget">
				<div class="monthly" id="chkOut" style="z-index:1;"></div>
			</div>
		</li>
		<li>
			<div class="form-group">
				<label for="count"><h3>인원</h3></label>
				<select name="count" id="count" class="pickout" placeholder="인원 수">
					<option value=""></option>	
					<option value="2">2인</option>				
					<option value="4">3~4인</option>
					<option value="5">4인 초과</option>
				</select>			
			</div>
		</li>
		<li>
			<div class="form-group">
				<label for="option"><h3>옵션</h3></label>
				<select name="option" id="option" multiple class="pickout" placeholder="옵션">
					<option value=""></option>				
					<option value="bbq">바비큐+숯</option>
					<option value="jockgu">족구장+네트</option>
					<option value="referenceRoom">연회장</option>
				</select>			
			</div>
		</li>
		<li>
			<div class="form-group">
				<label for="price"><h3>가격</h3></label>
				<input  type="text" name="price" id="price" placeholder="가격">
			</div>
		</li>
		<li>	
			<div class="form-group">
				<label for="pay"><h3>결제방식</h3></label>
				<select name="pay" id="pay" class="option pickout" placeholder="결제방식">
					<option value=""></option> <!-- Value empty when option not selected -->		
					<option value="card">카드결제</option>
					<option value="bank">무통장입급</option>
				</select>			
			</div>	
		</li>
		<li>
			<div class="form-group">
				<label for="name"><h3>예약자 명</h3></label>
				<input  type="text" name="name" id="name" placeholder="예약자">
				<label for="phone"><h3>휴대전화</h3></label>
				<input  type="text" name="phone" id="phone" placeholder="휴대전화">		
			</div>
		</li>
		<li>
			<div class="form-group">
				<div class="btn">
					SEND
				</div>
			</div>		
		</li>
	</ul>
</form>	
</div>
</div>