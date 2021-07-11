package kr.or.profit.service;

import java.util.List;
import java.util.Map;

public interface NoticeService {

	int noticeInsert(Map<String, Object> map) throws Exception;

	List<?> noticeList(Map<String, Object> map) throws Exception;

	int noticeCommonHit(Map<String, Object> map) throws Exception;

	Map<String, Object> noticeDetail(Map<String, Object> map) throws Exception;

	int noticeModUpdate(Map<String, Object> map) throws Exception;

	int noticeDelete(Map<String, Object> map) throws Exception;

	int noticeFileUpload(Map<String, Object> map) throws Exception;

	String noticeFileCnt() throws Exception;



}
