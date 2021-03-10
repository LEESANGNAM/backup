package Server;

import java.awt.BorderLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.Socket;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;
import javax.swing.JTextField;

public class Client extends JFrame implements ActionListener, Runnable {

	private JTextArea textArea;
	private JScrollPane pane;
	private JTextField textField;
	private JPanel panel = new JPanel();
	private JLabel label1 = new JLabel("아이디");
	private JLabel label2 = new JLabel("비밀번호");
	private JTextField tid = new JTextField(10);
	private JTextField tpw = new JTextField(10);
	private JButton btn = new JButton("로그인");
	private JButton btn2 = new JButton("회원가입");
	Socket socket = null;
	BufferedReader br;
	PrintWriter pw;
	OutputStream os;
	int result;

	public Client() {
		// TODO Auto-generated constructor stub
		setTitle("채팅 클라이언트 v.1.0.1");
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

		panel.setSize(400, 100);
		panel.add(label1);
		panel.add(tid);
		panel.add(label2);
		panel.add(tpw);
		panel.add(btn);
		panel.add(btn2);
		add(panel, BorderLayout.NORTH);

		textArea = new JTextArea();
		textArea.setEditable(false);
		pane = new JScrollPane(textArea);
		add(pane);

		textField = new JTextField();
		add(textField, BorderLayout.SOUTH);
		tid.addActionListener(this);
		tpw.addActionListener(this);
		btn.addActionListener(this);
		btn2.addActionListener(this);
		textField.addActionListener(this);

		setSize(500, 500);
		setVisible(true);

		try {
			socket = new Socket("127.0.0.1", 5000);
			InputStream is = socket.getInputStream();
			InputStreamReader isr = new InputStreamReader(is);
			br = new BufferedReader(isr);

			os = socket.getOutputStream();
			pw = new PrintWriter(os, true);
		} catch (Exception e) {
			e.printStackTrace();
		}

		Thread t = new Thread(this);
		t.start();
	}

	@Override
	public void run() {
		// TODO Auto-generated method stub
		try {
			String str = br.readLine();
			textArea.append(str + "\n");
			while (true) {
				str = br.readLine();
				textArea.append(str + "\n");
				textArea.setCaretPosition(textArea.getDocument().getLength());
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

	}

	@Override
	public void actionPerformed(ActionEvent e) {
		// TODO Auto-generated method stub
		if (e.getSource() == btn) {
			String id = tid.getText();
			String passwd = tpw.getText();
			DBconn d = new DBconn();
			if (d.Login(id, passwd) == 1) {
				pw.write(id);
				result = 1;
				String str = textField.getText();
				pw.println(str);
				textField.setText("");
			}
		}
		if (e.getSource() == btn2) {
			new Signup();
		}

		if ((e.getSource() == textField) && (result == 1)) {
			String str = textField.getText();
			pw.println(str);
			textField.setText("");
		}

	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		new Client();
	}

}
