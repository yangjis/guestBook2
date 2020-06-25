<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import = "com.javaex.vo.GuestVo"%>
<%@page import = "com.javaex.dao.GuestDao" %>

<%
	String no = request.getParameter("no");

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>삭제</title>
</head>
<body>

	<form action="/guestBook2/gb2?action=deleteAction" method="get" >
		<input type = "hidden" value = "<%= no%>" name = "no">
		<input type ="hidden" value = "deleteAction" name = "action">
		비밀번호 <input type = "text" name = "password"><button type = "submit">확인</button>
	</form>
	<br><br>
	<a href = "./main.jsp">메인으로 돌아가기</a>
</body>
</html>