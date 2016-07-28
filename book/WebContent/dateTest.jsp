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
	
	System.out.println(chkIn);
	System.out.println(chkOut);
	System.out.println(roomName);
	
	BookDao bookDao = new BookDao();
	Goods goods = bookDao.goodsInfo();
%>
<div>
	상품명<input type="text" value="<%=goods.getGoods_name()%>"/>
	비수기 평일<input type="text" value="<%=goods.getGoods_ns1()%>"/> 
	비수기 주말<input type="text" value="<%=goods.getGoods_ns2()%>"/> 
	성수기 평일<input type="text" value="<%=goods.getGoods_ys1()%>"/> 
	성수기 주말<input type="text" value="<%=goods.getGoods_ys2()%>"/>  
</div>
</body>
</html>