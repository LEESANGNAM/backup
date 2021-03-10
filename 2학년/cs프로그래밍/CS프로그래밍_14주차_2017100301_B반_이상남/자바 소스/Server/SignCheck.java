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
		Connection conn = null; // DB����� ����(����)�� ���� ��ü
		PreparedStatement pstm = null; // SQL ���� ��Ÿ���� ��ü
		ResultSet rs = null; // �������� �����Ϳ� ���� ��ȯ���� ���� ��ü
		int result = 0;
		try {
			// SQL ������ ����� ���� ������ ���Ǿ�(SELECT��)���
			// �� ����� ���� ResulSet ��ü�� �غ��� �� �����Ų��.
			String quary = "SELECT id FROM javamem where id='" + id + "'";

			conn = DBconn.getConnection();
			pstm = conn.prepareStatement(quary);
			rs = pstm.executeQuery();

			if (rs.next()) {
				result = 0;
				JOptionPane.showMessageDialog(frame, "�ߺ��� ���̵� �Դϴ�.");
			} else {
				result = 1;
				JOptionPane.showMessageDialog(frame, "��밡�� ���̵��Դϴ�.");
			}

		} catch (SQLException sqle) {
			System.out.println("SELECT������ ���� �߻�");
			sqle.printStackTrace();

		} finally {
			// DB ������ �����Ѵ�.
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
		Connection conn = null; // DB����� ����(����)�� ���� ��ü
		PreparedStatement pstm = null; // SQL ���� ��Ÿ���� ��ü
		int rs; // �������� �����Ϳ� ���� ��ȯ���� ���� ��ü
		try {
			// SQL ������ ����� ���� ������ ���Ǿ�(SELECT��)���
			// �� ����� ���� ResulSet ��ü�� �غ��� �� �����Ų��.
			String quary = "insert into javamem values(?,?)";

			conn = DBconn.getConnection();
			pstm = conn.prepareStatement(quary);
			pstm.setString(1, id);
			pstm.setString(2, pw);
			rs = pstm.executeUpdate();

			if (rs > 0) {
				JOptionPane.showMessageDialog(frame, "ȸ������ ����");
			} else
				JOptionPane.showMessageDialog(frame, "ȸ������ ����");

		} catch (SQLException sqle) {
			System.out.println("SELECT������ ���� �߻�");
			sqle.printStackTrace();

		} finally {
			// DB ������ �����Ѵ�.
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
