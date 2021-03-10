<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css" >
</head>
<body>

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" ></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<nav class="navbar navbar-expand-lg navbar-light bg-light"  style=" width:100%; height:40px;  background-image: url('../image/moji.jpg'); 
">
  <div class="collapse navbar-collapse" id="navbarSupportedContent" style="height:100%; ">
    <div class="navbar-nav mr-auto" style="  width :100%; ">
      <div class="nav-item active" style=" height:40px;width: 15%; float :left; " >
        <a class="nav-link" href="../Main/BFmain.jsp"><span class="sr-only"><img src="../image/home.jpg" width="100%" height="100%"></span></a>
      </div>
      <div class="nav-item" style=" height:40px; width: 15%;float :left; ">
        <a class="nav-link" href="../Rank/RankMain.jsp"><img src="../image/best.jpg" width="100%" height="100%"></a>
      </div>
      <div class="nav-item" style=" height:40px; width: 15%; float :left;">
        <a class="nav-link" href="../Main/BFmain_ca.jsp" ><img src="../image/cafe.jpg" width="100%" height="100%"></a>
      </div>
      <div class="nav-item" style=" height:40px; width: 15%; float :left;">
        <a class="nav-link" href="../Main/SearchViewMain.jsp" ><img src="../image/search.jpg"width="100%" height="100%"></a>
      </div>
     <div style = "padding-top: 8px; padding-right: 10px; "> 
	<div class="nav-item" style=" height:40px; width: 35%; float :right; background-color: ">
    	<form class="form-inline my-2 my-lg-0" name="aa" style = "float : right">
     	 	<input class="form-control mr-sm-2"  type="search"  id="hi" name="hi" placeholder="지역을 검색하세요" aria-label="Search">
     		 <button class="btn btn-outline-success my-2 my-sm-0" type="submit">검색</button>
   		</form>
    </div>
    </div>
    </div>
  </div>
</nav>

    	<script src="bootstrap/js/bootstrap.js" ></script>
    <script src="bootstrap/js/bootstrap.min.js" ></script>
</body>
</html>