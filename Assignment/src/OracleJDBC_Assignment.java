import java.sql.*;
public class OracleJDBC_Assignment {

	
	@SuppressWarnings("null")
	public static void main(String[] args) {
		String url = "jdbc:oracle:thin:@localhost:1521:oraknu";
		String user = "kdhong";
		String pass = "kdhong";
		
		Database db = new Database(url,user,pass);
		
		try {
			db.connectDriver();
			db.setAllMaxSalaryZero();
			db.selectEMP();
			db.selectDEPT();
			
			/*
			db.callStoredProc();
			db.selectEMP();
			db.selectDEPT();
			//db.insertEMP();
			*/
			
			// login select
			int usertype = 0; // �̿��� Ÿ��.
			switch(usertype) {
				case 0: // �л�
					while(true) {
						if(true) break; // Ż������
					}
				break;
				
				case 1: // ������
					while(true) {
						if(true) break; // Ż������
					}
			}
			
			
			db.close();
		}catch(Exception e) {
			System.err.println("Sql error = " + e.getMessage());
			System.exit(1);
		}
	}
}
