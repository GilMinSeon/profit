package kr.or.profit.service;

import java.util.List;
import java.util.Map;

public interface MypageService {
	
	//회원기본정보조회
	public List<Map<String, String>> selectMemberInfo(String memberId) throws Exception;
}
