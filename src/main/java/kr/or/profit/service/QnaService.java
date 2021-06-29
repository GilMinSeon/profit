package kr.or.profit.service;

import java.util.List;
import java.util.Map;

public interface QnaService {

	List<?> qnaList() throws Exception;

	int qnaInsert(Map<String, Object> map) throws Exception;

}
