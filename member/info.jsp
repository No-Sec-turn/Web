<%@page import="member.MemberBean"%>
<%@page import="member.MemberDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>WebContent/member/info.jsp</h1>
<h2>나의 정보 조회</h2>
<%
// 로그인 한 사용자 <- 세션값 가져오기
String id=(String)session.getAttribute("id");

// MemberDAO에 MemberBean형 리턴 getMember(id) 메서드정의

// MemberDAO mdao 객체 생성 //
MemberDAO mdao = new MemberDAO();

// MemberBean mb = getMember(id) 호출  //mb는 주소값
MemberBean mb = mdao.getMember(id);



	%>
아이디 : <%=mb.getId() %><br>
비밀번호 : <%=mb.getPass() %><br>
이름 : <%=mb.getName() %><br>
가입날짜 : <%=mb.getDate() %><br>



<%
// }
%>
<a href="main.jsp">main.jsp이동</a>
</body>
</html>






