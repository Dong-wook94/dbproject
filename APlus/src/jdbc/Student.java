package jdbc;

public class Student {

	int stid;
	String stname;
	String stpass;
	String major;
	int styear;
	double avg_grade;
	public Student(int stid, String stname, String stpass, String major, int styear, double avg_grade) {
		super();
		this.stid = stid;
		this.stname = stname;
		this.stpass = stpass;
		this.major = major;
		this.styear = styear;
		this.avg_grade = avg_grade;
	}
	public int getStid() {
		return stid;
	}
	public void setStid(int stid) {
		this.stid = stid;
	}
	public String getStname() {
		return stname;
	}
	public void setStname(String stname) {
		this.stname = stname;
	}
	public String getStpass() {
		return stpass;
	}
	public void setStpass(String stpass) {
		this.stpass = stpass;
	}
	public String getMajor() {
		return major;
	}
	public void setMajor(String major) {
		this.major = major;
	}
	public int getStyear() {
		return styear;
	}
	public void setStyear(int styear) {
		this.styear = styear;
	}
	public double getAvg_grade() {
		return avg_grade;
	}
	public void setAvg_grade(double avg_grade) {
		this.avg_grade = avg_grade;
	}
	
	
}
