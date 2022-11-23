package comment;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import board.boardBean;
import comment.commentBean; 

public class commentPro {
	private static commentPro instance = new commentPro();
	public static commentPro getInstance() {
		return instance;
	}
	
	
	private commentPro() {}
	
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
	   
	  
	  
	   
	   public int commentwrite(commentBean comment , int number) {
			 Connection conn = null;
			 PreparedStatement ps = null;
			 
			try {
				conn = getConnection();
				String sql = "insert into comment values(?, ?, ?, ?, ?)";
				ps = conn.prepareStatement(sql);
				ps.setInt(1, comment.getComment_number());
				ps.setInt(2,comment.getNumber());
				ps.setString(3, comment.getUser_id());
				ps.setString(4, comment.getComment_content());
				ps.setString(5, getDate());
				 System.out.println(comment.getUser_id());
				 System.out.println(comment.getComment_content());
				return ps.executeUpdate();
			}catch (Exception e) {
				e.printStackTrace();   
			}
			return -1; //데이터베이스 오류
		}
	   
	   public ArrayList<commentBean> getcomment_array (int number){
			ArrayList<commentBean> list = new ArrayList<commentBean>();
			
			Connection conn = null;
			PreparedStatement ps = null;
			ResultSet rs = null;
			
			
			try {
				conn = getConnection();
				String sql = "select * from comment where number=? ORDER BY comment_number asc ";
				ps = conn.prepareStatement(sql);
				ps.setInt(1,number);
				rs = ps.executeQuery();
				
				 if(rs.next()) { 
					 do {
						 commentBean cp = new commentBean();
						 cp.setComment_number(rs.getInt("comment_number"));
						 cp.setNumber(rs.getInt("number"));
						 cp.setUser_id(rs.getString("user_id"));
						 cp.setComment_content(rs.getString("comment_content"));
						 cp.setComment_date(rs.getString("comment_date"));
						 list.add(cp);
						 
						 
						 
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
	   
	   public void commentdelete(int comment_number) {
		   Connection conn = null;
		   PreparedStatement ps = null;
		
		   
		   try {
				conn = getConnection();
				String sql = "delete from comment where comment_number=?";
				ps = conn.prepareStatement(sql);
				ps.setInt(1, comment_number);
				ps.executeUpdate();
			   
		   }catch(Exception e){
			   e.printStackTrace();
		   }
		   finally {
			   resourceClose(ps, conn);
		   }
	
	   }
	   
	   public commentBean getcomment (int comment_number) {  
			 Connection conn = null;
			 PreparedStatement ps = null;
			 ResultSet rs = null; 
			 commentBean cb  = new commentBean();
			 
			try {
				conn = getConnection();
				String sql = "select * from comment where comment_number = ?";
				ps = conn.prepareStatement(sql);
				ps.setInt(1, comment_number);
				rs = ps.executeQuery();
				 
				if(rs.next()) {
					cb.setComment_number(rs.getInt("comment_number")); 
					cb.setNumber(rs.getInt("number"));  
					cb.setUser_id(rs.getString("user_id"));
					cb.setComment_content(rs.getString("comment_content"));
					cb.setComment_date(rs.getString("comment_date"));
					return cb;
					 
				} 
				
			}catch (Exception e) {
				e.printStackTrace(); 
			}
			finally {
				 resourceClose(rs,ps,conn);
			}
			 return null;
		}
	   
	   public int commentupdate(commentBean cb) {
			Connection conn = null;
			PreparedStatement ps = null;
			int x = 0;
			
			try {
				conn = getConnection();
				 String sql = "update comment set number=?,user_id=?,comment_content=?,comment_date=? where comment_number=?";
			     ps = conn.prepareStatement(sql);        
			     ps.setInt(1,cb.getNumber());
			     ps.setString(2,cb.getUser_id() );
			     ps.setString(3,cb.getComment_content() );
			     ps.setString(4,getDate() );
			     ps.setInt(5,cb.getComment_number ()); 
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
	   
	   

}
