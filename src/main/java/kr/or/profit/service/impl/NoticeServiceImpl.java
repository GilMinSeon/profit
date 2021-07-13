package kr.or.profit.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.profit.mapper.NoticeMapper;
import kr.or.profit.service.NoticeService;

@Service("noticeService")
public class NoticeServiceImpl implements NoticeService{

	@Resource(name = "noticeMapper")
	private NoticeMapper mapper;

	//글등록
	@Override
	public int noticeInsert(Map<String, Object> map) throws Exception {
		return mapper.noticeInsert(map);
	}
	//글목록
	@Override
	public List<?> noticeList(Map<String, Object> map) throws Exception {
		return mapper.noticeList(map);
	}
	//글상세 보기
	@Override
	public Map<String, Object> noticeDetail(Map<String, Object> map) throws Exception {
		return mapper.noticeDetail(map);
	}
	//글 수정
	@Override
	public int noticeModUpdate(Map<String, Object> map) throws Exception {
		return mapper.noticeModUpdate(map);
	}
	//글 삭제
	@Override
	public int noticeDelete(Map<String, Object> map) throws Exception {
		return mapper.noticeDelete(map);
	}
	//조회수 증가
	@Override
	public int noticeCommonHit(Map<String, Object> map) throws Exception {
		return mapper.noticeCommonHit(map);
	}

	//파일 저장
	@Override
	public int noticeFileUpload(Map<String, Object> map) throws Exception {
		System.out.println("파일 저장 서비스옴" + map);
		return mapper.noticeFileUpload(map);

	}

	//파일 번호
	@Override
	public String noticeFileCnt() throws Exception {
		System.out.println("파일 번호 서비스옴");
		return mapper.noticeFileCnt();
	}

	//파일 다운로드
	@Override
	public Map<String, Object> qnaProfileDownload(Map<String, Object> map) throws Exception {
		return mapper.qnaProfileDownload(map);
	}

	//파일 삭제
	@Override
	public int noticeModDelFile(Map<String, Object> map) throws Exception {
		System.out.println("서비스 파일 삭제옴");
		return mapper.noticeModDelFile(map);
	}




}
