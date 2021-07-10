package kr.or.profit.mapper;

import java.util.List;
import java.util.Map;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("noticeMapper")
public interface NoticeMapper {

	int noticeInsert(Map<String, Object> map) throws Exception;

	List<?> noticeList(Map<String, Object> map) throws Exception;

	int noticeCommonHit(Map<String, Object> map) throws Exception;

	Map<String, Object> noticeDetail(Map<String, Object> map) throws Exception;

	int noticeModUpdate(Map<String, Object> map) throws Exception;

	int noticeDelete(Map<String, Object> map) throws Exception;

	int noticeFileUpload(Map<String, Object> map) throws Exception;

	String noticeFileCnt() throws Exception;
}
