<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
<%String mid = (String)session.getAttribute("mid");
Integer ch = (Integer)session.getAttribute("ch");%> // 아까 저장한 중복체크 변수 i 의 값   1이면 사용중 0 이면 사용가능 둘다 아니면 체크 x
var ch ="<%=ch%>";  				
var mid = "<%=mid%>";
if (ch==1){alert(mid+"는 사용중입니다.");} //체크값이 1로 유지되는데 만약 세션에저장된 사용불가아이디와 회원가입 아이디가 다르면 중복체크 다시.
else if(ch==0){alert("사용 가능한 아이디 입니다.");document.getElementById("mid").value=mid;}	// 체크값이 0이여도 세션에 저장된 아이디와 회원가입 아이디가 다르면 중복체크 다시.

function PageChange(){
		document.mem.action='MemCheck.jsp';     //  form 의 name 이 mem 
		document.mem.submit(); 					// 함수를 호출하면 mem의 action 값이변경되고 submit 된다.
	}
	
function Pageok(){ 
	var a = CheckValue();					// 함수의 결과를 a 에 대입
	if(a){
		if(ch==0){								// 위에서 확인한 중복체크의 값이 0으로 사용가능 상태이고. 
			const mtext = document.getElementById('mid').value;  // 	현재 mid의 값을 가져와 서 mtext에 대입 = 텍스트필드에 입력값 가져오기.
			
			if(mtext===mid){						// 중복체크가 사용가능상태이고  텍스트필드의 값과 세션에 저장되어있던 중복체크한 아이디가 같으면 회원가입을 진행한다.
				document.mem.action='SignEnd.jsp';
				document.mem.submit();		
			}
			else{alert("중복체크 아이디와 다릅니다.");}	 // 중복체크가 사용가능 상태여도 중복체크를 시도한 아이디와 값이 다르면 경고창을 띄우고 회원가입 진행을 중지한다.
		}
		else {alert("중복체크를 해주세요");}
		
	}
}
function CheckValue(){
	var id = document.getElementById('mid').value;
	var idReg = /^[A-za-z0-9+]*$/; //시작은 영문자나 숫자 한번이상나오고 괄호안에 조건이 반복되고 끝낸다. 
	if(!idReg.test(document.getElementById('mid').value)){   // 위에 선언한 정규표션식이 아닌 한글이나 특수문자가 오면 경고창띄우기
		alert("한글 특수문자 불가.");
		return false;
	}
	else if(!document.getElementById("mpw").value){    //택스트 필드의 값이 비어있으면 경고창 띄우기   모든 텍스트 필드 동일
		alert("비밀번호를 입력해주세요/");
		return false;
	}
	else if(!document.getElementById("mname").value){
		alert("이름를 입력해주세요/");
		return false;
	}
	else if(!document.getElementById("mnum"). value){
		alert("주민번호를 입력해주세요/");
		return false;
	}
	else if(!document.getElementById("madd").value){
		alert("주소를 입력해주세요/");
		return false;
	}
	else if(!document.getElementById("mphone").value){
		alert("전화번호를 입력해주세요/");
		return false;
	}
	else if(!document.getElementById("mage").value){
		alert("나이를 입력해주세요/");
		return false;
	}
	else return true;				// 모든 텍스트필드와 아이디가 조건에 부합할때 true 반환
}

		
</script>
</body>
</html>