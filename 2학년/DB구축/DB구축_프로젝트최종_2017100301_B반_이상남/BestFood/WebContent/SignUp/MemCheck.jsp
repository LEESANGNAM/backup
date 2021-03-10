<%@ page import="java.sql.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중복체크</title>
</head>
<body>
   <%
   Class.forName("oracle.jdbc.driver.OracleDriver"); // jdbc 드라이버 로딩
   String url = "jdbc:oracle:thin:@localhost:1521:testdb";
   PreparedStatement ppst = null; //쿼리객체
   ResultSet rs=null; //쿼리 결과넣을 객체
   String user = "proj";
   String password = "proj";
   String mid = request.getParameter("mid");  // 텍스트 필드 값
   int i=0;		// 중복체크용 변수
   Connection con = null;
   
   try{
      con = DriverManager.getConnection(url, user, password); // Connection 객체 생성(db 연결) 
      ppst = con.prepareStatement("select id from member where id='"+mid+"'"); // PreparedStatement 객체 생성(쿼리 생성)
      rs = ppst.executeQuery(); // 쿼리(sql) 실행
      
   if(rs.next()){
         String id = rs.getString(1);
         if(id.equals(mid)){ i=1;  session.setAttribute("mid",id); session.setAttribute("ch",i);} // 중복된 값이 있으면 중복 체크후 세션에 id 값 세팅 -> 나중에 검사할때 사용
  
   }else if(mid==""){
	   i=2; session.setAttribute("ch",i);			// 텍스트 필드의 입력값이 없으면 세션에 i=2 값 셋팅 -> 나중에 검사할때 사용.
     }
      else{  session.setAttribute("mid",mid); session.setAttribute("ch",i);} // 텍스트 필드의 값 = 쿼리중복아이디 가 아니면 중복 체크결과 0  세션에 텍스트필드의 값 mid 저장
 
   }catch(Exception e){
      e.getStackTrace();
   }finally{
      try{ // 연결된 DB를 종료
         if(ppst != null)
            ppst.close();
         if(con != null)
            con.close();
         pageContext.forward("SignupMain.jsp");  // 끝나면  db를 종료시키고 main페이지로 이동
      }catch(Exception e1){
         e1.getStackTrace();
      }
   }
   
   
   
   %>
</body>
</html>