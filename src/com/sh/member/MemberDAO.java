package com.sh.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.sh.util.DBConnector;

public class MemberDAO {
	
	//login메서드
	public MemberDTO memberLogin(MemberDTO memberDTO)throws Exception{
		MemberDTO m = null; //로그인 성공 실패를 가르기 위해서 새로 만듬
		Connection conn = DBConnector.getConnect();
		String sql = "select * from member where id=? and pw=?";
		PreparedStatement st = conn.prepareStatement(sql);
		
		st.setString(1, memberDTO.getId());
		st.setString(2, memberDTO.getPw());
		
		ResultSet rs = st.executeQuery();
		
		if(rs.next()) {
			m = new MemberDTO();
			m.setId(rs.getString("id"));
			m.setPw(rs.getString("pw"));
			m.setName(rs.getString("name"));
			m.setPhone(rs.getString("phone"));
			m.setEmail(rs.getString("email"));
			m.setAge(rs.getInt("age"));
		}
		DBConnector.disConnect(conn, st, rs);
		
		return m;
	}
	
	
	//join메서드
	public int memberJoin(MemberDTO memberDTO) throws Exception{
		int result=0;
		Connection conn = DBConnector.getConnect();
		String sql = "insert into member values(?, ?, ?, ?, ?, ?)";
		PreparedStatement st = conn.prepareStatement(sql);
		
		st.setString(1, memberDTO.getId());
		st.setString(2, memberDTO.getPw());
		st.setString(3, memberDTO.getName());
		st.setString(4, memberDTO.getPhone());
		st.setString(5,memberDTO.getEmail());
		st.setInt(6, memberDTO.getAge());
		
		result = st.executeUpdate();
		
		DBConnector.disConnect(conn, st);
		
		return result;
	}
}
