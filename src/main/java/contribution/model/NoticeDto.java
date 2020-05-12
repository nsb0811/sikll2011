package contribution.model;

import java.util.Date;

public class NoticeDto {

	private int notice_idx;
	private String subject;
	private String content;
	private Date register_date;
	private int readcount;

	public NoticeDto() {}

	public NoticeDto(int notice_idx, String subject, String content, Date register_date, int readcount) {
		super();
		this.notice_idx = notice_idx;
		this.subject = subject;
		this.content = content;
		this.register_date = register_date;
		this.readcount = readcount;
	}

	public int getNotice_idx() {
		return notice_idx;
	}

	public void setNotice_idx(int notice_idx) {
		this.notice_idx = notice_idx;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getRegister_date() {
		return register_date;
	}

	public void setRegister_date(Date register_date) {
		this.register_date = register_date;
	}

	public int getReadcount() {
		return readcount;
	}

	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}

}
