package guestbook;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;

public class GuestBookMgr {

	private DBConnectionMgr pool;
	private final SimpleDateFormat SDF_DATE =
			new SimpleDateFormat("yyyy'년'  M'월' d'일' (E)");
	private final SimpleDateFormat SDF_TIME =
			new SimpleDateFormat("H:mm:ss");
	
	public GuestBookMgr() {
		pool = DBConnectionMgr.getInstance();
	}
	
	//Join Login 
	//select id from tblJoin where id = ? and pwd = ?
	public boolean loginJoin(String id, String pwd) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "select id from tblJoin where id = ? and pwd = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			rs = pstmt.executeQuery();
			if(rs.next())
			{
				flag = true;
			}
			//flag = rs.next();//결과값 있다면 true, 없다면 false
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return flag;
	}
	
	
	//Join Information
	//select * from tblJoin where id = ?
	public JoinBean getJoin(String id){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		JoinBean bean = new JoinBean();
		try {
			con = pool.getConnection();
			sql = "select * from tblJoin where id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();			
			if(rs.next())
			{
				bean.setId(rs.getString("id"));
				bean.setPwd(rs.getString("pwd"));
				bean.setName(rs.getString("name"));
				bean.setEmail(rs.getString("email"));
				bean.setHp(rs.getString("hp"));
				bean.setGrade(rs.getString("grade"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return bean;
	}
	//GuestBook Insert
	//sql = "insert tblGuestBook(id,contents,ip,regdate,regtime,secret)"
	//values(?,?,?,now(),now(),?)";
	public void insertGuestBook(GuestBookBean bean) {
		
	}
	//GuestBook Update
	//sql = "update tblGuestBook set contents=?,ip=?,secret=? "
	//"where num=?";
	public void updateGuestBook(GuestBookBean bean) {
		
	}
	//GuestBook Delete
	//sql = "delete from tblGuestBook where num=?";
	public void deleteGuestBook(int num) {
		
	}
	//GuestBook List
	

	//GuestBook Read

}