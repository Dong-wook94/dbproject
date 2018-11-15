import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Database {

	private String url;
	private String user;
	private String pass;
	private Connection conn =null;


	public Database(String url, String user, String pass) {
		// TODO Auto-generated constructor stub
		this.url = url;
		this.user = user;
		this.pass = pass;
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

	public void setAllMaxSalaryZero() throws Exception{
		try {

			conn.setAutoCommit(false);//오토커밋
			Statement stmt = conn.createStatement();

			String sql;
			int result;
			sql = "update dept set max_salary=0 where did = 100";
			result = stmt.executeUpdate(sql);
			System.out.println(result + " row updated");

			sql = "update dept set max_salary=0 where did = 300";
			result = stmt.executeUpdate(sql);
			System.out.println(result + " row updated");

			sql = "update dept set max_salary=0 where did = 400";
			result = stmt.executeUpdate(sql);
			System.out.println(result + " row updated");

			sql = "update dept set max_salary=0 where did = 700";
			result = stmt.executeUpdate(sql);
			System.out.println(result + " row updated");

			conn.commit();
			conn.setAutoCommit(true);
			stmt.close();
			//conn.close();
		}catch(Exception e){
			System.err.println("sql erro =  " + e.getMessage());
			throw e;
		}
	}
	public void selectEMP() throws Exception {
		// TODO Auto-generated method stub

		try {
			conn.setAutoCommit(false);//오토커밋
			Statement stmt = conn.createStatement();

			System.out.println("EMP 출력");
			String query = "select * from emp";
			ResultSet rs = stmt.executeQuery(query);
			while (rs.next()) {
				int eid = rs.getInt("eid");
				String ename = rs.getString("ename");
				int did = rs.getInt("did");
				int salary = rs.getInt("salary");
				System.out.println(" EID= "+ eid + ", ENAME= "+ ename+", DID= "+did+", SALARY= "+salary);
			}
			rs.close();
			conn.commit();
			conn.setAutoCommit(true);
			stmt.close();
			//conn.close();
		}catch(Exception e){
			System.err.println("sql erro =  " + e.getMessage());
			throw e;
		}

	}


	public void selectDEPT() throws Exception {
		// TODO Auto-generated method stub
		try {

			conn.setAutoCommit(false);//오토커밋
			Statement stmt = conn.createStatement();

			System.out.println("DEPT 출력");
			String query = "select * from dept";
			ResultSet rs = stmt.executeQuery(query);
			while (rs.next()) {
				int did = rs.getInt("did");
				String dname = rs.getString("dname");
				int max_salary = rs.getInt("max_salary");
				System.out.println(" DID= "+ did + ", DNAME= "+ dname+", MAX_SALARY= "+max_salary);
			}
			rs.close();
			conn.commit();
			conn.setAutoCommit(true);
			stmt.close();
			//conn.close();
		}catch(Exception e){
			System.err.println("sql erro =  " + e.getMessage());
			throw e;
		}
	}


	public void callStoredProc() throws Exception{
		try {
			conn.setAutoCommit(false);

			String sql = "{call proc_uupdateMaxSalary}";
			CallableStatement cstmt = null;
			cstmt = conn.prepareCall(sql);
			//cstmt.setInt(1,20);
			//cstmt.registerOutParameter(2, java.sql.Types.INTEGER);
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
	public void insertStudent(int stid, String stname, String stpass, String major, int styear, double avg_grade) throws Exception {
		// TODO Auto-generated method stub
		try {
			conn.setAutoCommit(false);
			Statement stmt = conn.createStatement();


			String sql = "insert into emp values(?, ?, ?, ?, ?, ?)";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			//System.out.println("!!!!");
			pstmt.setInt(1, stid);
			pstmt.setString(2, stname);
			pstmt.setString(3, stpass);
			pstmt.setString(4, major);

			pstmt.setInt(5, styear);
			pstmt.setDouble(6, avg_grade);

			//System.out.println("!!!!");
			int result = pstmt.executeUpdate();
			System.out.println(result + " row inserted");
			pstmt.close();

			conn.commit();
			conn.setAutoCommit(true);
			stmt.close();
			//conn.close();
		} catch(Exception e) {
			System.err.println("sql error = " +
					e.getMessage());
		}

	}
	public void insertSubject(String suid, String semester, String suname, int eid, int sufield, int credit,int dcredit, int necessary) throws Exception {
		// TODO Auto-generated method stub
		try {
			conn.setAutoCommit(false);
			Statement stmt = conn.createStatement();


			String sql = "insert into emp values(?, ?, ?, ?, ?, ?, ?, ?)";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			//System.out.println("!!!!");
			pstmt.setString(1, suid);
			pstmt.setString(2, semester);
			pstmt.setString(3, suname);
			pstmt.setInt(4, eid);
			pstmt.setInt(5, sufield);
			pstmt.setInt(6, credit);
			pstmt.setInt(7, dcredit);
			pstmt.setInt(8, necessary);
			

			//System.out.println("!!!!");
			int result = pstmt.executeUpdate();
			System.out.println(result + " row inserted");
			pstmt.close();

			conn.commit();
			conn.setAutoCommit(true);
			stmt.close();
			//conn.close();
		} catch(Exception e) {
			System.err.println("sql error = " +
					e.getMessage());
		}

	}
	public void insertEMP(int eid, String ename, String emp_type, String epass) throws Exception {
		// TODO Auto-generated method stub
		try {
			conn.setAutoCommit(false);
			Statement stmt = conn.createStatement();


			String sql = "insert into emp values(?, ?, ?, ?, ?, ?, ?, ?)";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			//System.out.println("!!!!");
			pstmt.setInt(1, eid);
			pstmt.setString(2, ename);
			pstmt.setString(3, emp_type);
			pstmt.setString(4, epass);
			

			//System.out.println("!!!!");
			int result = pstmt.executeUpdate();
			System.out.println(result + " row inserted");
			pstmt.close();

			conn.commit();
			conn.setAutoCommit(true);
			stmt.close();
			//conn.close();
		} catch(Exception e) {
			System.err.println("sql error = " +
					e.getMessage());
		}

	}
	public void insertResult(int stid, String suid, String semester, String grade, int retry) throws Exception {
		// TODO Auto-generated method stub
		try {
			conn.setAutoCommit(false);
			Statement stmt = conn.createStatement();


			String sql = "insert into emp values(?, ?, ?, ?, ?)";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			//System.out.println("!!!!");
			pstmt.setInt(1, stid);
			pstmt.setString(2, suid);
			pstmt.setString(3, semester);
			pstmt.setString(4, grade);
			pstmt.setInt(5, retry);
			

			//System.out.println("!!!!");
			int result = pstmt.executeUpdate();
			System.out.println(result + " row inserted");
			pstmt.close();

			conn.commit();
			conn.setAutoCommit(true);
			stmt.close();
			//conn.close();
		} catch(Exception e) {
			System.err.println("sql error = " +
					e.getMessage());
		}

	}
	public void updateEMPDid(int did, String ename) throws Exception {
		try {
			conn.setAutoCommit(false);
			Statement stmt = conn.createStatement();

			String sql = "update emp set did = ? where ename = ?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, did);
			pstmt.setString(2, ename);

			int result = pstmt.executeUpdate();
			System.out.println(result + " rows updated");
			pstmt.close();

			conn.commit();
			conn.setAutoCommit(true);
			stmt.close();
			//conn.close();
		} catch(Exception e) {
			System.err.println("sql error = " + e.getMessage());
			throw e;
		}
	}
	public void updateEMPSalary(int salary, String ename) throws Exception {
		try {
			conn.setAutoCommit(false);
			Statement stmt = conn.createStatement();

			String sql = "update emp set salary = ? where ename = ?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, salary);
			pstmt.setString(2, ename);

			int result = pstmt.executeUpdate();
			System.out.println(result + " rows updated");
			pstmt.close();

			conn.commit();
			conn.setAutoCommit(true);
			stmt.close();
			//conn.close();
		} catch(Exception e) {
			System.err.println("sql error = " + e.getMessage());
			throw e;
		}

	}
	public void deleteEMP(String ename) throws Exception {
		try {

			conn.setAutoCommit(false);//오토커밋
			Statement stmt = conn.createStatement();

			String sql = "delete emp where ename = ?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, ename);

			int result = pstmt.executeUpdate();
			System.out.println(result + " rows deleted");
			pstmt.close();

			conn.commit();
			conn.setAutoCommit(true);
			stmt.close();
			//conn.close();
		}catch(Exception e){
			System.err.println("sql erro =  " + e.getMessage());
			throw e;
		}
	}
}