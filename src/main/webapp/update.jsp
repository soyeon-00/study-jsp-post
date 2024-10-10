<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정</title>
</head>
<body>
	<form action="update-ok.post" method="post">
		<input type="hidden" name="id" value="${param.id}" />
		<input type="text" name="postTitle" value="${requestScope.post.postTitle}" />
		<input type="text" name="postContent" value="${post.postContent}" />
		<button>수정 완료</button>
	</form>

</body>
</html>