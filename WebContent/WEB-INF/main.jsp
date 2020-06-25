<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import = "com.javaex.vo.GuestVo"%>
<%@page import = "java.util.List" %>

<%
	List<GuestVo> guestList = (List<GuestVo>)request.getAttribute("gList");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방명록</title>
</head>
<body>
	<form action = "/guestBook2/gb2?action = addList" method = "get">
	<table border="1" >
		<tbody style = "width: 600px;">
			<tr>
				<input type = "hidden" value = "addlist" name = "action">
				<td>이름</td>
				<td><input type = "text" style = "width: 97%" name = "name"></td>
				
				<td>비밀번호</td>
				<td><input type = "text" style = "width: 97%" name = "password"></td>
			</tr>
			<tr>
				<td colspan = "4"><input type = "text" style = "width: 800px; height: 200px" name="content" ></td>
			</tr>
			<tr>
				<td colspan = "4"><button type = "submit"> 확인</td>
			</tr>
		</tbody>
	</table>
	</form>
	<br>

	<%for(GuestVo g: guestList){ %>
	<table border = "1">
		<tr>
			<td><%=g.getNo()%></td>
			<td><%=g.getName() %></td>
			<td><%=g.getReg_date() %></td>
			<td><a href="/guestBook2/gb2?action=delete&no=<%=g.getNo()%>">삭제</a></td>
		</tr>
			<td colspan="4" width = "1024px;" height = "45px;"><%=g.getContent() %></td>
		</tr>
	</table>
	<%}%>
</body>
</html>