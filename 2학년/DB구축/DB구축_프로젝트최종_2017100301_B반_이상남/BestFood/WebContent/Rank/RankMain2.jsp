<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en" style=" height: 100%" >
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css" >
  <link rel="stylesheet" href="bootstrap/css/bootstrap.css" >
   
    <title>Kakao 지도 시작하기</title>
  </head>
  <body style=" height: 100%">
 	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" ></script>
 <script src="bootstrap/js/bootstrap.js" ></script>
    <script src="bootstrap/js/bootstrap.min.js" ></script>
  
  <div style="width: 100%; height: 100%; padding: 0%; margin: 0%; ">
  
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
   
   <div class = "bot" style ="width: 100%; height: 80%; margin-top: 20px; ">
		<div class="side_l" style=" width: 35%;  float: left; ">&nbsp;</div>
		<div style="width : 30%; height: 60%; float: left; " ><%@ include file="RankPage/Rank2.jsp" %></div>
		<div class="side_R" style="  width: 35%; ; float: right;">&nbsp;</div>
	</div>
</div>
    
    

	<!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->


  </body>
</html>