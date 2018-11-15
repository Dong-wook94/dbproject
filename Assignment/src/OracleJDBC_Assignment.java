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
			
			db.callStoredProc();
			db.selectEMP();
			db.selectDEPT();
			//db.insertEMP();
			
			db.insertEMP(100,"±èµ¿¿í","M","STUDENT","´ë±¸",10,100,1500,500,"18/11/02");
			db.selectEMP();
			db.selectDEPT();
			
			db.updateEMPSalary(1000, "±èµ¿¿í");
			db.selectEMP();
			db.selectDEPT();
			
			db.updateEMPSalary(2000, "±èµ¿¿í");
			db.selectEMP();
			db.selectDEPT();
			
			db.updateEMPDid(300, "±èµ¿¿í");
			db.selectEMP();
			db.selectDEPT();
			
			db.deleteEMP("±èµ¿¿í");
			db.selectEMP();
			db.selectDEPT();
			
			
			db.close();
		}catch(Exception e) {
			System.err.println("Sql error = " + e.getMessage());
			System.exit(1);
		}
	}
}
