package Server;

import java.awt.Component;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.swing.JOptionPane;

public class SignCheck {

	private Component frame;

	public int sign_check(String id) {
		Connection conn = null; // DB연결된 상태(세션)을 담은 객체
		PreparedStatement pstm = null; // SQL 문을 나타내는 객체
		ResultSet rs = null; // 쿼리문을 날린것에 대한 반환값을 담을 객체
		int result = 0;
		try {
			// SQL 문장을 만들고 만약 문장이 질의어(SELECT문)라면
			// 그 결과를 담을 ResulSet 객체를 준비한 후 실행시킨다.
			String quary = "SELECT id FROM javamem where id='" + id + "'";

			conn = DBconn.getConnection();
			pstm = conn.prepareStatement(quary);
			rs = pstm.executeQuery();

			if (rs.next()) {
				result = 0;
				JOptionPane.showMessageDialog(frame, "중복된 아이디 입니다.");
			} else {
				result = 1;
				JOptionPane.showMessageDialog(frame, "사용가능 아이디입니다.");
			}

		} catch (SQLException sqle) {
			System.out.println("SELECT문에서 예외 발생");
			sqle.printStackTrace();

		} finally {
			// DB 연결을 종료한다.
			try {
				if (rs != null) {
					rs.close();
				}
				if (pstm != null) {
					pstm.close();
				}
				if (conn != null) {
					conn.close();
				}
			} catch (Exception e) {
				throw new RuntimeException(e.getMessage());
			}
		}
		return result;
	}

	public void SignUp(String id, String pw) {
		Connection conn = null; // DB연결된 상태(세션)을 담은 객체
		PreparedStatement pstm = null; // SQL 문을 나타내는 객체
		int rs; // 쿼리문을 날린것에 대한 반환값을 담을 객체
		try {
			// SQL 문장을 만들고 만약 문장이 질의어(SELECT문)라면
			// 그 결과를 담을 ResulSet 객체를 준비한 후 실행시킨다.
			String quary = "insert into javamem values(?,?)";

			conn = DBconn.getConnection();
			pstm = conn.prepareStatement(quary);
			pstm.setString(1, id);
			pstm.setString(2, pw);
			rs = pstm.executeUpdate();

			if (rs > 0) {
				JOptionPane.showMessageDialog(frame, "회원가입 성공");
			} else
				JOptionPane.showMessageDialog(frame, "회원가입 실패");

		} catch (SQLException sqle) {
			System.out.println("SELECT문에서 예외 발생");
			sqle.printStackTrace();

		} finally {
			// DB 연결을 종료한다.
			try {
				if (pstm != null) {
					pstm.close();
				}
				if (conn != null) {
					conn.close();
				}
			} catch (Exception e) {
				throw new RuntimeException(e.getMessage());
			}
		}
	}
}
