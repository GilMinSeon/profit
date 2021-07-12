package kr.or.profit.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.profit.mapper.AdminMemberMapper;
import kr.or.profit.service.AdminMemberService;
import kr.or.profit.vo.AttachFileVO;
import kr.or.profit.vo.Criteria;
import kr.or.profit.vo.ProcessVO;

@Service("adminMemberService")
public class AdminMemberServiceImpl implements AdminMemberService {

	@Resource(name = "adminMemberMapper")
	private AdminMemberMapper adminMemberMapper;

	@Override
	public ProcessVO selectProcessNumberList() throws Exception {
		return adminMemberMapper.selectProcessNumberList();
	}

	@Override
	public List<Map<String, Object>> selectProcessList(Criteria cri) throws Exception {
		return adminMemberMapper.selectProcessList(cri);
	}

	@Override
	public int selectProcessListCnt(Criteria cri) throws Exception {
		return adminMemberMapper.selectProcessListCnt(cri);
	}

	@Override
	public int updateStatusB(String processSeq) throws Exception {
		return adminMemberMapper.updateStatusB(processSeq);
	}

	@Override
	public ProcessVO selectProcessDetailBySeq(String processSeq) throws Exception {
		return adminMemberMapper.selectProcessDetailBySeq(processSeq);
	}

	@Override
	public List<?> selectProcessFile(String fileSeq) throws Exception {
		return adminMemberMapper.selectProcessFile(fileSeq);
	}

	@Override
	public int deleteFileDetailSeq(AttachFileVO vo) throws Exception {
		return adminMemberMapper.deleteFileDetailSeq(vo);
	}

	@Override
	public int insertFilebyAdmin(Map map) throws Exception {
		return adminMemberMapper.insertFilebyAdmin(map);
	}

	@Override
	public int updateProcessInfo(ProcessVO vo) throws Exception {
		return adminMemberMapper.updateProcessInfo(vo);
	}

	@Override
	public String selectFileDetailSeq(String fileSeq) throws Exception {
		return adminMemberMapper.selectFileDetailSeq(fileSeq);
	}

	@Override
	public int updateProcessStatus(ProcessVO vo) throws Exception {
		return adminMemberMapper.updateProcessStatus(vo);
	}
	
}
