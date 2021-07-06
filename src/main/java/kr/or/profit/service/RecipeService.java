package kr.or.profit.service;

import java.util.List;
import java.util.Map;

public interface RecipeService {

	List<?> recipeList() throws Exception;

	int recipeAddInsert(Map<String, Object> map) throws Exception;

	Map<String, Object> recipeDetail(Map<String, Object> map) throws Exception;

	int recipeModUpdate(Map<String, Object> map) throws Exception;

	int recipeDelete(Map<String, Object> map) throws Exception;

	int recipeCommonHit(Map<String, Object> map) throws Exception;

	int recipeReply(Map<String, Object> map) throws Exception;



}
