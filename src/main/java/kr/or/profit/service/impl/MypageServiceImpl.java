package kr.or.profit.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import kr.or.profit.mapper.MypageMapper;
import kr.or.profit.service.MypageService;
import kr.or.profit.vo.AttachFileVO;
import kr.or.profit.vo.ProcessVO;

@Service("mypageService")
public class MypageServiceImpl extends EgovAbstractServiceImpl implements MypageService{
	
	@Resource(name="mypageMapper")
	private MypageMapper mypageDAO;

	//회원기본정보조회
	@Override
	public List<Map<String, String>> selectMemberInfo(String memberId) throws Exception {
		return mypageDAO.selectMemberInfo(memberId);
	}
	
	//프로세스정보추가
	@Override
	public int insertProcess(ProcessVO vo) throws Exception {
		return mypageDAO.insertProcess(vo);
	}

	//파일 추가
	@Override
	public int insertProcessFile(Map map) throws Exception {
		return mypageDAO.insertProcessFile(map);
	}

	


}
