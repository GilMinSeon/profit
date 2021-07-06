package kr.or.profit.web;

import java.io.PrintWriter;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.profit.service.RecipeService;

@Controller
public class RecipeController {

	@Resource(name = "recipeService")
	private RecipeService recipeService;

	/**
	    * 레시피 목록(recipeList)
	    * @author 박상빈
	    * @param model
	    * @return String - community/boardAdd
	    * @throws Exception
	    */
	@RequestMapping(value = "recipeList.do", method = RequestMethod.GET)
	public String recipeList(@RequestParam Map<String, Object> map, Model model) throws Exception {
		System.out.println("목록옴");
		List<?> recipeList = recipeService.recipeList();
		System.out.println("recipeList = " + recipeList);

		model.addAttribute("data", recipeList);
		return "community/recipeList";
	}

	/**
	    * 레시피 상세보기(recipeDetail)
	    * @author 박상빈
	    * @param model
	    * @return String - community/recipeDetail
	    * @throws Exception
	    */
	@RequestMapping(value = "recipeDetail.do", method = RequestMethod.GET)
	public String recipeDetail(@RequestParam Map<String, Object> map, Model model) throws Exception {
		System.out.println("상세옴여기  = " + map);
		Map<String, Object> recipeDetail = recipeService.recipeDetail(map);
		recipeCommonHit(map);
		System.out.println("돌아옴 = " + recipeDetail);


		model.addAttribute("data", recipeDetail);
		return "community/recipeDetail";
	}

	/**
	    * 레시피 등록(recipeAdd)GET
	    * @author 박상빈
	    * @param model
	    * @return String - community/boardAdd
	    * @throws Exception
	    */
	@RequestMapping(value = "recipeAdd.do", method = RequestMethod.GET)
	public String recipeAdd(@RequestParam Map<String, Object> map, Model model) throws Exception {
		System.out.println("등록옴" + map);

		return "community/recipeAdd";
	}

	/**
	 * 레시피 등록(recipeAdd)POST
	 * @author 박상빈
	 * @param model
	 * @return String - community/boardAdd
	 * @throws Exception
	 */
	@RequestMapping(value = "recipeAdd.do", method = RequestMethod.POST)
	public void recipeAddInsert(@RequestParam Map<String, Object> map, HttpSession ssion, HttpServletResponse response,  Model model) throws Exception {
		System.out.println("등록Insert옴" + map);
		map.put("memberId", ssion.getAttribute("memberId"));

		map.put("fileSeq", "./resources/img/common/loading.gif");
		System.out.println("map =  " + map);
		int recipeAddInsert = recipeService.recipeAddInsert(map);
		System.out.println("recipeAddInsert =  " + recipeAddInsert);

		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<script>alert('레시피가 등록 되었습니다'); location.href='recipeList.do';</script>");
		out.flush();
	}

	/**
	    * 레시피 수정(recipeMod)GET
	    * @author 박상빈
	    * @param model
	    * @return String - community/boardAdd
	    * @throws Exception
	    */
	@RequestMapping(value = "recipeMod.do", method = RequestMethod.GET)
	public String recipeMod(@RequestParam Map<String, Object> map, Model model) throws Exception {
		System.out.println("수정옴" + map);
		Map<String, Object> recipeDetail = recipeService.recipeDetail(map);
		System.out.println("수정 돌아옴 = " + recipeDetail);
		model.addAttribute("data", recipeDetail);
		return "community/recipeMod";
	}

	/**
	    * 레시피 수정(recipeMod)POST
	    * @author 박상빈
	    * @param model
	    * @return String - community/boardAdd
	    * @throws Exception
	    */
	@RequestMapping(value = "recipeMod.do", method = RequestMethod.POST)
	public void recipeModUpdate(@RequestParam Map<String, Object> map, HttpServletResponse response, Model model) throws Exception {
		System.out.println("수정하러 옴" + map);
		int recipeModUpdate = recipeService.recipeModUpdate(map);
		System.out.println("수정하고 옴" + recipeModUpdate);

		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<script>alert('레시피가 수정 되었습니다'); location.href='recipeList.do';</script>");
		out.flush();
	}

	/**
	    * 레시피 삭제(recipeDelete)
	    * @author 박상빈
	    * @param model
	    * @return String - community/boardAdd
	    * @throws Exception
	    */
	@RequestMapping(value = "recipeDelete.do", method = RequestMethod.GET)
	public void recipeDelete(@RequestParam Map<String, Object> map, Model model, HttpServletResponse response) throws Exception {
		System.out.println("삭제옴" + map);
		int recipeDelete = recipeService.recipeDelete(map);
		System.out.println("삭제하고 옴" + recipeDelete);

		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<script>alert('레시피가 삭제 되었습니다');location.href='recipeList.do';</script>");
		out.flush();
	}

	/**
    * 조회수 증가(recipeCommonHit)
    * @author 박상빈
    * @param map
    * @return
    * @throws Exception
    */
	public void recipeCommonHit(Map<String, Object> map) throws Exception {
		System.out.println("조회수옴" + map);
		int recipeCommonHit = recipeService.recipeCommonHit(map);
		System.out.println("조회수 작동함" + recipeCommonHit);

	}

	/**
	 * 레시피 댓글 등록(recipeReply)
	 * @author 박상빈
	 * @param map
	 * @return
	 * @throws Exception
	 */

	@RequestMapping(value = "recipeReplyInsert.do", method = RequestMethod.POST)
	@ResponseBody
	public String recipeReply(@RequestParam Map<String, Object> map, Model model) throws Exception {
		System.out.println("댓글옴" + map);
		int recipeReply = recipeService.recipeReply(map);
		System.out.println("댓글추가 하고 옴 = " + recipeReply);

		String msg = "ng";
		System.out.println("msg = " + msg);

		if(recipeReply > 0) {
			msg = "ok";
		}
		System.out.println("msg = " + msg);
		return msg;
	}


}
