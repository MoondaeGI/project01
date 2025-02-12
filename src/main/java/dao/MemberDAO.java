package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

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
}
