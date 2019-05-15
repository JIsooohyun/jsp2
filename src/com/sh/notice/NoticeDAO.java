package com.sh.notice;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.sh.point.PointDTO;
import com.sh.util.DBConnector;

public class NoticeDAO {
	public int delete(int num)throws Exception{
		Connection conn =  DBConnector.getConnect();
		
		String sql = "delete from notice where num=?";
		
		PreparedStatement st = conn.prepareStatement(sql);
		
		st.setInt(1, num);
		
		int result = st.executeUpdate();
		DBConnector.disConnect(conn, st);
		return result;
	}
	public int update(NoticeDTO noticeDTO)throws Exception{
		Connection conn = DBConnector.getConnect();
		
		String sql = "update notice set title=?, contents=?, reg_date=sysdate where num=?";
		
		PreparedStatement st = conn.prepareStatement(sql);
		
		st.setString(1, noticeDTO.getTitle());
		st.setString(2, noticeDTO.getContents());
		st.setInt(3, noticeDTO.getNum());
		
		int result = st.executeUpdate();
		
		DBConnector.disConnect(conn, st);
		
		return result;
	}

	public NoticeDTO selectOne(int num) throws Exception{
		Connection conn= DBConnector.getConnect();
		NoticeDTO noticeDTO = new NoticeDTO();
		String sql = "select * from notice where num=?";
		
		PreparedStatement st =conn.prepareStatement(sql);
		
		st.setInt(1, num);
		
		ResultSet rs = st.executeQuery();
		if(rs.next()) {
			noticeDTO.setNum(rs.getInt("num"));
			noticeDTO.setTitle(rs.getString("title"));
			noticeDTO.setContents(rs.getString("contents"));
			noticeDTO.setWriter(rs.getString("writer"));
			noticeDTO.setReg_date(rs.getString("reg_date"));
			noticeDTO.setHit(rs.getInt("hit"));
		}
		DBConnector.disConnect(conn, st, rs);
		return noticeDTO;
	}
	public int insert(NoticeDTO noticeDTO) throws Exception{
		Connection conn = DBConnector.getConnect();
		
		String sql = "insert into notice(num, title, contents, writer, reg_date) values(notice_seq.nextval, ?, ?, ?, sysdate)";
		PreparedStatement st = conn.prepareStatement(sql);
		
		st.setString(1, noticeDTO.getTitle());
		st.setString(2, noticeDTO.getContents());
		st.setString(3, noticeDTO.getWriter());
		
		int result = st.executeUpdate();
		DBConnector.disConnect(conn, st);
		return result;
	}
	public ArrayList<NoticeDTO> selectList() throws Exception{
		Connection conn = DBConnector.getConnect();
		ArrayList<NoticeDTO> ar = new ArrayList<NoticeDTO>();
		NoticeDTO noticeDTO = null;
		String sql = "select * from notice order by num desc";
		
		PreparedStatement st = conn.prepareStatement(sql);
		
		ResultSet rs = st.executeQuery();
		
		while(rs.next()) {
			noticeDTO = new NoticeDTO();
			noticeDTO.setNum(rs.getInt("num"));
			noticeDTO.setTitle(rs.getString("title"));
			noticeDTO.setContents(rs.getString("contents"));
			noticeDTO.setWriter(rs.getString("writer"));
			noticeDTO.setReg_date(rs.getString("reg_date"));
			noticeDTO.setHit(rs.getInt("hit"));
			ar.add(noticeDTO);
		}
		
		DBConnector.disConnect(conn, st, rs);
		
		return ar;
	}
	
}
