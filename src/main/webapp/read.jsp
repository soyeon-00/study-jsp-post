<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 상세보기</title>
</head>
<body>
	<div>
		<h1 id="title"></h1>
		<p id="content"></p>
	</div>
	<button onclick="location.href='update.post?id=${param.id}'">수정하기</button>
	<button onclick="location.href='delete-ok.post?id=${param.id}'">삭제하기</button>
</body>
<script type="text/javascript">
	const post = JSON.parse(`${post}`);
	const title = document.querySelector("#title");
	const content = document.getElementById("content");
	
	title.innerText = post.postTitle;
	content.innerText = post.postContent;
</script>
</html>