package kr.or.profit.service;

import kr.or.profit.vo.AttachFileVO;

public interface AttachFileService {

	//파일 등록
	public int insertLessonFile(AttachFileVO fileVO) throws Exception;
}
