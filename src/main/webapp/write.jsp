<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 등록</title>
</head>
<body>
 	<form action="write-ok.post" method="post">
 		<div>
	 		<span>제목: </span><input type="text" name="postTitle" />
 		</div>
 		<div>
	 		<span>내용: </span><input type="text" name="postContent" />
 		</div>
 		<button>게시글 등록</button>
 	</form>
</body>
</html>