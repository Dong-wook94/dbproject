package jdbc;

public class Subject {

	String suid;
	String semester;
	int eid;
	String sufield;
	int credit;
	int dcredit;
	int necessary;
	public Subject(String suid, String semester, int eid, String sufield, int credit, int dcredit, int necessary) {
		super();
		this.suid = suid;
		this.semester = semester;
		this.eid = eid;
		this.sufield = sufield;
		this.credit = credit;
		this.dcredit = dcredit;
		this.necessary = necessary;
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
	public int getEid() {
		return eid;
	}
	public void setEid(int eid) {
		this.eid = eid;
	}
	public String getSufield() {
		return sufield;
	}
	public void setSufield(String sufield) {
		this.sufield = sufield;
	}
	public int getCredit() {
		return credit;
	}
	public void setCredit(int credit) {
		this.credit = credit;
	}
	public int getDcredit() {
		return dcredit;
	}
	public void setDcredit(int dcredit) {
		this.dcredit = dcredit;
	}
	public int getNecessary() {
		return necessary;
	}
	public void setNecessary(int necessary) {
		this.necessary = necessary;
	}
	
}
