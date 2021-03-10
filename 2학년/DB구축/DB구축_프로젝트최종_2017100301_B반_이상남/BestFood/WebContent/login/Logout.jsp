<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% session.invalidate(); // 모든 세션값을 제거하고 메인페이지로 돌아간다.
    pageContext.forward("../Main/BFmain.jsp");%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>