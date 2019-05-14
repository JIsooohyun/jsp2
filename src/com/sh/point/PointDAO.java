package com.sh.point;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.sh.util.DBConnector;

public class PointDAO {
	public ArrayList<PointDTO> selectList() throws Exception{
		Connection conn = DBConnector.getConnect();
		ArrayList<PointDTO> ar = new ArrayList<PointDTO>();
		PointDTO pointDTO = null;
		String sql = "select * from point";
		
		PreparedStatement st = conn.prepareStatement(sql);
		
		ResultSet rs = st.executeQuery();
		
		while(rs.next()) {
			pointDTO = new PointDTO();
			pointDTO.setNum(rs.getInt(1));
			pointDTO.setName(rs.getString(2));
			pointDTO.setKor(rs.getInt(3));
			pointDTO.setEng(rs.getInt(4));
			pointDTO.setMath(rs.getInt(5));
			pointDTO.setTotal(rs.getInt(6));
			pointDTO.setAvg(rs.getDouble(7));
			ar.add(pointDTO);
		}
		
		DBConnector.disConnect(conn, st, rs);
		
		return ar;
	}
	
	public PointDTO selectOne(int num)throws Exception{
		PointDTO pointDTO =null;
		Connection conn = DBConnector.getConnect();
		
		String sql = "select * from point where num=?";
		
		PreparedStatement st = conn.prepareStatement(sql);
		
		st.setInt(1, num);
		
		ResultSet rs = st.executeQuery();
		
		if(rs.next()) {
			pointDTO = new PointDTO();
			pointDTO.setNum(rs.getInt(1));
			pointDTO.setName(rs.getString(2));
			pointDTO.setKor(rs.getInt(3));
			pointDTO.setEng(rs.getInt(4));
			pointDTO.setMath(rs.getInt(5));
			pointDTO.setTotal(rs.getInt(6));
			pointDTO.setAvg(rs.getDouble(7));
		}
		
		DBConnector.disConnect(conn, st, rs);
		
		return pointDTO;
	}
	
	public int delete(int num)throws Exception{
		Connection conn = DBConnector.getConnect();
		
		String sql="delete point where num=?";
		
		PreparedStatement st = conn.prepareStatement(sql);
		
		st.setInt(1, num);
		
		int result = st.executeUpdate();
		
		DBConnector.disConnect(conn, st);
		
		return result;
	}
	public int update(PointDTO pointDTO) throws Exception{
		Connection conn = DBConnector.getConnect();
		
		String sql = "update point set name=?, kor=?, eng=?, math=?, total=?, avg=? where num=?";
		
		PreparedStatement st = conn.prepareStatement(sql);
		
		st.setString(1, pointDTO.getName());
		st.setInt(2, pointDTO.getKor());
		st.setInt(3, pointDTO.getEng());
		st.setInt(4, pointDTO.getMath());
		st.setInt(5, pointDTO.getTotal());
		st.setDouble(6, pointDTO.getAvg());
		st.setInt(7, pointDTO.getNum());
		
		int result = st.executeUpdate();
		
		DBConnector.disConnect(conn, st);
		
		return result;
	}
	public int insert(PointDTO pointDTO) throws Exception{
		Connection conn = DBConnector.getConnect();
		
		String sql = "insert into point values(point_seq.nextval, ?, ?, ?, ?, ?, ?)";
		
		PreparedStatement st = conn.prepareStatement(sql);
		
		st.setString(1,pointDTO.getName());
		st.setInt(2, pointDTO.getKor());
		st.setInt(3, pointDTO.getEng());
		st.setInt(4, pointDTO.getMath());
		st.setInt(5, pointDTO.getTotal());
		st.setDouble(6, pointDTO.getAvg());
		
		int result = st.executeUpdate();
		
		DBConnector.disConnect(conn, st);
		
		return result;
	}
}
