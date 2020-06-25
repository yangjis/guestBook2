<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import = "com.javaex.vo.GuestVo"%>
<%@page import = "com.javaex.dao.GuestDao" %>
    
<%
	int num = (int)request.getAttribute("num");	

	if(num == 1){
		response.sendRedirect("/guestBook2/gb2?action=main");
	}else{%>
		<script>
		alert("비밀번호가 틀렸습니다.");
		document.location.href = "/guestBook2/gb2?action=main";
		</script>
	<%}%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>



</body>
</html>