package kr.or.profit.service;

import java.util.List;
import java.util.Map;

import kr.or.profit.vo.AttachFileVO;
import kr.or.profit.vo.BookgoodVO;
import kr.or.profit.vo.BuyLessonVO;
import kr.or.profit.vo.Criteria;
import kr.or.profit.vo.LessonDetailVO;
import kr.or.profit.vo.LessonVO;
import kr.or.profit.vo.ReplyVO;

public interface LessonService {


	//강의등록
	public int insertLesson(LessonVO vo) throws Exception;

	//강의 목록조회 ->나중에 페이징처리하기
	public List<?> selectLessonList(Criteria cri) throws Exception;

	//강의 상세조회
	public Map<String, Object> selectLessonDetail(LessonVO lessonVO) throws Exception;

	//강의 상세 댓글 나의 프로필 사진 조회
	public String selectMyProfile(String memberId) throws Exception;
	
	//강의수정
	public int updateLesson(LessonVO lessonVO) throws Exception;

	//강의 삭제
	public int deleteLesson(LessonVO lessonVO) throws Exception;


	//강의 파일 추가
	public int insertLessonFile(Map map) throws Exception;

	//강의 파일 수정
	public int updateLessonFile(Map map) throws Exception;

	//인기강의 조회
	public List<?> selectTopLessonList()throws Exception;

	//상세 강의 파일등록
	public int insertClassFile(Map map) throws Exception;

	//상세 강의 등록
	public int insertClass(LessonDetailVO vo) throws Exception;

	//상세강의 목록조회
	public List<?> selectClassList(String lessonSeq) throws Exception;

	//상세강의 디테일조회
	public Map<String, Object> selectclassDetail(LessonDetailVO lDetailVO) throws Exception;

	//상세강의 삭제
	public int deleteClass(LessonDetailVO vo) throws Exception;
	
	//카테고리 선택하면 리스트
	public List<?> selectCateLessonList(Map<String, Object> map) throws Exception;

	public List<?> selectLessonList() throws Exception;
	
	//강의 댓글 리스트 가져오기
	public List<Map<String, Object>> selectReplyList(String lessonSeq) throws Exception;
	
	//강의 댓글 추가
	public int insertLessonReply(ReplyVO replyvo) throws Exception;

	//강의 상세 답글 추가
	public int insertLessonRereply(ReplyVO replyvo) throws Exception;

	//강의 상세 댓글 삭제
	public int deleteLessonReply(String replySeq) throws Exception;

	//조회수 증가
	public int increaseLessonHit(String lessonSeq) throws Exception;

	//좋아요북마크 추가
	public int insertLessonBookgood(BookgoodVO vo) throws Exception;

	//좋아요북마크 개수 가져오기
	public int selectLessonBookgoodCnt(BookgoodVO vo) throws Exception;

	//좋아요북마크 제거
	public int deleteLessonBookgood(BookgoodVO vo) throws Exception;

	//강의 구매추가
	public int insertBuyLesson(BuyLessonVO buyLessonVO) throws Exception;

	//강의 구매한 사람이 있는지 확인
	public int selectBuyLesson(String memberId) throws Exception;

	//트레이너인지 확인
	public int checkTrainer(String memberId) throws Exception;

	//페이징 - 온라인클래스 전체 글 개수 
	public int selectLessonCnt(Criteria cri) throws Exception;






	
	
}
