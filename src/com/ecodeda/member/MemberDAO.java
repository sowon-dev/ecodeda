package com.ecodeda.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class MemberDAO {
	Connection con = null;
	String sql = "";
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	private Connection getCon() throws Exception {
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/ecodaDB");
		con = ds.getConnection();	
		System.out.println("디비연결성공");
		return con;
	} 
	
	//자원해제메서드
	public void closeDB(){
		try{
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(con != null) con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} 
	}

	//회원가입메서드
	public void insertMember(MemberBean mb){
		try {
			con = getCon();
			sql = "insert into ecod_member values (?,?,?,?,?,now())";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mb.getEmail());
			pstmt.setString(2, mb.getPw());
			pstmt.setString(3, mb.getName());
			pstmt.setString(4, mb.getAddr());
			pstmt.setString(5, mb.getPhone());
			pstmt.executeUpdate();
			System.out.println("insertMember성공");
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			System.out.println("insertMember실패");
			e.printStackTrace();
		} finally {
			closeDB();
		}
	}//insertMember메서드닫음
		
	//회원가입시 아이디중복체크(jsp이용)
	public int joinIdCheck(String email){
		int result = -1;
		try {
			con = getCon();
			sql = "select email from ecod_member where email=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			if(rs.next()){	
				result = 0;
			}else{
				result = 1;
			}
			System.out.println("아이디 중복체크결과 : "+result);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return result;
	}//joinIdCheck 메서드닫음
	
	//로그인메서드
	public int idCheck(String email, String pw){
		int result = -1;
		
		try {
			con = getCon();
			sql = "select pw from ecod_member where email=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			if(rs.next()){
				if(pw.equals(rs.getString("pw"))){
					result = 1;
				}else{
					result = 0;
				}
			}			
			System.out.println("로그인메서드 : "+result);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return result;
	}//idCheck메서드 닫음
	
	//회원정보 가져오는 메서드 getMember:회원정보 전부 리턴 -> 테이블에 추가
	public MemberBean getMember(String email){
		MemberBean mb = null; //객체 레퍼런스 생성
		try{
		con = getCon();
		sql = "select * from ecod_member where email=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, email);
		rs = pstmt.executeQuery();
			if(rs.next()){
				mb = new MemberBean();
				mb.setEmail(rs.getString("email"));
				mb.setPw(rs.getString("pw"));
				mb.setName(rs.getString("name"));
				mb.setAddr(rs.getString("addr"));
				mb.setPhone(rs.getString("phone"));
				mb.setReg_date(rs.getTimestamp("reg_date"));
				System.out.println("getMember메서드완료");
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}catch (Exception e){
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return mb;
	}//getMember닫힘
	
	//회원정보 수정 메서드
	public int updateMember(MemberBean mb){
		int result = -1;

		try {
			con = getCon();
			sql = "select pw from ecod_member where email=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mb.getEmail());
			System.out.println("sql 이메일 : "+ mb.getEmail());
			rs = pstmt.executeQuery();
			if(rs.next()){//DB에 있는 회원
				if(mb.getPw().equals(rs.getString("pw"))){//비번일치
					//비번일치시 정보수정 작업
					sql = "update ecod_member set name=?,addr=?,phone=? where email=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, mb.getName());
					pstmt.setString(2, mb.getAddr());
					pstmt.setString(3, mb.getPhone());
					pstmt.setString(4, mb.getEmail());

					pstmt.executeUpdate();
					System.out.println("회원정보수정성공");
					result = 1;
				}else{
					result = 0;
					System.out.println("아디일치,비번불일치 - 회원정보수정실패");
				}
			}else{ //DB에 없는 회원
				result = -1;
				System.out.println("존재하지않는아이디 - 회원정보수정실패");
			}
			System.out.println("updateMember result: "+result);
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			closeDB();
		}
		return result;
	}//updateMember닫힘
	
	//회원탈퇴 delete구현
	public int deleteMember(String email, String pw){
		int result = -1;
		try {
			//7-1. DB연결메서드 불러오기
			con = getCon();
			//7-2. SQL & pstmt 생성
			sql = "select pw from ecod_member where email=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email);
			//7-3. 실행 -> rs저장
			rs = pstmt.executeQuery();
			//7-4. 데이터처리 : DB에 있는 회원인 경우 삭제, 아닌 경우 에러
			if(rs.next()){
				if(pw.equals(rs.getString("pw"))){
					//7-5. 비번일치하면 정보삭제 작업
					//7-5-1. SQL 구문작성 & pstmt 생성
					sql = "delete from ecod_member where email=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, email);
					pstmt.executeUpdate();
					result = 1;
					System.out.println("회원삭제성공-아디일치,비번일치");
				}else{
					result = 0;
					System.out.println("회원삭제실패-아디일치,비번불일치");
				}
			}else{
				result = -1;
				System.out.println("회원삭제실패-아이디불일치");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return result;		
	}//delete닫힘
	
	//임시비밀번호발급
	public int findPw(String email, String name, String phone){
		int result = -1;
		try {
			con = getCon();
			sql = "select phone from ecod_member where email=? and name=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email);
			pstmt.setString(2, name);
			rs = pstmt.executeQuery();
			if(rs.next()){
				if(phone.equals(rs.getString("phone"))){
					result = 1;
				}else{
					result = 0;
				}
			}			
			System.out.println("임시비밀번호발급 : "+result);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return result;
	}//end of findPw
	
	//임시비밀번호로 변경 
	public void updatePw(String email, String rNum){
		try {
			con = getCon();
			sql = "select pw from ecod_member where email=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			if(rs.next()){//DB에 있는 회원
				//비번일치시 정보수정 작업
				sql = "update ecod_member set pw=? where email=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, rNum);
				pstmt.setString(2, email);
				pstmt.executeUpdate();
				System.out.println("임시비밀번호로 DB변경");
			}else{ //DB에 없는 회원
				System.out.println("존재하지않는아이디");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			closeDB();
		}
	}//updatePw닫힘
	
	//유저가 직접 비밀번호 변경
	public void updatePwbyUser(String email, String pw){
		try {
			con = getCon();
			//비번일치시 정보수정 작업
			sql = "update ecod_member set pw=? where email=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, pw);
			pstmt.setString(2, email);
			pstmt.executeUpdate();
			System.out.println("비밀번호변경 updatePwbyUser 성공");
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			closeDB();
		}
	}//updatePwbyUser닫힘
	
	//8.getMemberList구현
	public ArrayList getMemberList(){
		
		//가변길이 배열 생성
		ArrayList memberList = new ArrayList(); 
		
		try {
			con = getCon();
			sql = "select * from ecod_member";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()){
				MemberBean mb = new MemberBean();//1.MemberBean객체생성
				mb.setEmail(rs.getString("email"));
				mb.setPw(rs.getString("pw"));
				mb.setName(rs.getString("name"));
				mb.setAddr(rs.getString("addr"));
				mb.setPhone(rs.getString("phone"));
				mb.setReg_date(rs.getTimestamp("reg_date"));
				//여기까지가 한 행의 데이터를 저장한 것임. while로 모든 행을 반복
				
				//가변배열(ArrayList)에 위의 데이터 저장
				//즉 배열 한칸에 회원 1명의 정보를 저장함.
				memberList.add(mb); //업캐스팅 (MemberBean -> Object)
				//System.out.println(memberList);
			}
			System.out.println("정보검색완료");			
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			closeDB();
		}
		return memberList;
	}//getMemberList닫힘
	
}//MemberDAO닫음
