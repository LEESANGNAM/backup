<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div style="width: 500px; height: 400px;">
		<TABLE border="1">
			<%
				Class.forName("oracle.jdbc.driver.OracleDriver"); // jdbc 드라이버 로딩
			String url = "jdbc:oracle:thin:@localhost:1521:testdb";
			PreparedStatement ppst = null; //쿼리객체
			ResultSet rs = null; //쿼리 결과넣을 객체
			String user = "proj";
			String password = "proj";
			Connection con = null;
			String id = (String) session.getAttribute("login");
			String sql = "select b.fname,b.faddress,TO_CHAR(s.sdate,'YYYY-MM-DD') from bestfood b, search s where b.fid=s.fid and s.id='" + id + "'order by s.sdate desc"; // 인라인뷰 미리생성
			try {
				con = DriverManager.getConnection(url, user, password); // Connection 객체 생성(db 연결) 
				ppst = con.prepareStatement(sql); // PreparedStatement 객체 생성(쿼리 생성)
				rs = ppst.executeQuery(); // 쿼리(sql) 실행
				out.print("<tr>");
				out.print("<th> 가게명 </th>");
				out.print("<th> 주소 </th>");
				out.print("<th> 검색일자</th>");
				out.print("</tr>");
				int i = 0; // 순위를나타낼 변수
				while (rs.next()) {
					if (i < 10) {
						for (int j = 1; j < 4; j++) { // for 문으로   필드 하나씩 생성
						String fname = rs.getString(j);
						out.println("<td>" + fname + "</td>");
						}
					i++;
					out.print("</tr>");
					}
				}
			%>
		</TABLE>

	</div>
	<%
		// 페이지 처리 테이블 
	} catch (Exception e) {
	e.getStackTrace();
	} finally {
	try { // 연결된 DB를 종료
		if (ppst != null)
			ppst.close();
		if (con != null)
			con.close();
	} catch (Exception e1) {
		e1.getStackTrace();
	}
	}
	%>
</body>
</html>