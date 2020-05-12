package contribution.model;

import java.util.Date;

public class QandADto {

	private int board_idx;
	private int user_idx;
	private String subject;
	private String content;
	private Date register_date;
	private int status_id;
	private String answer;

	public QandADto() {
	}

	public QandADto(int board_idx, int user_idx, String subject, String content, Date register_date,
			int status_id, String answer) {
		super();
		this.board_idx = board_idx;
		this.user_idx = user_idx;
		this.subject = subject;
		this.content = content;
		this.register_date = register_date;
		this.status_id = status_id;
		this.answer = answer;
	}

	public int getBoard_idx() {
		return board_idx;
	}

	public void setBoard_idx(int board_idx) {
		this.board_idx = board_idx;
	}

	public int getUser_idx() {
		return user_idx;
	}

	public void setUser_idx(int user_idx) {
		this.user_idx = user_idx;
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

	public int getStatus_id() {
		return status_id;
	}

	public void setStatus_id(int status_id) {
		this.status_id = status_id;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

}
