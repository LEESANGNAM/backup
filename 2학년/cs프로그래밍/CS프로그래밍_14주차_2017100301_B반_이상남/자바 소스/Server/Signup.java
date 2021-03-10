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
	private JLabel lab1 = new JLabel("���̵�");
	private JLabel lab2 = new JLabel("��й�ȣ");
	private JTextField tid = new JTextField(10);
	private JTextField tpw = new JTextField(10);
	private JButton btn1 = new JButton("�ߺ�üũ");
	private JButton btn2 = new JButton("�����ϱ�");
	private Component frame;

	public Signup() {
		// TODO Auto-generated constructor stub
		setTitle("ȸ������");
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
			// �ߺ�üũ �ϱ� �ؼ� 0�̸� ���Ұ� 1�̸� ��밡��
			String id = tid.getText();
			if (id.length() <= 0) {
				JOptionPane.showMessageDialog(frame, "���̵� �Է����ּ���.");
			} else {
				SignCheck s = new SignCheck();
				sign = s.sign_check(id);
			}
		} else if (e.getSource() == btn2) {
			if (sign == 0) {
				JOptionPane.showMessageDialog(frame, "�ߺ�üũ�� ���ּ���.");
			} else {
				String pw = tpw.getText();
				String id = tid.getText();
				if (id.length() <= 0 || pw.length() <= 0) {
					JOptionPane.showMessageDialog(frame, "���̵�� ��й�ȣ�� �Է����ּ���.");
				} else {
					SignCheck s = new SignCheck();
					s.SignUp(id, pw);
				}
			}

		}
	}
}
