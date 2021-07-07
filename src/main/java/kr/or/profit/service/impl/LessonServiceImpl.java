package kr.or.profit.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.profit.mapper.LessonMapper;
import kr.or.profit.service.LessonService;
import kr.or.profit.vo.AttachFileVO;
import kr.or.profit.vo.BookgoodVO;
import kr.or.profit.vo.BuyLessonVO;
import kr.or.profit.vo.LessonDetailVO;
import kr.or.profit.vo.LessonVO;
import kr.or.profit.vo.ReplyVO;

@Service("lessonService")
public class LessonServiceImpl implements LessonService {
	
	@Resource(name= "lessonMapper")
	private LessonMapper lessonDAO;
	
	
	//강의 등록
	@Override
	public int insertLesson(LessonVO vo) throws Exception {
		return  lessonDAO.insertLesson(vo);
	}

	//강의 수정
	@Override
	public int updateLesson(LessonVO vo) throws Exception {
		return lessonDAO.updateLesson(vo);
	}

	//강의 목록조회
	@Override
	public List<?> selectLessonList(Map<String, Object> map) throws Exception {
		System.out.println("map : " + map);
		return lessonDAO.selectLessonList(map);
	}

	//강의 상세조회
	@Override
	public Map<String, Object> selectLessonDetail(LessonVO vo) throws Exception {
		return lessonDAO.selectLessonDetail(vo);
	}

	//강의 삭제(비활성화여부)
	@Override
	public int deleteLesson(LessonVO vo) throws Exception {
		return lessonDAO.deleteLesson(vo);
		
	}

	//강의 파일 추가
	@Override
	public int insertLessonFile(Map map) throws Exception {
		return lessonDAO.insertLessonFile(map);
	}

	//강의 파일 수정
	@Override
	public int updateLessonFile(Map map) throws Exception {
		return lessonDAO.updateLessonFile(map);
	}

	//인기강의 조회
	@Override
	public List<?> selectTopLessonList() throws Exception {
		return lessonDAO.selectTopLessonList();
	}

	//상세 강의 파일등록
	@Override
	public int insertClassFile(Map map) throws Exception {
		return lessonDAO.insertClassFile(map);
	}

	//상세 강의 등록
	@Override
	public int insertClass(LessonDetailVO vo) throws Exception {
		return  lessonDAO.insertClass(vo);
		
	}

	//상세강의 목록 조회
	@Override
	public List<?> selectClassList(String lessonSeq) throws Exception {
		return lessonDAO.selectClassList(lessonSeq);
	}

	//상세강의 디테일 조회
	@Override
	public Map<String, Object> selectclassDetail(LessonDetailVO vo) throws Exception {
		return lessonDAO.selectclassDetail(vo);
	}

	//상세강의 삭제
	@Override
	public int deleteClass(LessonDetailVO vo) throws Exception {
		return lessonDAO.deleteClass(vo);
	}

	//카테고리 선택하면 리스트
	@Override
	public List<?> selectCateLessonList(Map<String, Object> map) throws Exception {
		return lessonDAO.selectCateLessonList(map);
	}

	@Override
	public List<?> selectLessonList() throws Exception {
		return lessonDAO.selectLessonList();
	}

	//자유게시판 상세 댓글 나의 프로필 사진 조회
	@Override
	public String selectMyProfile(String memberId) throws Exception {
		return lessonDAO.selectMyProfile(memberId);
	}

	//강의 댓글 리스트 가져오기
	@Override
	public List<Map<String, Object>> selectReplyList(String lessonSeq) throws Exception {
		return lessonDAO.selectReplyList(lessonSeq);
	}

	//강의 댓글 추가
	@Override
	public int insertLessonReply(ReplyVO replyvo) throws Exception {
		return lessonDAO.insertLessonReply(replyvo);
	}
	
	//강의 상세 답글 추가
	@Override
	public int insertLessonRereply(ReplyVO replyvo) throws Exception {
		return lessonDAO.insertLessonRereply(replyvo);
	}

	//강의 댓글 삭제
	@Override
	public int deleteLessonReply(String replySeq) throws Exception {
		return lessonDAO.deleteLessonReply(replySeq);
	}

	//조회수 증가
	@Override
	public int increaseLessonHit(String lessonSeq) throws Exception {
		return lessonDAO.increaseLessonHit(lessonSeq);
	}

	// 좋아요북마크 추가
	@Override
	public int insertLessonBookgood(BookgoodVO vo) throws Exception {
		return lessonDAO.insertLessonBookgood(vo);
	}

	//좋아요북마크 개수 가져오기
	@Override
	public int selectLessonBookgoodCnt(BookgoodVO vo) throws Exception {
		return lessonDAO.selectLessonBookgoodCnt(vo);
	}

	//좋아요북마크 제거
	@Override
	public int deleteLessonBookgood(BookgoodVO vo) throws Exception {
		return lessonDAO.deleteLessonBookgood(vo);
	}

	//강의 구매 추가
	@Override
	public int insertBuyLesson(BuyLessonVO buyLessonVO) throws Exception {
		return lessonDAO.insertBuyLesson(buyLessonVO);
	}

	//강의 구매한 사람이 있는지 확인
	@Override
	public int selectBuyLesson(String memberId) throws Exception {
		return lessonDAO.selectBuyLesson(memberId);
	}

	//트레이너인지 확인
	@Override
	public int checkTrainer(String memberId) throws Exception {
		return lessonDAO.checkTrainer(memberId);
	}

	




	
	


	

}
