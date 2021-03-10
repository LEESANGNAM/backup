<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body style=" height: 100%;">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" ></script>

  
 <div style ="	width: 100%;  height: 100%;  padding: 0%; margin: 0%;">
  
 <div class="Top" style="height: 180px; width: 100%;">
			<div class="side_L" style="width: 15%; float: left;">&nbsp;</div>
			<div class="ban" style="height: 150px; width: 70%; float: left;">
				<img src="../image/배너.jpg" height="150px" width="100%"><img>
				<div class="ban" style="height: 30px; width: 70%;float: right;"><%@ include file="../Main/Session.jsp"%></div>
			</div>
			
			<div class="side_R" style="width: 15%; float: right;"></div>
		</div>
   
  <div class ="med"style ="width: 100%;  height:80px;  ">
 <div class="side_a" style=" width:15%; float: left;">&nbsp;</div>
  <div style ="width:70%;  height: 100%;float: left; "><%@ include file="../Main/BFNav.jsp" %> </div>
  <div class="side_R" style="  width: 15%; ;height: 100%; float: right;">&nbsp;</div>
  </div>
   <div class = "bot" style ="width: 100%; height: 80%;  ">
   		<div style = "float: left; width: 35%; height: 100%;">&nbsp;</div>
		<div style = "float: left;"><%@ include file="signup.jsp" %></div>
		<div style = "float: right; width: 30%; height: 100%;">&nbsp;</div>
	</div>
</div>
</body>
</html>