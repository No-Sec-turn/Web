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
String id=(String)session.getAttribute("id");
// 세션값이 없으면   loginForm.jsp이동
if(id==null){
	//  loginForm.jsp이동
	response.sendRedirect("loginForm.jsp");
}
%>
<h1>WebContent/jsp4_test/main.jsp</h1>
<%=id %>님 로그인 하셨습니다.
<input type="button" value="로그아웃" 
     onclick="location.href='logout.jsp'"><br>
<a href="info.jsp">회원정보조회</a>
<a href="updateForm.jsp">회원정보수정</a>
<a href="deleteForm.jsp">회원정보삭제</a>  
<%
// if 세션값이 있으면
//    if 세션값  "admin" 비교 일치하면 
if(id!=null){
	if(id.equals("admin")){
		%><a href="list.jsp">회원목록</a><%
	}
}
%>   

</body>
</html>




