package jdbc;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

public class Database {

	private String url;
	private String user;
	private String pass;
	private Connection conn =null;


	public Database() {
		// TODO Auto-generated constructor stub
		this.url = "jdbc:oracle:thin:@localhost:1521:oraknu";
		this.user = "project";
		this.pass = "project";
	}


	public void connectDriver() throws Exception{
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.println("드라이버 검색 성공!");
		}catch(ClassNotFoundException e) {
			System.err.println("error = " + e.getMessage());
			System.exit(1);
		}

		try{
			conn = DriverManager.getConnection(url,user,pass);
		}catch(SQLException e) {
			System.err.println("sql error = " + e.getMessage());
			System.exit(1);
		}
	}

	public void close() throws Exception{
		try {
			this.conn.close();
		}
		catch (Exception e) {
			System.err.println("sql erro =  " + e.getMessage());
			throw e;
		}
	}
	
	public ArrayList<Student> SelectStudentQuery(String query) throws Exception{
		conn.setAutoCommit(false);//오토커밋
		Statement stmt = conn.createStatement();

		ResultSet rs = stmt.executeQuery(query);
		ArrayList<Student> aList = new ArrayList<Student>();
		while (rs.next()) {
			aList.add(new Student(rs.getInt("stid"),rs.getString("stname"),rs.getString("stpass"),
					rs.getString("major"),rs.getInt("styear"),rs.getDouble("avg_grade")));
		}
		rs.close();
		conn.commit();
		conn.setAutoCommit(true);
		stmt.close();
		return aList;
	}
	public ArrayList<Employee> SelectEmployeeQuery(String query) throws Exception{
		conn.setAutoCommit(false);//오토커밋
		Statement stmt = conn.createStatement();

		ResultSet rs = stmt.executeQuery(query);
		ArrayList<Employee> aList = new ArrayList<Employee>();
		while (rs.next()) {
			aList.add(new Employee(rs.getInt("eid"),rs.getString("ename"),rs.getString("emp_type"),
					rs.getString("epass")));
		}
		rs.close();
		conn.commit();
		conn.setAutoCommit(true);
		stmt.close();
		return aList;
	}
	public ArrayList<Result> SelectResultQuery(String query) throws Exception{
		conn.setAutoCommit(false);//오토커밋
		Statement stmt = conn.createStatement();

		ResultSet rs = stmt.executeQuery(query);
		ArrayList<Result> aList = new ArrayList<Result>();
		while (rs.next()) {
			aList.add(new Result(rs.getInt("stid"),rs.getString("suid"),rs.getString("semester"),
					rs.getString("grade"),rs.getInt("retry")));
		}
		rs.close();
		conn.commit();
		conn.setAutoCommit(true);
		stmt.close();
		return aList;
	}
	public ArrayList<JoinResultSubject> SelectJoinResultSubjectQuery(String query) throws Exception{
		conn.setAutoCommit(false);//오토커밋
		Statement stmt = conn.createStatement();

		ResultSet rs = stmt.executeQuery(query);
		ArrayList<JoinResultSubject> aList = new ArrayList<JoinResultSubject>();
		while (rs.next()) {
			aList.add(new JoinResultSubject(rs.getInt("stid"),rs.getString("suid"),rs.getString("suname"),rs.getString("sufield"),rs.getString("semester"),
					rs.getString("grade"),rs.getInt("retry")));
		}
		rs.close();
		conn.commit();
		conn.setAutoCommit(true);
		stmt.close();
		return aList;
	}
	public ArrayList<Subject> SelectSubjectQuery(String query) throws Exception{
		conn.setAutoCommit(false);//오토커밋
		Statement stmt = conn.createStatement();

		ResultSet rs = stmt.executeQuery(query);
		ArrayList<Subject> aList = new ArrayList<Subject>();
		while (rs.next()) {
			aList.add(new Subject(rs.getString("suid"),rs.getString("semester"),rs.getInt("eid"),
					rs.getString("sufield"),rs.getInt("credit"),rs.getInt("dcredit"),rs.getInt("necessary")));
		}
		rs.close();
		conn.commit();
		conn.setAutoCommit(true);
		stmt.close();
		return aList;
	}
	
	public HashMap<String, String> SelectCategoryFromResults(ArrayList<String> suid) throws Exception {
		conn.setAutoCommit(false);
		Statement stmt = conn.createStatement();

		HashMap<String, String> map = new HashMap<String, String>();
		
		for (String s : suid) {
			ResultSet rs = stmt.executeQuery("select sufield from subject where suid = '" + s + "'");
			while (rs.next()) {
				map.put(s, rs.getString(1));
			}
			rs.close();
		}
		conn.commit();
		conn.setAutoCommit(true);
		stmt.close();
		return map;
	}
	public int GetTotalCredit(ArrayList<String> suid) throws Exception {
		conn.setAutoCommit(false);
		Statement stmt = conn.createStatement();

		int totalCredit = 0;
		
		for (String s : suid) {
			ResultSet rs = stmt.executeQuery("select credit from subject where suid = '" + s + "'");
			while (rs.next()) {
				totalCredit += rs.getInt(1);
			}
			rs.close();
		}
		conn.commit();
		conn.setAutoCommit(true);
		stmt.close();
		return totalCredit;
	}
	public void DMLCustomQuery(String sql) throws Exception{
		conn.setAutoCommit(false);//오토커밋
		Statement stmt = conn.createStatement();
		
		int result = stmt.executeUpdate(sql);
		System.out.println(result+"행 업데이트");
		conn.commit();
		conn.setAutoCommit(true);
		stmt.close();
	}


	public void callStoredProc(String procName) throws Exception{
		try {
			conn.setAutoCommit(false);

			String sql = "{call " + procName + "}";
			CallableStatement cstmt = null;
			cstmt = conn.prepareCall(sql);
			cstmt.execute();
			System.out.println("Stored Procedure 호출");
			conn.commit();
			conn.setAutoCommit(true);
			cstmt.close();
		} catch(Exception e) {
			System.err.println("Sql error = " + e.getMessage());
			throw e;
		}
	}
	
}