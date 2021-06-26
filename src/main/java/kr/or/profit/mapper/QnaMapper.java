package kr.or.profit.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import kr.or.profit.vo.MemberVO;

//	QnaMapper와 Qna_SQL.xml 연결해준다 (QnaMapper 연결만할뿐 Qna_SQL.xml에서 작업이이루어진다.)
@Mapper("qnaMapper")
public interface QnaMapper {
	
//	vo로 한번에 한줄을 위해 사용
	MemberVO selectQna(Map<String,Object> map) throws Exception;
	
//	list로 모두 가지고온다.
	List<String> selectQnaList() throws Exception;
	
	
	

}
