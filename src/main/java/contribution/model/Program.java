package contribution.model;

import java.util.Date;

public class Program {

	String organization_id;
	int program_id;
	String program_subject;
	int type_id;
	Date start_date;
	Date end_date;
	int readcount;
	int target_amount;
	String purpose;
	String summary;
	String content;
	String organization_url;
	String bank_name;
	String account;
	String phone_number;
	Date approval_date;
	String representative;
	int approval_flg;
	String banner_file_name;
	String usage_plan;
	String original_file_name;
	
	
	
	public String getBanner_file_name() {
		return banner_file_name;
	}
	public void setBanner_file_name(String banner_file_name) {
		this.banner_file_name = banner_file_name;
	}
	public int getApproval_flg() {
		return approval_flg;
	}
	public void setApproval_flg(int approval_flg) {
		this.approval_flg = approval_flg;
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
	public String getProgram_subject() {
		return program_subject;
	}
	public void setProgram_subject(String program_subject) {
		this.program_subject = program_subject;
	}
	public int getType_id() {
		return type_id;
	}
	public void setType_id(int type_id) {
		this.type_id = type_id;
	}
	public Date getStart_date() {
		return start_date;
	}
	public void setStart_date(Date start_date) {
		this.start_date = start_date;
	}
	public Date getEnd_date() {
		return end_date;
	}
	public void setEnd_date(Date end_date) {
		this.end_date = end_date;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	public int getTarget_amount() {
		return target_amount;
	}
	public void setTarget_amount(int target_amount) {
		this.target_amount = target_amount;
	}
	public String getPurpose() {
		return purpose;
	}
	public void setPurpose(String purpose) {
		this.purpose = purpose;
	}
	public String getSummary() {
		return summary;
	}
	public void setSummary(String summary) {
		this.summary = summary;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getOrganization_url() {
		return organization_url;
	}
	public void setOrganization_url(String organization_url) {
		this.organization_url = organization_url;
	}
	public String getBank_name() {
		return bank_name;
	}
	public void setBank_name(String bank_name) {
		this.bank_name = bank_name;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getPhone_number() {
		return phone_number;
	}
	public void setPhone_number(String phone_number) {
		this.phone_number = phone_number;
	}
	public Date getApproval_date() {
		return approval_date;
	}
	public void setApproval_date(Date approval_date) {
		this.approval_date = approval_date;
	}
	public String getRepresentative() {
		return representative;
	}
	public void setRepresentative(String representative) {
		this.representative = representative;
	}
	public String getUsage_plan() {
		return usage_plan;
	}
	public void setUsage_plan(String usage_plan) {
		this.usage_plan = usage_plan;
	}
	public String getOriginal_file_name() {
		return original_file_name;
	}
	public void setOriginal_file_name(String original_file_name) {
		this.original_file_name = original_file_name;
	}
	
	
	@Override
	public String toString() {
		return "Program [organization_id=" + organization_id + ", program_id=" + program_id + ", program_subject="
				+ program_subject + ", type_id=" + type_id + ", start_date=" + start_date + ", end_date=" + end_date
				+ ", readcount=" + readcount + ", target_amount=" + target_amount + ", purpose=" + purpose
				+ ", summary=" + summary + ", content=" + content + ", organization_url=" + organization_url
				+ ", bank_name=" + bank_name + ", account=" + account + ", phone_number=" + phone_number
				+ ", approval_date=" + approval_date + ", representative=" + representative + ", approval_flg="
				+ approval_flg + ", banner_file_name=" + banner_file_name + ", usage_plan=" + usage_plan + "]";
	}
	

	
	
}
