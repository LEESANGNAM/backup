<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>랭킹 페이지처리</title>
</head>
<body>
<div style="width: 500px; height: 400px; ">
<TABLE border="1">
<%  

	Class.forName("oracle.jdbc.driver.OracleDriver"); // jdbc 드라이버 로딩
	String url = "jdbc:oracle:thin:@localhost:1521:testdb";
	PreparedStatement ppst = null; //쿼리객체
	ResultSet rs=null; //쿼리 결과넣을 객체
	String user = "proj";
	String password = "proj";
	Connection con = null;
	String sql = "(select fname,faddress,fcount,RANK( ) OVER (ORDER BY fcount DESC, fname) AS RANK from bestfood)"; // 인라인뷰 미리생성
	try{
		con = DriverManager.getConnection(url, user, password); // Connection 객체 생성(db 연결) 
		ppst = con.prepareStatement("select * from"+sql+"where RANK between 1 and 10"); // PreparedStatement 객체 생성(쿼리 생성)
		rs = ppst.executeQuery(); // 쿼리(sql) 실행
		out.print("<tr>");
		out.print("<th> 랭킹 </th>");
		out.print("<th> 가게명 </th>");
		out.print("<th> 주소</th>");
		out.print("<th> 조회수 </th>");
		out.print("</tr>");
		int i=1; // 순위를나타낼 변수
	while(rs.next()){
		out.print("<tr>");	
		out.println("<td>"+i+"위</td>");
		for(int j=1; j<4;j++){	 // for 문으로   필드 하나씩 생성
		
			String fname = rs.getString(j);
			
		out.println("<td>" +fname+"</td>");
		}
		i++;
		out.print("</tr>");
	}	
	%></TABLE>
	<table style="margin-top: 20px; margin-left: 130px;"> 	
		<tr>
			<td><a href="RankMain.jsp"style="text-decoration:none" >1&nbsp;</a></td>
			<td><a href="RankMain2.jsp"style="text-decoration:none" >2&nbsp;</a></td>
			<td><a href="RankMain3.jsp"style="text-decoration:none" >3&nbsp;</a></td>
			<td><a href="RankMain4.jsp"style="text-decoration:none" >4&nbsp;</a></td>
			<td><a href="RankMain5.jsp"style="text-decoration:none" >5&nbsp;</a></td>
			<td><a href="RankMain6.jsp"style="text-decoration:none" >6&nbsp;</a></td>
			<td><a href="RankMain7.jsp"style="text-decoration:none" >7&nbsp;</a></td>
			<td><a href="RankMain8.jsp"style="text-decoration:none" >8&nbsp;</a></td>
			<td><a href="RankMain9.jsp"style="text-decoration:none" >9&nbsp;</a></td>
			<td><a href="RankMain10.jsp"style="text-decoration:none" >10</a></td>
		</tr>
	 </table>  
	 </div> <% // 페이지 처리 테이블 
	}catch(Exception e){
		e.getStackTrace();
	}finally{
		try{ // 연결된 DB를 종료
			if(ppst != null)
				ppst.close();
			if(con != null)
				con.close();
		}catch(Exception e1){
			e1.getStackTrace();
		}
	}
%>

</body>
</html>