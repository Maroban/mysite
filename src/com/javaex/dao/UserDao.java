package com.javaex.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.javaex.vo.UserVo;

public class UserDao {

	// 필드
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;

	private String driver = "oracle.jdbc.driver.OracleDriver"; // 드라이버
	private String url = "jdbc:oracle:thin:@localhost:1521:xe"; // IP주소와 포트번호
	private String id = "webdb"; // SQL 계정 이름
	private String pw = "webdb"; // SQL 계정 비밀번호

	// DB 연결
	private void getConnection() {
		try {
			Class.forName(driver);

			conn = DriverManager.getConnection(url, id, pw);

		} catch (ClassNotFoundException e) {
			System.out.println("error: 드라이버 로딩 실패 - " + e);
		} catch (SQLException e) {
			System.out.println("error:" + e);
		}
	}

	// 자원 정리
	private void close() {
		try {
			if (rs != null) {
				rs.close();
			}
			if (pstmt != null) {
				pstmt.close();
			}
			if (conn != null) {
				conn.close();
			}
		} catch (SQLException e) {
			System.out.println("error:" + e);
		}

	}

	// 생성자

	// 메소드 - GS

	// 메소드 - 일반
	public int insert(UserVo userVo) {

		int count = -1;

		// 2번, 4번 메소드
		this.getConnection();

		try {
			// 3. SQL문 준비 / 바인딩 / 실행
			String insert = "";
			insert += " INSERT INTO users VALUES ( ";
			insert += "     seq_user_no.NEXTVAL, ";
			insert += "     ?, ";
			insert += "     ?, ";
			insert += "     ?, ";
			insert += "     ? ";
			insert += " ) ";

			pstmt = conn.prepareStatement(insert);

			pstmt.setString(1, userVo.getId());
			pstmt.setString(2, userVo.getPw());
			pstmt.setString(3, userVo.getName());
			pstmt.setString(4, userVo.getGender());

			count = pstmt.executeUpdate();

			// 4.결과처리

			System.out.println("[" + count + "건이 저장되었습니다.]");
			System.out.println("[" + userVo.getName() + "님이 회원가입 하셨습니다.]");

		} catch (SQLException e) {
			e.printStackTrace();
		}

		// 5번 메소드
		this.close();

		return count;
	}

}