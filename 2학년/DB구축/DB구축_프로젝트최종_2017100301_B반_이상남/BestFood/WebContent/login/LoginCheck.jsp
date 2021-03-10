<%@ page import="java.sql.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 체크</title>
</head>
<body>
<%  

	Class.forName("oracle.jdbc.driver.OracleDriver"); // jdbc 드라이버 로딩
	String url = "jdbc:oracle:thin:@localhost:1521:testdb";
	PreparedStatement ppst = null; //쿼리객체
	ResultSet rs=null; //쿼리 결과넣을 객체
	String user = "proj";
	String password = "proj";
	String checkid = request.getParameter("id");
	String checkpw = request.getParameter("passwd");
	int i=0;	// pass 에 i 값을 넣어서  1이면 로그인  2 면 패스워드틀림  0 이면 회원이 아님을 표시힌다.
	Connection con = null;
	try{
		con = DriverManager.getConnection(url, user, password); // Connection 객체 생성(db 연결) 
		ppst = con.prepareStatement("select id,passwd from member where id='"+checkid+"'"); // PreparedStatement 객체 생성(쿼리 생성)
		rs = ppst.executeQuery(); // 쿼리(sql) 실행
		
	
	if(rs.next()){
			
			String id = rs.getString(1);
			String pw = rs.getString(2);
			if(id.equals(checkid) && pw.equals(checkpw)){i=1; session.setAttribute("login", id); session.setAttribute("pass",i);}
			 // 아이디와 패스워드가 같으면  로그인상태를 1로 주고 세션에로그인 유저아이디를 저장한다.
			else if(id.equals(checkid)){i=2; session.setAttribute("login",id); session.setAttribute("pass",i);}
			// 아이디만같을 경우 로그인상태를 2로주고 세션에 로그인 유저아이디를 저장한다.
		}	
	
	else {session.setAttribute("pass",i);
	}	
	
	}catch(Exception e){
		e.getStackTrace();
	}finally{
		try{ // 연결된 DB를 종료
			if(ppst != null)
				ppst.close();
			if(con != null)
				con.close();
			
			if(i == 1) %> <script> location.href = "../Main/BFmain.jsp" </script><%
			else if(i==2){%><script> alert("비밀번호가 틀렸습니다.");
			history.back(); </script><%}
			else {%> <script> alert("회원이 아닙니다 회원가입해주세요");
			history.back(); </script><%}
		}catch(Exception e1){
			e1.getStackTrace();
		}
	}
%>

</body>
</html>