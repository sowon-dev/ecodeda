package com.ecodeda.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

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
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/ecodDB");
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
			sql = "insert into ecod_member values (?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mb.getEmail());
			pstmt.setString(2, mb.getPw());
			pstmt.setString(3, mb.getName());
			pstmt.setString(4, mb.getAddr());
			pstmt.setString(5, mb.getPhone());
			pstmt.setTimestamp(6, mb.getReg_date());
			
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
	
}//MemberDAO닫음
