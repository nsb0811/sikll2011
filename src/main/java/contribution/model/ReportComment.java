package contribution.model;

import java.sql.Timestamp;

public class ReportComment {

	String organization_id;
	int program_id;
	int user_idx;
	Timestamp comment_id;
	int reporter_idx;
	
	
	public String getOrganization_id() {
		return organization_id;
	}
	public void setOrganization_id(String organization_id) {
		this.organization_id = organization_id;
	}
	public int getProgram_id() {
		return program_id;
	}
	public void setProgram_id(int program_id) {
		this.program_id = program_id;
	}
	public int getUser_idx() {
		return user_idx;
	}
	public void setUser_idx(int user_idx) {
		this.user_idx = user_idx;
	}

	public int getReporter_idx() {
		return reporter_idx;
	}
	public void setReporter_idx(int reporter_idx) {
		this.reporter_idx = reporter_idx;
	}
	
	public Timestamp getComment_id() {
		return comment_id;
	}
	public void setComment_id(Timestamp comment_id) {
		this.comment_id = comment_id;
	}

	
}
