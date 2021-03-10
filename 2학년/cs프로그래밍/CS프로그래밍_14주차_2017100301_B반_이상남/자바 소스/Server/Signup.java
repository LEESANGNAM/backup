package Server;

import java.awt.Component;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;
import javax.swing.JTextField;

public class Signup extends JFrame implements ActionListener {
	private int sign;
	private JPanel pan = new JPanel();
	private JLabel lab1 = new JLabel("아이디");
	private JLabel lab2 = new JLabel("비밀번호");
	private JTextField tid = new JTextField(10);
	private JTextField tpw = new JTextField(10);
	private JButton btn1 = new JButton("중복체크");
	private JButton btn2 = new JButton("가입하기");
	private Component frame;

	public Signup() {
		// TODO Auto-generated constructor stub
		setTitle("회원가입");
		setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);

		pan.add(lab1);
		pan.add(tid);
		btn1.addActionListener(this);
		pan.add(btn1);

		pan.add(lab2);
		pan.add(tpw);
		btn2.addActionListener(this);
		pan.add(btn2);

		add(pan);
		setSize(300, 150);
		setVisible(true);
	}

	@Override
	public void actionPerformed(ActionEvent e) {
		// TODO Auto-generated method stub
		if (e.getSource() == btn1) {
			// 중복체크 하기 해서 0이면 사용불가 1이면 사용가능
			String id = tid.getText();
			if (id.length() <= 0) {
				JOptionPane.showMessageDialog(frame, "아이디를 입력해주세요.");
			} else {
				SignCheck s = new SignCheck();
				sign = s.sign_check(id);
			}
		} else if (e.getSource() == btn2) {
			if (sign == 0) {
				JOptionPane.showMessageDialog(frame, "중복체크를 해주세요.");
			} else {
				String pw = tpw.getText();
				String id = tid.getText();
				if (id.length() <= 0 || pw.length() <= 0) {
					JOptionPane.showMessageDialog(frame, "아이디와 비밀번호를 입력해주세요.");
				} else {
					SignCheck s = new SignCheck();
					s.SignUp(id, pw);
				}
			}

		}
	}
}
