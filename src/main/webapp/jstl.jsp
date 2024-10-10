<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL 테스트</title>
</head>
<body>
	<%-- 
		컨트롤러에서 보면 아래 코드가 키 값
		request.getParametar("key") === ${param.key}
		{requestScope} -> {sessionScope} -> {applicationScope}
		
	 --%>
	<h1>${name}</h1>
	
	
	<%--  
		if문 
		<c:if test="${조건식}"></c:if>
	--%>
		<c:if test="${name != '이소연'}">
			${name}
		</c:if>
		
		<c:if test="${empty param.name}">
			<h1>값을 입력하세요.</h1>
		</c:if>
		
	<%--  
		switch문  == choose문 
		<c:choose test="${조건식}">
			<c:when test="${값1}">
				값이 1일 때 실행할 문장
			</c:when>
			<c:when test="${값2}">
				값이 2일 때 실행할 문장
			</c:when>
			<c:when test="${값3}">
				값이 3일 때 실행할 문장
			</c:when>
			<c:otherwise>
				위에 모두 해당되지 않을 때 실행할 문장
			</c:otherwise>
		</c:choose>
	--%>
	
		<c:choose>
			<c:when test="${name == '이소연'}">
				😊😊😊
			</c:when>
			<c:when test="${name == '소연'}">
				👍👍👍
			</c:when>
			<c:when test="${name == '이소'}">
				👻👻👻
			</c:when>
			<c:otherwise>
				위에 모두 해당되지 않을 때 실행할 문장
			</c:otherwise>
		</c:choose>
	
	
<%-- 	
		<c:forEach var="data" begin="0" end="10">
			${data}
		</c:forEach> 
--%>
		<table border="1">
			<tr>
				<th>게시글 번호</th>
				<th>게시글 제목</th>
				<th>게시글 내용</th>
			</tr>
			<c:forEach var="post" items="${posts}">
				<tr>
					<td><c:out value="${post.id}" escapeXml="true" /></td>
					<td>${post.postTitle}</td>
					<td>${post.postContent}</td>
				</tr>
			</c:forEach> 
		</table>
		
<%-- 		<c:forEach var="data" items="${datas}">
			${data}
			<c:out value="${data}" escapeXml="true" />
		</c:forEach> --%>
		
		<div id="result"></div>
</body>
<script>
	const datas = JSON.parse(`${datas}`)
	console.log(datas);
	
	const result = document.getElementById("result");
	
	// JSTL과  ES6 탬플릿리터널 충돌
/* 	datas.forEach((data) => {
		result.innerHTML += `
			<h1>${data.id}</h1>
			<h1>${data.postTitle}</h1>
			<h1>${data.postContent}</h1>		
		`
	}) */
	
	datas.forEach((data) => {
		result.innerHTML += (
			"<h1>" + data.id + "</h1>" +
			"<h1>" + data.postTitle + "</h1>" +
			"<h1>" + data.postContent + "</h1>"
		)
	})
</script>
</html>