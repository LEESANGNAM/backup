package Server;

import java.awt.Color;
import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.ArrayList;
import java.util.concurrent.ExecutionException;

import javax.swing.JFrame;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;

public class Server extends JFrame {
	private JTextArea textArea;
	private JScrollPane pane;
	private ServerSocket soket;
	private Socket s;
	private ArrayList list;

	public Server() {

		super("채팅서버 v1.0.1");
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

		textArea = new JTextArea();
		pane = new JScrollPane(textArea);
		textArea.setBackground(Color.LIGHT_GRAY);
		add(pane);
		textArea.setText("채팅서버 시작됨!.\n");

		setSize(400, 200);
		setVisible(true);
		try {
			list = new ArrayList();
			soket = new ServerSocket(5000);
			while (true) {
				s = soket.accept();
				ChatThread t = new ChatThread();
				list.add(t);
				t.start();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	class ChatThread extends Thread {

		BufferedReader br;
		PrintWriter pw;
		InputStream is;
		String nickName;

		public ChatThread() {

			try {
				is = s.getInputStream();
				br = new BufferedReader(new InputStreamReader(is));

				OutputStream os = s.getOutputStream();
				pw = new PrintWriter(os, true);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		public void send(String str) {
			pw.println(str);
		}

		public void run() {
			try {
				pw.println("로그인을 해주세요");
				nickName = br.readLine();
				broadcast(nickName + "님이 입장했습니다.");
				while (true) {
					String str = br.readLine();
					broadcast("[" + nickName + "]" + str);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		private void broadcast(String str) {
			// TODO Auto-generated method stub
			for (int i = 0; i < list.size(); i++) {
				ChatThread t = (ChatThread) list.get(i);
				t.send(str);
			}
		}
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		new Server();
	}

}
