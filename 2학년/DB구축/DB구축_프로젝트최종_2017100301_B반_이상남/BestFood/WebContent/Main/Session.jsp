<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
  
#login{ margin-right:-1px; border: 1px solid #D9D9BD; color:white; background-color: #D9D9BD;  border-top-left-radius: 5px; border-bottom-left-radius: 5px;} 
#signup{ border: 1px solid #D9D9BD; color:white; background-color:#D9D9BD; border-top-right-radius: 5px; border-bottom-right-radius: 5px;}
#memid{ margin-right:5px; padding:2px; border: 1px solid #D9D9BD; color:white; background-color: #D9D9BD; border-radius: 5px;} 
#logout{ border: 1px solid #D9D9BD; color:white; background-color:#D9D9BD; border-radius: 5px;}
#login:hover{ color:#D9D9BD; background-color: white; }
#signup:hover{ color:#D9D9BD; background-color: white; }
#memid:hover{ color:#D9D9BD; background-color: white; }
#logout:hover{ color:#D9D9BD; background-color: white; }
</style>

</head>
<body>
	<% String mem = (String)session.getAttribute("login"); //로그인 유저아이디를 mem 에 저장한다.
      	Integer pagech = (Integer)session.getAttribute("pass");  //로그인 체크용 세션값도 pagech에 저장한다.
    	if ((mem == null)||(pagech == null)||(pagech!=1))  { // mem이 null 이거나 로그인 세션값이 1이아니거나 null 일경우 로그인 회원가입 버튼을 나타내고
       %>
    <div  id = "memdiv1" style="width: 100% ; float : right; padding-right: 15px; ">
     <input type="button" id="signup" value="회원가입" style = "  float : right; padding-right: 5px; " onclick="location.href = '../SignUp/SignupMain.jsp'">
    <input type="button" id="login" value="로그인" style = " float : right;" onclick="location.href = '../login/LoginMain.jsp'">
    </div> 
    <%} else {%> 
    <div id = "memdiv"> <!-- 아닐 경우에는 로그인 한 상태를 나타냄으로써 유저의 아이디와 로그아웃버튼을 나타내고 로그아웃버튼을 누르면 로그아웃페이지로 이동한다. -->
    <input type="button" id="logout" value="로그아웃" style="float : right" onclick="location.href = '../login/Logout.jsp'">
    <% out.print("<button id='memid' style=' float : right'>ID : "+mem+"</button>"); %>
    
    	
    </div><% } %>
</body>
</html>