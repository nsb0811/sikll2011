package contribution.model;

import java.util.Date;

public class ContributionDto {

	private int contribution_history_idx;
	private int user_idx; //회원 id
	private String organization_name; //기관명 
	private String program_name; //프로그램명
	private Date date; //날짜
	private int contribution; //금액
	private String note; //비고
	private int register_type_flg; //등록구분 (자동,수동 등록)
	private String organization_id;
	private int program_id;
	
	@Override
	public String toString() {
		return "ContributionDto [contribution_history_idx=" + contribution_history_idx + ", user_idx=" + user_idx
				+ ", organization_name=" + organization_name + ", program_name=" + program_name + ", date=" + date
				+ ", contribution=" + contribution + ", note=" + note + ", register_type_flg=" + register_type_flg
				+ ", organization_id=" + organization_id + ", program_id=" + program_id + "]";
	}

	public ContributionDto() {}
	
	public ContributionDto(int contribution_history_idx, int user_idx, String organization_name, String program_name,
			Date date,  int contribution, String note, int register_type_flg, String organization_id, int program_id) {
		super();
		this.contribution_history_idx = contribution_history_idx;
		this.user_idx = user_idx;
		this.organization_name = organization_name;
		this.program_name = program_name;
		this.date = date;
	
		this.contribution = contribution;
		this.note = note;
		this.register_type_flg = register_type_flg;
		this.organization_id = organization_id;
		this.program_id = program_id;
	}
	public int getContribution_history_idx() {
		return contribution_history_idx;
	}
	public void setContribution_history_idx(int contribution_history_idx) {
		this.contribution_history_idx = contribution_history_idx;
	}
	public int getUser_idx() {
		return user_idx;
	}
	public void setUser_idx(int user_idx) {
		this.user_idx = user_idx;
	}
	public String getOrganization_name() {
		return organization_name;
	}
	public void setOrganization_name(String organization_name) {
		this.organization_name = organization_name;
	}
	public String getProgram_name() {
		return program_name;
	}
	public void setProgram_name(String program_name) {
		this.program_name = program_name;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}

	public int getContribution() {
		return contribution;
	}
	public void setContribution(int contribution) {
		this.contribution = contribution;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	public int getRegister_type_flg() {
		return register_type_flg;
	}
	public void setRegister_type_flg(int register_type_flg) {
		this.register_type_flg = register_type_flg;
	}
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
	
	
	
}
