<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%  // 데이터베이스 입력 로직
	Connection conn = null;	// 연결객체
	PreparedStatement ppst = null; //쿼리객체
	ResultSet rs=null; //쿼리 결과넣을 객체
	String url = "jdbc:oracle:thin:@localhost:1521:testdb";
	String user = "proj";
	String password = "proj";
	
    
	try{
		Class.forName("oracle.jdbc.driver.OracleDriver"); // jdbc 드라이버 로딩
		conn = DriverManager.getConnection(url, user, password); // Connection 객체 생성(db 연결)
		ppst = conn.prepareStatement("select * from member"); // PreparedStatement 객체 생성(쿼리 생성)
		rs = ppst.executeQuery(); // 쿼리(sql) 실행
		
		while(rs.next()){
			
			String id = rs.getString(1);
			String passwd = rs.getString(2);
			String name = rs.getString(3);
			String memnum = rs.getString(4);
			String add = rs.getString(5);
			String phone = rs.getString(6);
			int age = rs.getInt(7);
%>

<table>
	<tr>
	<td><%=id %></td>
	<td><%=passwd %></td>
	<td><%=name %></td>
	<td><%=memnum %></td>
	<td><%=add %></td>
	<td><%=phone %></td>
	<td><%=age %></td>
	</tr>
</table>
<%
		}
		
	}catch(Exception e){
		e.getStackTrace();
	}finally{
		try{ // 연결된 DB를 종료
			if(ppst != null)
				ppst.close();
			if(conn != null)
				conn.close();
		}catch(Exception e1){
			e1.getStackTrace();
		}
	}
%>
