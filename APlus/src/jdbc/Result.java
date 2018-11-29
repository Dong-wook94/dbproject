package jdbc;

public class Result {
	
	int stid;
	String suid;
	String semester;
	String grade;
	int retry;
	
	public Result(int stid, String suid, String semester, String grade, int retry) {
		super();
		this.stid = stid;
		this.suid = suid;
		this.semester = semester;
		this.grade = grade;
		this.retry = retry;
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
