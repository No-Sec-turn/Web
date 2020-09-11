<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>WebContent/jsp4_test/loginForm.jsp</h1>

<script type="text/javascript">

function fun1() {
	//회원 가입 페이지로 이동하는 함수 생성
	alert("회원가입 페이지로 이동");
	
   location.href = "insertForm.jsp";   
}


</script>

<form action="loginPro.jsp" method="post">
아이디 : <input type="text" name="id"><br>
비밀번호 : <input type="password" name="pass"><br>
<input type="submit" value="로그인">
<input type="button" value="회원가입" onclick="fun1()">


</form>
</body>
</html>







