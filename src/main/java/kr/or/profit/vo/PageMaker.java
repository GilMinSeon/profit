package kr.or.profit.vo;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;
//페이징처리에 필요한 클래스 2번
public class PageMaker {

	private int totalCount; // 게시물의 총개수
	private int startPage; // 현재 페이지의 시작번호
	private int endPage; // 현재 페이지의 끝 번호
	private boolean prev; // 이전 페이지로 이동하는 링크의 존재 여부
	private boolean next; // 다음 페이지로 이동하는 링크의 존재여부
	
	//페이지 1,2,3,4,5 5개로 제한하는 곳
	private int displayPageNum = 5;

	private Criteria cri;

	public void setCri(Criteria cri) {
		this.cri = cri;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		calcData();
	}

	public int getTotalCount() {
		return totalCount;
	}

	public int getStartPage() {
		return startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public boolean isPrev() {
		return prev;
	}

	public boolean isNext() {
		return next;
	}

	public int getDisplayPageNum() {
		return displayPageNum;
	}

	public Criteria getCri() {
		return cri;
	}
	
	//계산하는 메서드
	private void calcData() {
		endPage = (int) (Math.ceil(cri.getPage() / (double) displayPageNum) * displayPageNum);
		startPage = (endPage - displayPageNum) + 1;

		int tempEndPage = (int) (Math.ceil(totalCount / (double) cri.getPerPageNum()));
		if (endPage > tempEndPage) {
			endPage = tempEndPage;
		}
		prev = startPage == 1 ? false : true;
		next = endPage * cri.getPerPageNum() >= totalCount ? false : true;
	}
	
	//url 만드는 메서드
	public String makeQuery(int page) {
		UriComponents uriComponents = 
				UriComponentsBuilder.newInstance()
				.queryParam("page", page)
				.queryParam("selCate", cri.getSelCate())
				.queryParam("selLev", cri.getSelLev())
				.queryParam("keyword", cri.getKeyword())
				.query("#location123")
				.build();

		return uriComponents.toUriString();
	}

}