package jdbc;

public class JoinResultSubject {

	int stid;
	String suid;
	String suname;
	String sufield;
	String semester;
	String grade;
	int retry;
	
	public JoinResultSubject(int stid, String suid,String suname,String sufield, String semester, String grade, int retry) {
		super();
		this.stid = stid;
		this.suid = suid;
		this.suname = suname;
		this.sufield = sufield;
		this.semester = semester;
		this.grade = grade;
		this.retry = retry;
	}
	
	public String getSuname() {
		return suname;
	}

	public void setSuname(String suname) {
		this.suname = suname;
	}

	public String getSufield() {
		return sufield;
	}

	public void setSufield(String sufield) {
		this.sufield = sufield;
	}

	public int getStid() {
		return stid;
	}
	public void setStid(int stid) {
		this.stid = stid;
	}
	public String getSuid() {
		return suid;
	}
	public void setSuid(String suid) {
		this.suid = suid;
	}
	public String getSemester() {
		return semester;
	}
	public void setSemester(String semester) {
		this.semester = semester;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public int getRetry() {
		return retry;
	}
	public void setRetry(int retry) {
		this.retry = retry;
	}
}
