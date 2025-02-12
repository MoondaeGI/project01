<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My page</title>
</head>
<body>
	<from action="update.members" method="post">
	<table boarder="1" align="center">
		<tr>
			<th>아이디</th>
			<th>이름</th>
			<th>전화 번호</th>
			<th>이메일 주소</th>
			<th>우편 번호</th>
			<th>주소</th>
			<th>상세 주소</th>
			<th>가입날짜</th>
		</tr>
		<c:forEach var = "i" items = "${ }">
		<tr>
		<td> </td>
		<td> </td>
		<td> </td>
		<td> </td>
		<td> </td>
		<td> </td>
		<td> </td>
		<td> </td>
		
		</tr>
		</c:forEach>
	</table>
</body>
</html>