<%@ page import ="java.sql.*" %>
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
PreparedStatement ppst = null; //쿼리객체
String user = "proj";
String password = "proj";
String sid = request.getParameter("mid");
String spw =request.getParameter("mpw");
String sname =request.getParameter("mname");
String snum = request.getParameter("mnum");
String sadd =request.getParameter("madd");
String sphone =request.getParameter("mphone");
String sage=request.getParameter("mage");
Connection con = null;
/* out.print(sid);
out.print(spw);
out.print(sname);
out.print(snum);
out.print(sadd);
out.print(sphone);
out.print(sage);
 */
 try{
	con = DriverManager.getConnection(url, user, password); // Connection 객체 생성(db 연결) 
	ppst = con.prepareStatement("INSERT INTO  member VALUES(?,?,?,?,?,?,?)"); // PreparedStatement 객체 생성(쿼리 생성)
	ppst.setString(1,sid);
	ppst.setString(2,spw);
	ppst.setString(3,sname);
	ppst.setString(4,snum);
	ppst.setString(5,sadd);
	ppst.setString(6,sphone);
	ppst.setString(7,sage);
	ppst.executeUpdate();
	con.commit();
}catch(Exception e){
	e.getStackTrace();
}finally{
	try{ // 연결된 DB를 종료
		if(ppst != null)
			ppst.close();
		if(con != null)
			con.close();
		session.invalidate();
		pageContext.forward("../Main/BFmain.jsp");
	}catch(Exception e1){
		e1.getStackTrace();
	}
}		// 모든 검사결과가 끝나고 해당 페이지로 오게되면 회원정보를 데이터 베이스에 넣고  완전히 처음페이지로 돌아간다.



%>
<script type="text/javascript">
</script>
</body>
</html>