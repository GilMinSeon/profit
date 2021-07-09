package kr.or.profit.mapper;

import java.util.List;
import java.util.Map;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("recipeMapper")
public interface RecipeMapper {

	List<?> recipeList() throws Exception;

	int recipeAddInsert(Map<String, Object> map) throws Exception;

	Map<String, Object> recipeDetail(Map<String, Object> map) throws Exception;

	int recipeModUpdate(Map<String, Object> map) throws Exception;

	int recipeDelete(Map<String, Object> map) throws Exception;

	int recipeCommonHit(Map<String, Object> map) throws Exception;

	int recipeReply(Map<String, Object> map) throws Exception;

	List<?> recipeDetailReply(Map<String, Object> map) throws Exception;

	int recipeReplyDelete(Map<String, Object> map) throws Exception;

	int recipeReplyAdd(Map<String, Object> map) throws Exception;

	List<?> recipeDetailReplyList(Map<String, Object> map) throws Exception;

	Map<String, Object> recipeDetailMember(Map<String, Object> map) throws Exception;

	int imgFile(Object object) throws Exception;

	String imgcnt() throws Exception;

	List<?> recipeTopList() throws Exception;


}
