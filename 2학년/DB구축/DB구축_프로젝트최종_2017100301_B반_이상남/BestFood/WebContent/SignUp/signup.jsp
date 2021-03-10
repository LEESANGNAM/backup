<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script>

</script>
</head>
<body>

<div style = "float: left; width:100%;height:100%;">
	<form method ="get" name ="mem" >
		아이디 <br><input type="text" id="mid" name="mid" maxlength="20" size=50;><input type="button" value="중복확인" onclick="PageChange()"><br>
		비번 <br><input type="password" id="mpw"name="mpw" maxlength="20" size=50;><br>
		이름<br><input type="text" id="mname" name="mname"size=50;><br>
		주민번호<br><input type="text" id="mnum" name="mnum"size=50;><br>
		주소<br><input type="text" id="madd" name="madd"size=50;><br>
		전화번호<br><input type="text" id="mphone" name="mphone"size=50;><br>
		나이<br><input type="text" id="mage" name="mage"size=50;><br>
		<input type="button" value="회원가입" onclick="Pageok()">
	</form>
</div>

<%@ include file="SignupCheck.jsp" %>
</body>
</html>