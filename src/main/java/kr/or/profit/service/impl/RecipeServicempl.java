package kr.or.profit.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.profit.mapper.QnaMapper;
import kr.or.profit.mapper.RecipeMapper;
import kr.or.profit.service.QnaService;
import kr.or.profit.service.RecipeService;

@Service("recipeService")
public class RecipeServicempl implements RecipeService {

	@Resource(name = "recipeMapper")
	private RecipeMapper mapper;

	//글목록
	@Override
	public List<?> recipeList() throws Exception {
		System.out.println("서비스옴 = ");
		return mapper.recipeList();
	}
	//글등록
	@Override
	public int recipeAddInsert(Map<String, Object> map) throws Exception {
		System.out.println("서비스옴 = " + map);
		return mapper.recipeAddInsert(map);
	}
	//글상세보기
	@Override
	public Map<String, Object> recipeDetail(Map<String, Object> map) throws Exception {
		System.out.println("서비스옴 = " + map);
		return mapper.recipeDetail(map);
	}
	//글수정
	@Override
	public int recipeModUpdate(Map<String, Object> map) throws Exception {
		System.out.println("서비스옴 = " + map);
		return mapper.recipeModUpdate(map);
	}
	//글삭제
	@Override
	public int recipeDelete(Map<String, Object> map) throws Exception {
		System.out.println("서비스옴(삭제) = " + map);
		return mapper.recipeDelete(map);
	}
	//조회수
	@Override
	public int recipeCommonHit(Map<String, Object> map) throws Exception {
		return mapper.recipeCommonHit(map);
	}
	@Override
	public int recipeReply(Map<String, Object> map) throws Exception {
		return mapper.recipeReply(map);
	}

}
