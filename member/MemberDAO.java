package member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class MemberDAO {

//public void insert(전달 받을 변수) {

//}
//패키지 member 파일이름: MemberDAO(Data Access Object) 

	
	//리턴형 x insertMember(바구니 주소(mb)) 라는 메서드 정의 	
	public void insertMember(MemberBean mb) {
		
		System.out.println("받은주소:" + mb);  //member라는 클래스안의 memberBean에 접근할 수 있는 주소
		System.out.println("회원아이디 : " + mb.getId());
		System.out.println("회원이름 : " + mb.getName());
		System.out.println("회원비밀번호 : " + mb.getPass());
		System.out.println("회원가입날짜 : " + mb.getDate());
// 외부에 있는 파일을 갖고 연동을 하니 예기치 않은 에러가 발생 --> java에서는 예기치 않은 파일 --> 예외처리	

// 예외처리 : 예기치 않게 에러발생 처리할수 있게 만든 코드
		
//		int a= 10;
//		int b= 0;
		// 수동 예외처리
////		if(b!=0) {
////			System.out.println(a/b);
////		}else {
////			System.out.println("B가 0임");
////		}
//		//자동 예외 처리
//		
////		try {
////			//예외가 발생할 수있는 코드 입력
////			System.out.println(a/b);
////		} catch (Exception e) {
////			// 예외가 발생하면 처리코드
////			System.out.println("b가 0입니다");
////		}finally {
////			
////			//예외 상관없이 처리되는 코드
////			System.out.println("예외든 아니든 무조건 출력!");
////		}
////		System.out.println("프로그램 끝");
////			
		

		try {
			//예외 발생할 코드
			
			// // JDBC 프로그램 설치
			// // 1단계 - JDBC프로그램안에 Driver 프로그램 가져오기
			 Class.forName("com.mysql.jdbc.Driver");
			// // 2단계 - DriverManager 자바프로그램이 Driver 프로그램을 가지고 디비서버 접속
			// //        => 접속정보 저장
			 String dbUrl="jdbc:mysql://localhost:3306/jspdb1";
			 String dbUser="jspid";
			 String dbPass="jsppass";
			 Connection con=DriverManager.getConnection(dbUrl, dbUser, dbPass);
			// // 3단계 - 접속정보를 이용해서 insert sql 구문 만들고 실행할수 있는 자바프로그램 생성
			 String sql="insert into member(id,pass,name,date) values(?,?,?,?)";
			 PreparedStatement pstmt=con.prepareStatement(sql);
			 pstmt.setString(1, mb.getId());  //parameterIndex ? 물음표 순서 ,값저장된 변수
			 pstmt.setString(2, mb.getPass());
			 pstmt.setString(3, mb.getName());
			 pstmt.setTimestamp(4, mb.getDate());
			 
			 //pstmt.setInt(5, age);
			 //pstmt.setString(6, gender);
			 //pstmt.setString(7, email);
			
			 //4단계 - sql 실행 (insert, update, delete)
			 pstmt.executeUpdate();
			
		} catch (Exception e) {
			// 예외발생시 출력
			e.printStackTrace(); // 에러메시지 대신 띄워주는 코드
			
		}finally {
			// 예외상관없이 처리됨
		}
		
		
		
		

		
		
		
	}

	
	public MemberBean getMember(String id) {
		// 처음에 기억장소 안만들고 있다가 id가 있으면 기억장소 만들기
		// 지금은 id값이 있는지 없는지 모르기때문에 선언만하고 기억장소는 만들지 않음
		MemberBean mb = null;		// 참조형의 초기값 
		try {
			 // 1단계 - JDBC프로그램안에 Driver 프로그램 가져오기
			 Class.forName("com.mysql.jdbc.Driver");
			 // 2단계 - DriverManager 자바프로그램이 Driver 프로그램을 가지고 디비서버 접속
			 //        => 접속정보 저장
			 String dbUrl="jdbc:mysql://localhost:3306/jspdb1";
			 String dbUser="jspid";
			 String dbPass="jsppass";
			 Connection con=DriverManager.getConnection(dbUrl, dbUser, dbPass);
			 // 3단계 - 접속정보를 이용해서 select sql 구문 만들고 실행할수 있는 자바프로그램 생성
			 String sql="select * from member where id=?";
			 PreparedStatement pstmt=con.prepareStatement(sql);
			 pstmt.setString(1, id);
			 // 4단계 - sql구문 실행(select) => 결과 저장
			 ResultSet rs=pstmt.executeQuery();
			 // 5단계 - 결과 저장 => 출력
			 // rs.next() 다음행이동 했을때 데이터가 있으면  true / 데이터가 없으면 false
			 if(rs.next()){  //id정보가 db에 있으면
				 //memberBean의 데이터를 담아야함..
				 // mb 객체 생성
				 mb = new MemberBean(); //기억장소 할당 
				 
				 // mb set 메서드 호출  rs.get()에 저장 디비에서 가져온값 rs.getSTring("id")
				 // mb.id=rs.getString("id"); 이렇게 써야하지만 Private으로 막아놨기 때문에 아래와 같이 씀
				 mb.setId(rs.getString("id"));
				 mb.setPass(rs.getString("pass"));
				 mb.setName(rs.getString("name"));
				 mb.setDate(rs.getTimestamp("date"));
 				 
			 }
			 
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			//마무리
		}
				
		return mb; //리턴은 항상 try-catch 다음 맨마지막!
				
	}//getMember() 메서드 끝
	
	
} // MemberDAO 클래스 끝

