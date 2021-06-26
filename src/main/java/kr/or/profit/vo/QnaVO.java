package kr.or.profit.vo;

public class QnaVO {

//	sql-mapper-config.xml와 연결
//	resultMap와 연결
	private String question_seq;
	private String lesson_seq;
	private String question_content;
	private String question_del_flag;
	private String question_parent_seq;
	private String question_depth;
	private String question_secret_flag;
	private String in_user_id;
	private String in_date;
	private String up_user_id;
	private String up_date;

	public String getIn_user_id() {
		return in_user_id;
	}

	public void setIn_user_id(String in_user_id) {
		this.in_user_id = in_user_id;
	}

	public String getIn_date() {
		return in_date;
	}

	public void setIn_date(String in_date) {
		this.in_date = in_date;
	}

	public String getUp_user_id() {
		return up_user_id;
	}

	public void setUp_user_id(String up_user_id) {
		this.up_user_id = up_user_id;
	}

	public String getUp_date() {
		return up_date;
	}

	public void setUp_date(String up_date) {
		this.up_date = up_date;
	}

	public String getQuestion_seq() {
		return question_seq;
	}

	public void setQuestion_seq(String question_seq) {
		this.question_seq = question_seq;
	}

	public String getLesson_seq() {
		return lesson_seq;
	}

	public void setLesson_seq(String lesson_seq) {
		this.lesson_seq = lesson_seq;
	}

	public String getQuestion_content() {
		return question_content;
	}

	public void setQuestion_content(String question_content) {
		this.question_content = question_content;
	}

	public String getQuestion_del_flag() {
		return question_del_flag;
	}

	public void setQuestion_del_flag(String question_del_flag) {
		this.question_del_flag = question_del_flag;
	}

	public String getQuestion_parent_seq() {
		return question_parent_seq;
	}

	public void setQuestion_parent_seq(String question_parent_seq) {
		this.question_parent_seq = question_parent_seq;
	}

	public String getQuestion_depth() {
		return question_depth;
	}

	public void setQuestion_depth(String question_depth) {
		this.question_depth = question_depth;
	}

	public String getQuestion_secret_flag() {
		return question_secret_flag;
	}

	public void setQuestion_secret_flag(String question_secret_flag) {
		this.question_secret_flag = question_secret_flag;
	}

}
