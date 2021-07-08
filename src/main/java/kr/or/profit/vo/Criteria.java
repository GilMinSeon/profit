package kr.or.profit.vo;

//페이징처리에 필요한 클래스 1번
//시작값과 끝값을 다루는 클래스
public class Criteria {
	private int page;
	private int perPageNum;
	private int rowStart;
	private int rowEnd;
	private String memberId; //북마크좋아요 때문에 추가
	
	//검색
	private String selCate;
	private String selLev;
	private String keyword;
	
	//북마크
	private String commonSeq;
	
	//온라인클래스 상세
	private String lessonSeq;

	public String getLessonSeq() {
		return lessonSeq;
	}

	public void setLessonSeq(String lessonSeq) {
		this.lessonSeq = lessonSeq;
	}

	public String getCommonSeq() {
		return commonSeq;
	}

	public void setCommonSeq(String commonSeq) {
		this.commonSeq = commonSeq;
	}

	public String getSelCate() {
		return selCate;
	}

	public void setSelCate(String selCate) {
		this.selCate = selCate;
	}

	public String getSelLev() {
		return selLev;
	}

	public void setSelLev(String selLev) {
		this.selLev = selLev;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public void setRowStart(int rowStart) {
		this.rowStart = rowStart;
	}

	public void setRowEnd(int rowEnd) {
		this.rowEnd = rowEnd;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public Criteria() {
		this.page = 1;
		this.perPageNum = 9; //한 페이지에 보여줄 게시물 수
	}

	public void setPage(int page) {
		if (page <= 0) {
			this.page = 1;
			return;
		}
		this.page = page;
	}

	public void setPerPageNum(int perPageNum) {
		if (perPageNum <= 0 || perPageNum > 100) {
			this.perPageNum = 10;
			return;
		}
		this.perPageNum = perPageNum;
	}

	public int getPage() {
		return page;
	}

	public int getPageStart() {
		return (this.page - 1) * perPageNum;
	}

	public int getPerPageNum() {
		return this.perPageNum;
	}

	public int getRowStart() {
		rowStart = ((page - 1) * perPageNum) + 1;
		return rowStart;
	}

	public int getRowEnd() {
		rowEnd = rowStart + perPageNum - 1;
		return rowEnd;
	}
}