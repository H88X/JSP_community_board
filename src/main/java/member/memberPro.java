package member;

import java.sql.*;
import java.util.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;





public class memberPro {
	private static memberPro instance = new memberPro();
	public static memberPro getInstance() {
		return instance;
	}
	
	
	private memberPro() {}
	
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
	   
	   public int userCheck(String id,String passwd) {
		   int x = -1;
		   Connection conn = null;
		   PreparedStatement ps = null;
		   ResultSet rs = null;
		   String sql = null;
		   try {
			   sql = "select passwd from member where id=?";
			   conn = getConnection();
			   ps = conn.prepareStatement(sql);
			   ps.setString(1,id);
			   rs = ps.executeQuery();
			   if(rs.next()) {
				   if(rs.getString("passwd").equals(passwd))
					   x=1; //인증성공
				   else
					   x=0; //비밀번호 오류
			   }
			   else
				   x= -1;  //해당 아이디가 없음
		   }
		   catch(Exception e){
			   e.printStackTrace();
		   }
		   finally {
			   resourceClose(rs,ps,conn);
		   }
		   return x;
	   }
	   
	   public void insertMember(memberBean member) { //member은 자바빈에서 가져옴
		   Connection conn = null;
		   PreparedStatement ps = null;
		   String sql = null;
		   try {
			   sql = "insert into member values(?,?,?,?,?)";
			   conn = getConnection();
			   ps = conn.prepareStatement(sql);
			   ps.setString(1, member.getId());
			   ps.setString(2, member.getPasswd());
			   ps.setString(3, member.getName());
			   ps.setString(4, member.getEmail());
			   ps.setString(5, member.getNickname());
			   ps.executeUpdate();
		   }
		   catch(Exception e){
			   e.printStackTrace();
		   }
		   finally {
			   resourceClose(ps,conn);
		   }
		   
	   }
	   
	   public ArrayList<memberBean> getmember(){
			ArrayList<memberBean> mbb = new ArrayList<memberBean>();
			
			Connection conn = null;
			PreparedStatement ps = null;
			ResultSet rs = null;
			
			try {
				conn = getConnection();
				String sql = "select * from member ORDER BY id";
				 ps = conn.prepareStatement(sql);
				 rs = ps.executeQuery();
				 if(rs.next()) {
					 do {
						 memberBean mb = new memberBean();
						 mb.setId(rs.getString("id"));
						 mb.setPasswd(rs.getString("passwd"));
						 mb.setName(rs.getString("name"));
						 mb.setEmail(rs.getString("email"));
						 mb.setNickname(rs.getString("nickname"));
						 mbb.add(mb);
						 
					 }while(rs.next());
				 }
			}
			catch(Exception e) {
				e.printStackTrace();
			}
			finally {
				 resourceClose(rs,ps,conn);
			}
			return mbb;
		}
	   
	   public memberBean updateGetmember(String id) {
		   memberBean mb = new memberBean();
			
			Connection conn = null;
			PreparedStatement ps = null;
			ResultSet rs = null;
			
			try {
				conn = getConnection();
				String sql = "select * from member where id=?";
				ps = conn.prepareStatement(sql);
				ps.setString(1,id);
				rs = ps.executeQuery();
				
				if(rs.next()) {
					 mb.setId(rs.getString("id"));
					 mb.setName(rs.getString("passwd"));
					 mb.setName(rs.getString("name"));
					 mb.setEmail(rs.getString("email"));
					 mb.setNickname(rs.getString("nickname"));
					
				}
			}
			catch(Exception e) {
				e.printStackTrace();
			}
			finally {
				resourceClose(rs,ps, conn);
				
			}
			
			return mb; 
		}
	   
	   public int updatemember(memberBean mb) {
			Connection conn = null;
			PreparedStatement ps = null;
			int x = 0;
			
			try {
				conn = getConnection();
				 String sql = "update member set passwd=?, name=?, email=?, nickname=? where id=?";
			     ps = conn.prepareStatement(sql);        
			     ps.setString(1, mb.getPasswd());
			     ps.setString(2, mb.getName());
			     ps.setString(3, mb.getEmail());
			     ps.setString(4, mb.getNickname()); 
			     ps.setString(5, mb.getId());
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
	   
	   public void deletemember(String id) {
		   Connection conn = null;
		   PreparedStatement ps = null;
		
		   
		   try {
				conn = getConnection();
				String sql = "delete from member where id=?";
				ps = conn.prepareStatement(sql);
				ps.setString(1, id);
				ps.executeUpdate();
			   
		   }catch(Exception e){
			   e.printStackTrace();
		   }
		   finally {
			   resourceClose(ps, conn);
		   }
	
	   }
	
}
