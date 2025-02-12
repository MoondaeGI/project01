package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dto.MemberDTO;

public class MemberDAO {
	private static MemberDAO INSTANCE;

	public synchronized static MemberDAO getInstance() {
		if (INSTANCE == null) {
			INSTANCE = new MemberDAO();
		}
		return INSTANCE;
	}

	private Connection getConnection() throws Exception {
		Context ctx = new InitialContext();
		DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/orcl");
		return ds.getConnection();
	}

	public void createByMember(MemberDTO dto) throws Exception {
		String sql = "insert into members (id, pw, name, email, phone, postcode, address1, address2) "
				+ "values (?, ?, ?, ?, ?, ?, ?, ?)";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setString(1, dto.getId());
			pstat.setString(2, dto.getPw());
			pstat.setString(3, dto.getName());
			pstat.setString(4, dto.getEmail());
			pstat.setString(5, dto.getTel());
			pstat.setInt(6, dto.getPost());
			pstat.setString(7, dto.getAddress1());
			pstat.setString(8, dto.getAddress2());

			pstat.executeUpdate();
		}
	}
	
	public List<MemberDTO> selectbyadd() throws Exception{	//mypage
		String sql = "select * from members";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql); ResultSet rs = pstat.executeQuery();){
			List<MemberDTO> list = new ArrayList<>();
			while(rs.next()) {
				MemberDTO dto = new MemberDTO(rs.getString("id"), rs.getString("pw"),rs.getString("name"),rs.getString("email"),rs.getString("tel"),rs.getInt("post"),rs.getString("address1"),rs.getString("address2"),rs.getTimestamp("date"));
				list.add(dto);
			}
			return list;
		}
	}
	
	public int updateByID(String id, String tel, String email, int post, String address1, String address2) throws Exception{	//mypage 수정하기
		String sql = "update members set tel=?,email=?,post=?,address1=?,address2=? where id=?";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql)) {
			pstat.setString(1, tel);
			pstat.setString(2, email);
			pstat.setInt(3, post);
			pstat.setString(4, address1);
			pstat.setString(5, address2);
			pstat.setString(6, id);
			return pstat.executeUpdate();
		}
	}
}
