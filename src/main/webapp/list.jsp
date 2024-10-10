<%@page import="com.app.vo.PostVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 목록</title>
</head>
<body>
	<table border="1">
		<tr>
			<th>게시글 번호</th>
			<th>게시글 제목</th>
		</tr>
		<c:forEach var="post" items="${posts}">
			<tr>
				<td><c:out value="${post.id}" escapeXml="true" /></td>
				<td><a href="read.post?id=${post.id}"><c:out value="${post.postTitle}" escapeXml="true" /></a></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>