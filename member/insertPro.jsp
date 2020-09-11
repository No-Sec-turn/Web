<%@page import="member.MemberBean"%>
<%@page import="member.MemberDAO"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>WebContent/member/insertPro.jsp</h1>
<%
//request 한글처리
request.setCharacterEncoding("utf-8");
// //String id,pass,name 파라미터 => 서버 request 내장객체 저장 => 가져와서 변수 저장
// String id=request.getParameter("id");
// String pass=request.getParameter("pass");
// String name=request.getParameter("name");
// int age=Integer.parseInt(request.getParameter("age"));
// String gender = request.getParameter("gender");
// String email = request.getParameter("email");
// // 가입날짜 <= 현시스템에 날짜시간을 가져오기
// Timestamp date=new Timestamp(System.currentTimeMillis());
// // age ,gender,email 추가

// // 파라미터를 바구니(바구니 파일 만들기)에 담아서 전달 
// // 패키지 member 파일이름 MemberBean 멤버변수 id, pass, name, date 를 저장할 수있게끔 저장 

// // MemberBean 사용하기 위해서 기억장소 확보(객체 생성) 변수이름: mb(바구니 주소)
// MemberBean mb = new MemberBean();

// //멤버변수 <= 파라미터 값 저장 set()메서드 호출
// mb.setId(id);
// mb.setName(name);
// mb.setPass(pass);
// mb.setDate(date);

//디비작업 만들기
//패키지 member 파일이름: MemberDAO(Data Access Object) 리턴형 x insertMember(바구니 주소(mb)) 라는 메서드 정의 

// 액션태그 가지고 객체 생성
%>

<!-- 객체생성 -->
<jsp:useBean id="bt1" class="jsp6.BeanTest1"/>
<!-- name : 멤버변수 이름   num - 파라미터 이름 -->
<%-- <jsp:setProperty property="name" name="bt1" param="name"/> --%>
<%-- <jsp:setProperty property="num" name="bt1" param="num"/> --%>

<!-- 파라미터를 받아서 set메서드 호출해서 값을 저장하는 코드 -->
<jsp:setProperty property="*" name="bt1"/>



<%



// MemberDAO mdao 객체 생성 -> 기억장소 할당 하겠다
MemberDAO mdao = new MemberDAO();

//insertMember(바구니주소) 호출
mdao.insertMember(mb);



// DB 작업  만들기






// // 4단계 - sql실행  (insert, update, delete)
// pstmt.executeUpdate();
%>

<script type="text/javascript">
	alert("회원가입성공");
	location.href="loginForm.jsp";
</script>
</body>
</html>





