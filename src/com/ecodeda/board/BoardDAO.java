package com.ecodeda.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.ecodeda.board.BoardBean;

public class BoardDAO {
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
	public void insertBoard(BoardBean bb){
		//글번호를 저장하는 변수 생성
		int num = 0; 
		try {
			getCon();
			sql = "select max(bno) from ecod_board";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()){ 
				num = rs.getInt(1)+1;
			}
			//System.out.println("글번호 : "+num);
			sql = "insert into ecod_board values ("
					+"?,?,?,?,?,"
					+"?,?,?,?,now(),"
					+"?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);//bno는 가지고있는게 아니라 계산해서 만든것이므로 num사용
			pstmt.setString(2, bb.getEmail());
			pstmt.setString(3, bb.getPw());
			pstmt.setString(4, bb.getSubject());
			pstmt.setString(5, bb.getContent());
			pstmt.setInt(6, 0);//조회수는 글쓰지마자 올라가지않는다. 글쓰는 당시에는 조회수가 0이니까 초기화한다.
			pstmt.setInt(7, num);//답변글 그룹번호이므로 일반글번호와 동일하다.
			pstmt.setInt(8, 0);//답변글 들여쓰기(처음 작성하는 일반 글의 들여쓰기는 0이므로 초기화한다)
			pstmt.setInt(9, 0);//답변글순서(처음 작성하는 일반글이므로 일반글 제일위쪽(0)으로 초기화한다)
			pstmt.setString(10, bb.getFile());
			pstmt.executeUpdate();
			System.out.println("게시판글쓰기 성공");
		} catch (Exception e) {
			System.out.println("게시판글쓰기 실패");
			e.printStackTrace();
		} finally {
			//자원해제
			closeDB();
		}
	} //insertBoard메서드닫음
	
	//게시글 수 세는 메서드 구현
	public int getBoardCount(){
		int count = 0;
		try {
			getCon();
			sql = "select count(*) from ecod_board";
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
	public ArrayList getBoardList(){
			//가변길이 배열 생성
			ArrayList boardList = new ArrayList(); 
		
			try {
				getCon();
				//정렬(최신글이 가장 위쪽으로 보이게) : re_ref(그룹번호) 내림차순
				sql = "select * from ecod_board order by re_ref desc";
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while(rs.next()){
					BoardBean bb = new BoardBean();
					bb.setBno(rs.getInt("bno"));
					bb.setContent(rs.getString("content"));
					bb.setDate(rs.getDate("date"));
					bb.setFile(rs.getString("file"));
					
					bb.setEmail(rs.getString("email"));
					bb.setPw(rs.getString("pw"));
					bb.setRe_lev(rs.getInt("re_lev"));
					bb.setRe_ref(rs.getInt("re_ref"));
					bb.setRe_seq(rs.getInt("re_seq"));
					
					bb.setReadcount(rs.getInt("readcount"));
					bb.setSubject(rs.getString("subject"));
					//여기까지가 한 행의 데이터를 저장한 것임. while로 모든 행을 반복
					
					//가변배열(ArrayList)에 위의 데이터 저장
					//즉 배열 한칸에 회원 1명의 정보를 저장함.
					boardList.add(bb); //업캐스팅
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				closeDB();
			}
			return boardList;
		}//getBoardcontent닫기
	
	//DB에서 게시글 전체 가져오는데 페이징처리한 메서드 구현 (메서드 오버로딩)
	public ArrayList getBoardList(int startRow, int pageSize){
		//가변길이 배열 생성
		ArrayList boardList = new ArrayList(); 
	
		try {
			//1. 디비연결
			getCon();
			//2. sql작성, pstmt
			//게시판의 데이터 목록중에서 10개씩 정렬해서 가져오기
			//re_ref(그룹번호) 내림차순 + re_seq(답글순서결정)오름차순으로 정렬
			//데이터 짤라서 가져오기 limit 시작행-1, 페이지갯수 => 해당 위치부터 개수만큼 가져오기
			sql = "select * from ecod_board order by re_ref desc,re_seq asc "
					+"limit ?,?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startRow-1);
			pstmt.setInt(2, pageSize);
			//3. 실행 -> rs저장
			rs = pstmt.executeQuery();
			//4. 데이터처리
			//정보의 갯수가 몇개인지 모르기때문에 while 반복문을 사용
			while(rs.next()){
				//4-1.BoardBean 객체생성해서 그 안에 rs데이터 저장
				BoardBean bb = new BoardBean();
				bb.setBno(rs.getInt("bno"));
				bb.setContent(rs.getString("content"));
				bb.setDate(rs.getDate("date"));
				bb.setFile(rs.getString("file"));
				
				bb.setEmail(rs.getString("email"));
				bb.setPw(rs.getString("pw"));
				bb.setRe_lev(rs.getInt("re_lev"));
				bb.setRe_ref(rs.getInt("re_ref"));
				bb.setRe_seq(rs.getInt("re_seq"));
				
				bb.setReadcount(rs.getInt("readcount"));
				bb.setSubject(rs.getString("subject"));
				//여기까지가 한 행의 데이터를 저장한 것임. while로 모든 행을 반복
				
				//가변배열(ArrayList)에 위의 데이터 저장
				//즉 배열 한칸에 회원 1명의 정보를 저장함.
				boardList.add(bb); //업캐스팅
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return boardList;
	}
	
	//조회수1 증가
	public void updateReadCount(int bno){
		try {
			//디비연결
			getCon();
			//sql작성
			//select를 안하는 이유? 기존의 데이터를 굳이 가져올 필요가 없기 때문
			sql = "update ecod_board set readcount=readcount+1 where bno=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bno);
			//실행
			pstmt.executeUpdate();	
			System.out.println("조회수 1증가 완료");
		} catch (Exception e) {
			System.out.println("조회수 1증가 실패");
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
	}
	
	//글 정보를 가져오는 메서드구현
	public BoardBean getBoard(int bno){
		 //rs에 데이터가 없으면 객체생성할 필요가 없음. 따라서 객채생성안하고 null함.
		BoardBean bb = null;
		try {
			//1. 디비연결
			getCon();
			//2. sql작성, pstmt
			//sql = "select * from itwill_board";
			sql = "select * from ecod_board where bno=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bno);
			//3. 실행 -> rs저장
			rs = pstmt.executeQuery();
			//4. 데이터처리
			if(rs.next()){
				//4-1.BoardBean 객체생성해서 그 안에 rs데이터 저장
				// 글내용에서 보이지 않는 컴럼들도 만들어야할까?
				// 만들기를 추천함 why? 매개변수인 bno자체가 pk를 가졌다.
				// 지금뿐만아니라 다음 기능이 필요할때 불러와서 사용할 수 있다.
				// 재사용성
				bb = new BoardBean(); 
				bb.setBno(rs.getInt("bno"));
				bb.setContent(rs.getString("content"));
				bb.setDate(rs.getDate("date"));
				bb.setFile(rs.getString("file"));
				
				bb.setEmail(rs.getString("email"));
				bb.setPw(rs.getString("pw"));
				bb.setRe_lev(rs.getInt("re_lev"));
				bb.setRe_ref(rs.getInt("re_ref"));
				bb.setRe_seq(rs.getInt("re_seq"));
				
				bb.setReadcount(rs.getInt("readcount"));
				bb.setSubject(rs.getString("subject"));
			}
			System.out.println("해당 글 저장 완료");
			//System.out.println(bb);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}	
		return bb;
	}//getBoard닫음
	
	//글 수정 메서드구현
	public int updateBoard(BoardBean bb){
		int result = 0;
		try {
			getCon();
			sql = "select pw from ecod_board where bno=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bb.getBno());
			rs = pstmt.executeQuery();
			if(rs.next()){
				//비번비교 후 일치하면 update 쿼리실행
				if(bb.getPw().equals(rs.getString("pw"))){
					sql="update ecod_board set email=?, subject=?, content=? where bno=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, bb.getEmail());
					pstmt.setString(2, bb.getSubject());
					pstmt.setString(3, bb.getContent());
					pstmt.setInt(4, bb.getBno());					
					pstmt.executeUpdate();
					System.out.println("글수정완료 - 비번일치");
					//리컨값 변경
					result =1;
				}else{//비번불일치
					System.out.println("글수정실패 - 비번불일치");
					result = 0;
				}
			}else{
				System.out.println("글수정실패 - 해당글없음");
				result = -1;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return result;
	}//updateBoard닫음
	
	//글삭제메서드구현
	public int deleteBoard(int bno, String pw){
		int result = -1;
		
		try {
			getCon();
			sql="select pw from ecod_board where bno=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bno);
			rs = pstmt.executeQuery();
			if(rs.next()){
				if(pw.equals(rs.getString("pw"))){
					sql="delete from ecod_board where bno=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, bno);
					pstmt.executeUpdate();
					System.out.println("글삭제 성공");
					result = 1;
				}else{
					result = 0;
					System.out.println("글삭제 중 비번오류");
				}
			}else{
				result = -1;
				System.out.println("글삭제 중 select오류");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return result;
	}//deleteBoard()닫음
	
	//답글쓰기메서드 구현
	public void reInsertBoard(BoardBean bb){
		//1.지역변수생성
		int num = 0;
		//2. 디비연결
		try {
			getCon();
			sql = "select max(bno) from ecod_board";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()){
				num = rs.getInt(1)+1;
			}
			System.out.println("답글 번호 : "+num);
			//2-2. 답글 순서 재배치
			//re_ref(같은 그룹기준)으로 re_seq값이 기존의 값보다 큰 값이 있을경우 seq값을 1증가시킴
			sql = "update ecod_board set re_seq=re_seq+1 "
					+ "where re_ref=? and re_seq>?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bb.getRe_ref());
			pstmt.setInt(2, bb.getRe_seq());
			pstmt.executeUpdate();		
			
			//2-3. 답글 추가 동작
			sql="insert into ecod_board "
					+ "values(?,?,?,?,?"
					+ ",?,?,?,?,now()"
					+ ",?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);//bno는 가지고있는게 아니라 계산해서 만든것이므로 num사용
			pstmt.setString(2, bb.getEmail());
			pstmt.setString(3, bb.getPw());
			pstmt.setString(4, bb.getSubject());
			pstmt.setString(5, bb.getContent());
			pstmt.setInt(6, bb.getReadcount());
			pstmt.setInt(7, bb.getRe_ref()); //기존 원글의 그룹번호와 동일
			pstmt.setInt(8, bb.getRe_lev()+1); // 기존의 값 + 1
			pstmt.setInt(9, bb.getRe_seq()+1); // 기존의 값 + 1
			pstmt.setString(10, bb.getFile());
			pstmt.executeUpdate();
			System.out.println("답글쓰기 성공");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}	
	} //reInsertBoard닫음
	
}//BoardDAO클래스닫음
