<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BESTfOOD</title>
</head>
<body style=" height: 100%;">
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" ></script>

  
  <div style ="	width: 100%;  height: 100%; padding: 0%; margin: 0%;">
  
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
   <div class = "bot" style ="width: 100%; height: 80%;">
   		<div style = "float: left; width: 35%;" >&nbsp;</div>
		<div id = "loginform"style = "float: left; width: 30%;"><%@ include file="Login.jsp" %></div>
		<div style = "float: right; width: 35%;">&nbsp; </div>
	</div>	
</div>
    <script>
    <% 	Integer loginch = (Integer)session.getAttribute("pass");    %> // 로그인 상태값을 불러와서 loginch 에 저장한다.
    var loginch = "<%=loginch%>";
    if(loginch == 2) alert("비밀번호가 틀렸습니다.");	 //로그인 상태값이 2 이면 패스워드 틀림 0이면 회원이 아닌상태이다.
    else if (loginch == 0 ) alert("회원이 아닙니다 회원가입해주세요");
    </script>
    
	
	<!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="bootstrap/js/bootstrap.js" ></script>
    <script src="bootstrap/js/bootstrap.min.js" ></script>

</body>
</html>