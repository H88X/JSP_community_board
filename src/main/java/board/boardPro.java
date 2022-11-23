package board;

import java.sql.*;


import java.util.ArrayList;
import java.util.List;

import javax.naming.*;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import board.boardBean;



public class boardPro {
	private static boardPro instance = new boardPro();
	public static boardPro getInstance() {
		return instance;
	}
	
	
	private boardPro() {}
	
	   public Connection getConnection() throws Exception {
		      Connection conn = null;	       
		      try {

		    	Context initCtx = new InitialContext();
		  		Context envCtx = (Context) initCtx.lookup("java:comp/env");
		  		DataSource ds = (DataSource)envCtx.lookup("jdbc/comunity");
		  		return ds.getConnection();
		  		
		  		
		      } catch (Exception sqlerr) {
		    	 System.out.println("데이터베이스 연결 오류! " + sqlerr.getMessage());
		      }
		      return conn;
		   }	
			
	   // 데이터베이스 연결 종료(close database) - ResultSet, Statement, Connection 순
	   public static void resourceClose(ResultSet rset, Statement stmt, Connection conn) {

	      try {
	         if (rset != null) rset.close();
	         if (stmt != null) stmt.close();
	         if (conn != null) conn.close();
	      } catch (SQLException sqlerr) {
	     	 System.out.println("데이터베이스 종료 오류! " + sqlerr.getMessage());
	      }	   

	   }
	   
	   //두개의 이름이 같은것은 메소드 오버로딩이다 매개변수가 3개주어질떄 위에거 2개일떄 아래거 실행
	  
	   public static void resourceClose(Statement stmt, Connection conn) {

		      try {
		         if (stmt != null) stmt.close();
		         if (conn != null) conn.close();
		      } catch (SQLException sqlerr) {
		     	 System.out.println("데이터베이스 종료 오류! " + sqlerr.getMessage());
		      }	   

		   }   
	   
	   public String getDate() {
		   Connection conn = null;
		   PreparedStatement ps = null;
		   ResultSet rs = null;
		   String sql = null;
		   sql = "select now()";
			try {
				conn = getConnection();
				ps = conn.prepareStatement(sql);
				rs = ps.executeQuery();
				if(rs.next()) {
					return rs.getString(1);
				}
			}catch (Exception e) {
				e.printStackTrace();
			}
			return ""; //데이터베이스 오류
		}
		
		//게시글 번호 부여 메소드
		public int getNext() {
			//현재 게시글을 내림차순으로 조회하여 가장 마지막 글의 번호를 구한다
			Connection conn = null;
			PreparedStatement ps = null;
			ResultSet rs = null;
			try {
				conn = getConnection();
				String sql = "select number from board order by number desc";
				ps = conn.prepareStatement(sql);
				rs = ps.executeQuery();
				if(rs.next()) {
					return rs.getInt(1) + 1;
				}
				return 1; //첫 번째 게시물인 경우
			}catch (Exception e) {
				e.printStackTrace();
			}
			return -1; //데이터베이스 오류
		}
		
		//글쓰기 메소드
		public int write(boardBean board , String id) {
			 Connection conn = null;
			 PreparedStatement ps = null;
			 
			try {
				conn = getConnection();
				String sql = "insert into board values(?, ?, ?, ?, ?, ? )";
				ps = conn.prepareStatement(sql);
				ps.setInt(1, getNext());
				ps.setString(2,board.getSubject());
				ps.setString(3, board.getTitle());
				ps.setString(4, board.getContent());
				ps.setString(5, id);
				ps.setString(6, getDate());
				return ps.executeUpdate();
			}catch (Exception e) {
				e.printStackTrace(); 
			}
			return -1; //데이터베이스 오류
		}
	   
	   
		 public ArrayList<boardBean> getboard(){
				ArrayList<boardBean> list = new ArrayList<boardBean>();
				
				Connection conn = null;
				PreparedStatement ps = null;
				ResultSet rs = null;
				
				try {
					conn = getConnection();
					String sql = "select * from board ORDER BY number desc";
					 ps = conn.prepareStatement(sql);
					 rs = ps.executeQuery();
					 if(rs.next()) { 
						 do {
							 boardBean bb = new boardBean();
							 bb.setNumber(rs.getInt("number"));
							 bb.setSubject(rs.getString("subject"));
							 bb.setTitle(rs.getString("title"));
							 bb.setContent(rs.getString("content"));
							 bb.setId(rs.getString("id"));
							 bb.setDate(rs.getString("date"));
							 list.add(bb);
							 
						 }while(rs.next());
					 }
				}
				catch(Exception e) {
					e.printStackTrace();
				}
				finally {
					 resourceClose(rs,ps,conn);
				}
				return list;
		 }
		 
		 public boardBean boarddetail (int number) {  
			 Connection conn = null;
			 PreparedStatement ps = null;
			 ResultSet rs = null; 
			 boardBean bd  = new boardBean();
			 
			try {
				conn = getConnection();
				String sql = "select * from board where number = ?";
				ps = conn.prepareStatement(sql);
				ps.setInt(1, number);
				rs = ps.executeQuery();
				 
				if(rs.next()) {
					 bd.setNumber(rs.getInt("number")); 
					 bd.setSubject(rs.getString("subject"));
					 bd.setTitle(rs.getString("title"));
					 bd.setContent(rs.getString("content"));
					 bd.setId(rs.getString("id"));
					 bd.setDate(rs.getString("date"));
					 return bd;
				} 
				
			}catch (Exception e) {
				e.printStackTrace(); 
			}
			finally {
				 resourceClose(rs,ps,conn);
			}
			 return null;
		}
		 
		 public int writeupdate(boardBean bb) {
				Connection conn = null;
				PreparedStatement ps = null;
				int x = 0;
				
				try {
					conn = getConnection();
					 String sql = "update board set subject=?,title=?,content=?,id=?,date=? where number=?";
				     ps = conn.prepareStatement(sql);        
				     ps.setString(1,bb.getSubject());
				     ps.setString(2,bb.getTitle() );
				     ps.setString(3,bb.getContent() );
				     ps.setString(4,bb.getId() );
				     ps.setString(5,bb.getDate() );
				     ps.setInt(6,bb.getNumber()); 
				     x = ps.executeUpdate();  
				    
				}
				catch(Exception e) {
					e.printStackTrace();
				}
				finally {
				resourceClose(ps, conn);
					
				}
				return x;
			} 
		 
		 public void deleteboard(int number) {
			   Connection conn = null;
			   PreparedStatement ps = null;
			
			   
			   try {
					conn = getConnection();
					String sql = "delete from board where number=?";
					ps = conn.prepareStatement(sql);
					ps.setInt(1, number);
					ps.executeUpdate();
				   
			   }catch(Exception e){
				   e.printStackTrace();
			   }
			   finally {
				   resourceClose(ps, conn);
			   }
		
		   }
		 
		 public List<boardBean> getcategory(String subject)  {
				Connection conn = null;
				PreparedStatement ps = null;
				ResultSet rs = null;
				List<boardBean> boardList=null;
				
				try {
					conn = getConnection();			
					
					String sql = "select * from board where subject = ? order by date desc";
					
					
						ps = conn.prepareStatement(sql);
						ps.setString(1, subject);
					
						rs = ps.executeQuery();
					
					if (rs.next()) {
						boardList = new ArrayList<boardBean>();
						do{
							boardBean board= new boardBean();			
							board.setNumber(rs.getInt("number")); 
							board.setSubject(rs.getString("subject"));
							board.setTitle(rs.getString("title"));
							board.setContent(rs.getString("content"));
							board.setId(rs.getString("id"));
							board.setDate(rs.getString("date"));			
							boardList.add(board);
						}while(rs.next());
					}
				} catch(Exception ex) {
					ex.printStackTrace();
				} finally {
					resourceClose(rs, ps, conn);
				}
				return boardList;
			}
		 
		 public ArrayList<boardBean> getboardpage(int pageNumber){
				ArrayList<boardBean> list = new ArrayList<boardBean>();
				
				Connection conn = null;
				PreparedStatement ps = null;
				ResultSet rs = null;
				
				try {
					conn = getConnection();
					String sql = "select * from board where number <? order by number desc LIMIT 10";
					 ps = conn.prepareStatement(sql);
					 ps.setInt(1, getNext() - (pageNumber -1 ) * 10);
					 rs = ps.executeQuery();
					 while(rs.next()) { 
						  {
							 boardBean bb = new boardBean();
							 bb.setNumber(rs.getInt("number"));
							 bb.setSubject(rs.getString("subject"));
							 bb.setTitle(rs.getString("title"));
							 bb.setContent(rs.getString("content"));
							 bb.setId(rs.getString("id"));
							 bb.setDate(rs.getString("date"));
							 list.add(bb);
							 
						 }
					 }
				}
				catch(Exception e) {
					e.printStackTrace();
				}
				finally {
					 resourceClose(rs,ps,conn);
				}
				return list;
		 }
		 
		 
		 public boolean nextpage(int pageNumber) {
			
				Connection conn = null;
				PreparedStatement ps = null;
				ResultSet rs = null;
				
				try {
					conn = getConnection();
					String sql = "select * from board where number < ?";
					 ps = conn.prepareStatement(sql);
					 ps.setInt(1, getNext() - (pageNumber -1 ) * 10);
					 rs = ps.executeQuery();
					 if(rs.next()) { 
						 return true;
					 }
				}
				catch(Exception e) {
					e.printStackTrace();
				}
				finally {
					 resourceClose(rs,ps,conn);
				}
				return false;
			 
		 }
		 
		 public int getCount(int number) {
			 	Connection conn = null;
				PreparedStatement ps = null;
				ResultSet rs = null;
				String SQL = "SELECT COUNT(*) FROM board WHERE number = ?";
				
				
				try {
					conn = getConnection();
					ps = conn.prepareStatement(SQL);
					ps.setInt(1, number);
					rs = ps.executeQuery();
					if (rs.next()) {	
						return rs.getInt(1);
					}
				}catch(Exception e) {
					e.printStackTrace();
				}
				return -1;
			}
		 
		 public int numberCount() { //다시
			 	Connection conn = null;
				PreparedStatement ps = null;
				ResultSet rs = null;
				int number = 0;
				String SQL = "SELECT COUNT(*) FROM board ";
				
				
				try {
					conn = getConnection();
					ps = conn.prepareStatement(SQL);
					rs = ps.executeQuery();
					if (rs.next()) {	
						number = rs.getInt(1);
						return number;
						
					}
				}catch(Exception e) {
					e.printStackTrace();
				}
				return -1;
			}
		 
		 public ArrayList<boardBean> getjspboard(){
				ArrayList<boardBean> jspboard = new ArrayList<boardBean>();
				
				Connection conn = null;
				PreparedStatement ps = null;
				ResultSet rs = null;
				
				try {
					conn = getConnection();
					String sql = "select * from board where subject=\"100\" order by number desc LIMIT 5;";
					 ps = conn.prepareStatement(sql);
					 
					 rs = ps.executeQuery();
					 while(rs.next()) { 
						  {
							 boardBean bb = new boardBean();
							 bb.setNumber(rs.getInt("number"));
							 bb.setSubject(rs.getString("subject"));
							 bb.setTitle(rs.getString("title"));
							 bb.setContent(rs.getString("content"));
							 bb.setId(rs.getString("id"));
							 bb.setDate(rs.getString("date"));
							 jspboard.add(bb);
							 
						 }
					 }
				}
				catch(Exception e) {
					e.printStackTrace();
				}
				finally {
					 resourceClose(rs,ps,conn);
				}
				return jspboard;
		 }
		 
		 public ArrayList<boardBean> getdatabaseboard(){
				ArrayList<boardBean> databaseboard = new ArrayList<boardBean>();
				
				Connection conn = null;
				PreparedStatement ps = null;
				ResultSet rs = null;
				
				try {
					conn = getConnection();
					String sql = "select * from board where subject=\"200\" order by number desc LIMIT 5;";
					 ps = conn.prepareStatement(sql);
					 
					 rs = ps.executeQuery();
					 while(rs.next()) { 
						  {
							 boardBean bb = new boardBean();
							 bb.setNumber(rs.getInt("number"));
							 bb.setSubject(rs.getString("subject"));
							 bb.setTitle(rs.getString("title"));
							 bb.setContent(rs.getString("content"));
							 bb.setId(rs.getString("id"));
							 bb.setDate(rs.getString("date"));
							 databaseboard.add(bb);
							 
						 }
					 }
				}
				catch(Exception e) {
					e.printStackTrace();
				}
				finally {
					 resourceClose(rs,ps,conn);
				}
				return databaseboard;
		 }
		 
		 public ArrayList<boardBean> getaiboard(){
				ArrayList<boardBean> aiboard = new ArrayList<boardBean>();
				
				Connection conn = null;
				PreparedStatement ps = null;
				ResultSet rs = null;
				
				try {
					conn = getConnection();
					String sql = "select * from board where subject=\"300\" order by number desc LIMIT 5;";
					 ps = conn.prepareStatement(sql);
					 
					 rs = ps.executeQuery();
					 while(rs.next()) { 
						  {
							 boardBean bb = new boardBean();
							 bb.setNumber(rs.getInt("number"));
							 bb.setSubject(rs.getString("subject"));
							 bb.setTitle(rs.getString("title"));
							 bb.setContent(rs.getString("content"));
							 bb.setId(rs.getString("id"));
							 bb.setDate(rs.getString("date"));
							 aiboard.add(bb);
							 
						 }
					 }
				}
				catch(Exception e) {
					e.printStackTrace();
				}
				finally {
					 resourceClose(rs,ps,conn);
				}
				return aiboard;
		 }
		
}
