package jdbc;

public class Employee {
	
	int eid;
	String ename;
	String emp_type;
	String epass;
	public Employee(int eid, String ename, String emp_type, String epass) {
		super();
		this.eid = eid;
		this.ename = ename;
		this.emp_type = emp_type;
		this.epass = epass;
	}
	public int getEid() {
		return eid;
	}
	public void setEid(int eid) {
		this.eid = eid;
	}
	public String getEname() {
		return ename;
	}
	public void setEname(String ename) {
		this.ename = ename;
	}
	public String getEmp_type() {
		return emp_type;
	}
	public void setEmp_type(String emp_type) {
		this.emp_type = emp_type;
	}
	public String getEpass() {
		return epass;
	}
	public void setEpass(String epass) {
		this.epass = epass;
	}
	
	
}
