<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.tour.dao.*" %>
<%@ page import="com.tour.dto.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");

	String chkIn = request.getParameter("chkInTarget");
	String chkOut = request.getParameter("chkOutTarget");
	String roomName = request.getParameter("roomName");
	int people = Integer.parseInt(request.getParameter("count"));
	String pay = request.getParameter("pay");
	//String[] option = request.getParameterValues("option");
	String name = request.getParameter("name");
	String phone = request.getParameter("phone");
	
	System.out.println(chkIn);
	System.out.println(chkOut);
	System.out.println(roomName);
	System.out.println(people);
	System.out.println(pay);
	//System.out.println(option[0]);
	System.out.println(name);
	System.out.println(phone);
	
	
	BookDao bookDao = new BookDao();
	
	//Goods goods = bookDao.goodsInfo();
	Book book = new Book();
	
	book.setBook_checkin(chkIn);
	book.setBook_checkout(chkOut);
	book.setGoods_name(roomName);
	book.setBook_count(people);
	book.setBook_pay(pay);
	book.setBook_name(name);
	book.setBook_phone(phone);
	
	int result = bookDao.bookInsert(book);
	
	if(result != 0)
	{
%>
<div>
	상품명<input type="text" value="<%=roomName%>"/>
	체크인<input type="text" value="<%=chkIn%>"/> 
	체크아웃<input type="text" value="<%=chkOut%>"/> 
	사람수<input type="text" value="<%=people%>"/> 
	결제방법<input type="text" value="<%=pay%>"/>  
	예약자명<input type="text" value="<%=name%>"/>  
	예약자폰<input type="text" value="<%=phone%>"/>   
</div>
<%
	}
%>
</body>
</html>