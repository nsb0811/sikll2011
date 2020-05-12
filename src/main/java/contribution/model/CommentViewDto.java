package contribution.model;

import java.sql.Timestamp;
import java.util.Date;

public class CommentViewDto {

	String organization_id;
	String program_id;
	int user_idx;
	Timestamp comment_id;
	String content;
	int reporter_idx;
	int block_flg;
	String nickname;
	Date register_date;
	int report_notify_flg;
	int grade;
	int user_type_id;
	
	
	
	
	public int getUser_type_id() {
		return user_type_id;
	}
	public void setUser_type_id(int user_type_id) {
		this.user_type_id = user_type_id;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	public int getReport_notify_flg() {
		return report_notify_flg;
	}
	public void setReport_notify_flg(int report_notify_flg) {
		this.report_notify_flg = report_notify_flg;
	}
	public Date getRegister_date() {
		return register_date;
	}
	public void setRegister_date(Date register_date) {
		this.register_date = register_date;
	}
	public String getOrganization_id() {
		return organization_id;
	}
	public void setOrganization_id(String organization_id) {
		this.organization_id = organization_id;
	}
	public String getProgram_id() {
		return program_id;
	}
	public void setProgram_id(String program_id) {
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
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getReporter_idx() {
		return reporter_idx;
	}
	public void setReporter_idx(int reporter_idx) {
		this.reporter_idx = reporter_idx;
	}
	public int getBlock_flg() {
		return block_flg;
	}
	public void setBlock_flg(int block_flg) {
		this.block_flg = block_flg;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	@Override
	public String toString() {
		return "CommentViewDto [organization_id=" + organization_id + ", program_id=" + program_id + ", user_idx="
				+ user_idx + ", comment_id=" + comment_id + ", content=" + content + ", reporter_idx=" + reporter_idx
				+ ", block_flg=" + block_flg + ", nickname=" + nickname + ", register_date=" + register_date + "]";
	}
	
	
	
	
}
