<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
Class.forName("oracle.jdbc.driver.OracleDriver"); // jdbc 드라이버 로딩
String url = "jdbc:oracle:thin:@localhost:1521:testdb";
CallableStatement cstmt = null; //쿼리객체
CallableStatement cstmt1 = null; //쿼리객체
String user = "proj";
String password = "proj";
Connection con = null;
String mapname = request.getParameter("map_name");
String mapadd = request.getParameter("map_add");
String mapmemid = (String)session.getAttribute("login");
String test = request.getParameter("test");
String Prof="call BF_INOR_Upcount(?,?)"; //프로시저 의 파라미터 빼고 선언
String Pros="call SEARCH_INOR_Update(?,?)";

 try{
	if(mapmemid == null){

	 %><script> /* location.href = "BFmain.jsp?hi="+test; */
	 	history.back();
	 </script><%
	}
	else {  
		con = DriverManager.getConnection(url, user, password); // Connection 객체 생성(db 연결) 
	cstmt = con.prepareCall(Prof); // 프로시저 객체 생성(쿼리 생성)
	cstmt.setString(1,mapname);
	cstmt.setString(2,mapadd);//프로시저 1셋팅
	cstmt1 = con.prepareCall(Pros);
	cstmt1.setString(1,mapname);
	cstmt1.setString(2,mapmemid); // 프로시저 2 셋팅
	cstmt.execute();
	cstmt1.execute();	 // 프로시저 두개다 실행
	 }
 
}catch(Exception e){
	e.getStackTrace();
}finally{
	try{ // 연결된 DB를 종료
		if(cstmt != null)
			cstmt.close();
		if(cstmt1 != null)
			cstmt1.close();
		if(con != null)
			con.close();
		%><script>history.back();/*  location.href = "BFmain.jsp?hi="+test; */</script><%
	}catch(Exception e1){
		e1.getStackTrace();
	}
}



%>

</body>
</html>