package com.ecodeda.review2;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.ecodeda.board.BoardBean;
import com.ecodeda.member.MemberBean;

public class ReviewDAO {
	Connection con = null;
	String sql = "";
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	//디비연결
	private Connection getCon() throws Exception {
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/ecodaDB");
		con = ds.getConnection();	
		System.out.println("디비연결성공");
		return con;
	} 
	
	//자원해제 메서드 구현
	public void closeDB(){
		try{
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(con != null) con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} 
	}//closeDB닫음
	
	//글쓰기 메서드 구현
	public void insertReview(ReviewBean rb){
		//글번호를 저장하는 변수 생성
		int num = 0; 
		try {
			getCon();
			sql = "select max(bno) from ecod_review";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()){ 
				num = rs.getInt(1)+1;
			}
			//System.out.println("글번호 : "+num);
			sql = "insert into ecod_review values (?,?,?,?,?,?,now(),?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);//bno는 가지고있는게 아니라 계산해서 만든것이므로 num사용
			pstmt.setString(2, rb.getEmail());
			pstmt.setString(3, rb.getPw());
			pstmt.setString(4, rb.getName());
			pstmt.setString(5, rb.getSubject());
			pstmt.setString(6, rb.getContent());
			pstmt.setString(7, rb.getFile());
			pstmt.executeUpdate();
			System.out.println("수강후기쓰기 성공");
		} catch (Exception e) {
			System.out.println("수강후기쓰기 실패");
			e.printStackTrace();
		} finally {
			closeDB();
		}
	} //insertBoard메서드닫음
	
	//게시글 수 세는 메서드 구현
	public int getReviewCount(){
		int count = 0;
		try {
			getCon();
			sql = "select count(*) from ecod_review";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()){
				count = rs.getInt(1); // 데이터가 없으면 null이고 return 0값이 된다.
				System.out.println("게시판 글 갯수 확인 :"+ count);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return count;
	}//getBoardCount닫기
	
	//DB에서 게시글 전체 가져오는 메서드 구현
	public ArrayList getReviewList(){
			//가변길이 배열 생성
			ArrayList reviewList = new ArrayList(); 
		
			try {
				getCon();
				//정렬(최신글이 가장 위쪽으로 보이게) : re_ref(그룹번호) 내림차순
				sql = "select * from ecod_review order by bno desc";
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while(rs.next()){
					ReviewBean rb = new ReviewBean();
					rb.setBno(rs.getInt("bno"));
					rb.setEmail(rs.getString("email"));
					rb.setPw(rs.getString("pw"));
					rb.setName(rs.getString("name"));
					rb.setSubject(rs.getString("subject"));
					rb.setContent(rs.getString("content"));
					rb.setDate(rs.getDate("date"));
					rb.setFile(rs.getString("file"));
					//여기까지가 한 행의 데이터를 저장한 것임. while로 모든 행을 반복
					
					//가변배열(ArrayList)에 위의 데이터 저장
					//즉 배열 한칸에 회원 1명의 정보를 저장함.
					reviewList.add(rb); //업캐스팅
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				closeDB();
			}
			return reviewList;
		}//getReviewList닫기
	
	//DB에서 게시글 전체 가져오는데 페이징처리한 메서드 구현 (메서드 오버로딩)
	public ArrayList getReviewList(int startRow, int pageSize){
		//가변길이 배열 생성
		ArrayList reviewList = new ArrayList(); 
	
		try {
			getCon();
			sql = "select r.bno, r.email, r.pw, m.name, r.subject, r.content, r.date, r.file "
					+ "from ecod_review r "
					+ "inner join ecod_member m "
					+ "on m.email = r.email "
					+ "order by bno desc "
					+ "limit ?,?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startRow-1);
			pstmt.setInt(2, pageSize);
			//3. 실행 -> rs저장
			rs = pstmt.executeQuery();
			//4. 데이터처리
			//정보의 갯수가 몇개인지 모르기때문에 while 반복문을 사용
			while(rs.next()){
				//4-1.BoardBean 객체생성해서 그 안에 rs데이터 저장
				ReviewBean rb = new ReviewBean();
				rb.setBno(rs.getInt("bno"));
				rb.setEmail(rs.getString("email"));
				rb.setPw(rs.getString("pw"));
				rb.setName(rs.getString("name"));
				rb.setSubject(rs.getString("subject"));
				rb.setContent(rs.getString("content"));
				rb.setDate(rs.getDate("date"));
				rb.setFile(rs.getString("file"));
				reviewList.add(rb); //업캐스팅
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return reviewList;
	}
	
	//글 정보를 가져오는 메서드구현
	public ReviewBean getReview(int bno){
		 //rs에 데이터가 없으면 객체생성할 필요가 없음. 따라서 객채생성안하고 null함.
		ReviewBean rb = null;
		try {
			getCon();
			sql = "select * from ecod_review where bno=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bno);
			rs = pstmt.executeQuery();
			if(rs.next()){
				rb = new ReviewBean(); 
				rb.setBno(rs.getInt("bno"));
				rb.setEmail(rs.getString("email"));
				rb.setPw(rs.getString("pw"));
				rb.setName(rs.getString("name"));
				rb.setSubject(rs.getString("subject"));
				rb.setContent(rs.getString("content"));
				rb.setDate(rs.getDate("date"));
				rb.setFile(rs.getString("file"));
			}
			System.out.println("수강후기 저장 완료");
			//System.out.println(rb);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}	
		return rb;
	}//getBoard닫음
	
	//글 수정 메서드구현
	public int updateReview(ReviewBean rb){
		int result = 0;
		try {
			getCon();
			sql = "select pw from ecod_review where bno=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, rb.getBno());
			rs = pstmt.executeQuery();
			if(rs.next()){
				//비번비교 후 일치하면 update 쿼리실행
				if(rb.getPw().equals(rs.getString("pw"))){
					sql="update ecod_review set subject=?, content=?, file=? where bno=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, rb.getSubject());
					pstmt.setString(2, rb.getContent());
					pstmt.setString(3, rb.getFile());
					pstmt.setInt(4, rb.getBno());					
					pstmt.executeUpdate();
					System.out.println("수강후기수정완료 - 비번일치"+rs);
					//리컨값 변경
					result =1;
				}else{//비번불일치
					System.out.println("수강후기수정실패 - 비번불일치"+rs);
					result = 0;
				}
			}else{
				System.out.println("수강후기수정실패 - 해당글없음"+", bno:"+rb.getBno());
				result = -1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return result;
	}//updateReview닫음
	
	//글삭제메서드구현
	public int deleteReview(int bno, String pw){
		int result = -1;
		
		try {
			getCon();
			sql="select pw from ecod_review where bno=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bno);
			rs = pstmt.executeQuery();
			if(rs.next()){
				if(pw.equals(rs.getString("pw"))){
					sql="delete from ecod_review where bno=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, bno);
					pstmt.executeUpdate();
					System.out.println("수강후기삭제 성공");
					result = 1;
				}else{
					result = 0;
					System.out.println("수강후기삭제 중 비번오류");
				}
			}else{
				result = -1;
				System.out.println("수강후기삭제 중 select오류");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return result;
	}//deleteReview()닫음
	
}//ReviewDAO클래스닫음
