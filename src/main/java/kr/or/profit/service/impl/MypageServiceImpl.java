package kr.or.profit.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import kr.or.profit.mapper.MypageMapper;
import kr.or.profit.service.MypageService;
import kr.or.profit.vo.ProcessVO;

@Service("mypageService")
public class MypageServiceImpl extends EgovAbstractServiceImpl implements MypageService{
	
	@Resource(name="mypageMapper")
	private MypageMapper mypageMapper;

	//회원기본정보조회
	@Override
	public List<Map<String, String>> selectMemberInfo(String memberId) throws Exception {
		return mypageMapper.selectMemberInfo(memberId);
	}

	@Override
	public int insertProcess(ProcessVO vo) throws Exception {
		return mypageMapper.insertProcess(vo);
	}

	


}
