package contribution.model;

import java.sql.Timestamp;
import java.util.Date;

public class Comment {

	
	String organization_id;
	int program_id;
	int user_idx;
	Timestamp comment_id;
	String content;
	Date register_date;
	int report_notify_flg;
	
	
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
	public Timestamp getComment_id() {
		return comment_id;
	}
	public void setComment_id(Timestamp comment_id) {
		this.comment_id = comment_id;
	}
	
	public Date getRegister_date() {
		return register_date;
	}
	public void setRegister_date(Date register_date) {
		this.register_date = register_date;
	}
	public int getReport_notify_flg() {
		return report_notify_flg;
	}
	public void setReport_notify_flg(int report_notify_flg) {
		this.report_notify_flg = report_notify_flg;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	@Override
	public String toString() {
		return "Comment [organization_id=" + organization_id + ", program_id=" + program_id + ", user_idx=" + user_idx
				+ ", comment_id=" + comment_id + ", content=" + content + ", register_date=" + register_date
				+ ", report_notify_flg=" + report_notify_flg + "]";
	}
	
	
	
}
