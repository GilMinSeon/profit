package kr.or.profit.web;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
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

import kr.or.profit.service.CommunityService;
import kr.or.profit.service.RecipeService;
import kr.or.profit.vo.BookgoodVO;
import kr.or.profit.vo.CommunityVO;
import kr.or.profit.vo.Criteria;
import kr.or.profit.vo.PageMaker;
import kr.or.profit.vo.QnaVO;

@Controller
public class RecipeController {

	@Resource(name = "recipeService")
	private RecipeService recipeService;
	@Resource(name = "communityService")
	private CommunityService communityService;

	/**
	 * 레시피 목록(recipeList)
	 *
	 * @author 박상빈
	 * @param model
	 * @return String - community/boardAdd
	 * @throws Exception
	 */
	@RequestMapping(value = "recipeList.do", method = {
			RequestMethod.GET, RequestMethod.POST })
	public String recipeList(Model model, HttpSession ssion, Criteria cri, @RequestParam(value = "selLev", required = false) String selLev, @RequestParam(value = "keyword", required = false) String keyword) throws Exception {

		System.out.println("목록옴");
		String memberId = (String) ssion.getAttribute("memberId");
		if (memberId == null) {
			memberId = "";
		}

		cri.setMemberId(memberId);
		cri.setSelLev(selLev);
		cri.setKeyword(keyword);

		System.out.println("레시피 목록 온다" + memberId);

		//인기글
		List<?> recipeTopList = recipeService.recipeTopList(memberId);
		System.out.println("인기글 돌아옴 recipeTopList = " + recipeTopList);
		model.addAttribute("recipeTopList", recipeTopList);

		//레시피 목록
		List<?> recipeList = recipeService.recipeList(cri);
		System.out.println("레시피 목록 돌아옴 recipeList = " + recipeList);
		model.addAttribute("data", recipeList);

		System.out.println("이곳"+model.toString());
		// 페이징처리
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		// 전체 글 개수 세팅 - 검색결과과 무관하게 페이징 생성 => 수정필요 => 수정 완
		pageMaker.setTotalCount(recipeService.recipeSelectBoardCnt(cri));
		System.out.println(recipeService.recipeSelectBoardCnt(cri) + "가져오는 개수!!!!!!!!!!!!");
		model.addAttribute("pageMaker", pageMaker);


		//입력한 검색어 유지시키기
		model.addAttribute("selLev", selLev);
		model.addAttribute("keyword", keyword);

		return "community/recipeList";
	}
	//	/**
	//	 * 레시피 목록(recipeList)
	//	 *
	//	 * @author 박상빈
	//	 * @param model
	//	 * @return String - community/boardAdd
	//	 * @throws Exception
	//	 */
	//	@RequestMapping(value = "recipeList.do", method = RequestMethod.GET)
	//	public String recipeList(@RequestParam Map<String, Object> map, HttpSession ssion, Model model) throws Exception {
	//		System.out.println("목록옴");
	//		String memberId = (String) ssion.getAttribute("memberId");
	//		if (memberId == null) {
	//			memberId = "";
	//		}
	//
	//		System.out.println("레시피 목록 온다" + memberId);
	//
	//		List<QnaVO> recipeList = recipeService.recipeList(memberId);
	//		List<?> recipeTopList = recipeService.recipeTopList(memberId);
	//
	//		System.out.println("레시피 목록 돌아옴 recipeList = " + recipeList);
	//		System.out.println("인기글 돌아옴 recipeTopList = " + recipeTopList);
	//
	//
	//		model.addAttribute("data", recipeList);
	//		model.addAttribute("recipeTopList", recipeTopList);
	//		return "community/recipeList";
	//	}

	/**
	 * 레시피 상세보기/댓글 목록(recipeDetail)
	 *
	 * @author 박상빈
	 * @param model
	 * @return String - community/recipeDetail
	 * @throws Exception
	 */
	@RequestMapping(value = "recipeDetail.do", method = RequestMethod.GET)
	public String recipeDetail(@RequestParam Map<String, Object> map, HttpSession ssion, Model model) throws Exception {
		map.put("memberId", ssion.getAttribute("memberId"));
		CommunityVO paramVO = new CommunityVO();
		paramVO.setMemberId((String) (map.get("memberId")));
		paramVO.setCommunitySeq((String) (map.get("communitySeq")));
		System.out.println("상세옴여기  = " + map);

		Map<String, Object> recipeDetail = recipeService.recipeDetail(map);
		recipeCommonHit(map);
		List<?> recipeDetailReply = recipeService.recipeDetailReply(map);
		List<?> recipeDetailReplyList = recipeService.recipeDetailReplyList(map);
		Map<String, Object> recipeDetailMember = recipeService.recipeDetailMember(map);
		List<?> recipeNewList = recipeService.recipeNewList();
		List<?> recipeGoodList = recipeService.recipeGoodList();
		Map<String, Object> boardDetail = communityService.selectBoardDetail(paramVO);

		System.out.println("레시피 상세보기 옴 = " + recipeDetail);
		System.out.println("댓글돌아 옴 = " + recipeDetailReply);
		System.out.println("대  댓글돌아옴 = " + recipeDetailReplyList);
		System.out.println("멤버 돌아옴 = " + recipeDetailMember);
		System.out.println("최신글5개 = " + recipeNewList);
		System.out.println("인기글(좋아요)5개 = " + recipeGoodList);
		System.out.println("좋아요/북마크 = " + boardDetail);

		model.addAttribute("data", recipeDetail);
		model.addAttribute("recipeDetailReply", recipeDetailReply);
		model.addAttribute("recipeDetailReplyList", recipeDetailReplyList);
		model.addAttribute("recipeDetailMember", recipeDetailMember);
		model.addAttribute("recipeNewList", recipeNewList);
		model.addAttribute("recipeGoodList", recipeGoodList);
		model.addAttribute("boardDetail", boardDetail);
		return "community/recipeDetail";
	}

	/**
	 * 레시피 등록(recipeAdd)GET
	 *
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
	 *
	 * @author 박상빈
	 * @param model
	 * @return String - community/boardAdd
	 * @throws Exception
	 */
	@RequestMapping(value = "recipeAdd.do", method = RequestMethod.POST)
	public void recipeAddInsert(@RequestParam Map<String, Object> map, HttpSession ssion, HttpServletResponse response, Model model) throws Exception {
		System.out.println("등록Insert옴" + map);
		map.put("memberId", ssion.getAttribute("memberId"));
		String imgFile = (String) map.get("tumnalil_img");

		String commonTitle = (String) map.get("commonTitle");
		String commonContent = (String) map.get("commonContent");
		if (commonContent.equals("") || commonTitle.equals("")) {
			System.out.println("정상이다1111111111");

			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('내용을 확인해주세요'); location.href='recipeAdd.do';</script>");
			out.flush();
		}

		System.out.println("정상 =  " + imgFile);
		if (imgFile.equals("./resources/img/common/loading.gif")) {
			System.out.println("정상 =  " + imgFile);
			map.put("tumnalil_img", "64");
		} else {
			Map<String, Object> imgindexs = new HashMap<String, Object>();
			System.out.println("자르기시작");
			int index1 = imgFile.indexOf("profit/") + 44;
			String fileRealName = imgFile.substring(index1);
			System.out.println("path : " + fileRealName);

			int index2 = imgFile.indexOf("profit/") + 7;
			String filesavename = imgFile.substring(index2);
			System.out.println("path : " + filesavename);

			imgindexs.put("imgFile", imgFile);
			imgindexs.put("fileRealName", fileRealName);
			imgindexs.put("filesavename", filesavename);
			imgindexs.put("memberId", map.get("memberId"));
			System.out.println("파일이름들 = " + imgindexs);
			recipeService.imgFile(imgindexs);
			System.out.println("여기는했다");
			imgFile = recipeService.imgcnt();
			map.put("tumnalil_img", imgFile);
			System.out.println("파일 번호 = " + imgFile);
			System.out.println("자르기 끝");
		}
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
	 *
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
	 *
	 * @author 박상빈
	 * @param model
	 * @return String - community/boardAdd
	 * @throws Exception
	 */
	@RequestMapping(value = "recipeMod.do", method = RequestMethod.POST)
	public void recipeModUpdate(@RequestParam Map<String, Object> map, HttpServletResponse response, Model model) throws Exception {
		System.out.println("수정하러 옴" + map);
		String commonTitle = (String) map.get("commonTitle");
		String commonContent = (String) map.get("commonContent");
		if (commonContent.equals("") || commonTitle.equals("")) {
			System.out.println("정상이다1111111111");

			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('내용을 확인해주세요'); location.href='recipeAdd.do';</script>");
			out.flush();
		}
		int recipeModUpdate = recipeService.recipeModUpdate(map);
		System.out.println("수정하고 옴" + recipeModUpdate);

		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<script>alert('레시피가 수정 되었습니다'); location.href='recipeList.do';</script>");
		out.flush();
	}

	/**
	 * 레시피 삭제(recipeDelete)
	 *
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
	 *
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
	 *
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

		if (recipeReply > 0) {
			msg = "ok";
		}
		System.out.println("msg = " + msg);
		return msg;
	}

	/**
	 * 레시피 댓글 삭제(recipeReplyDelete)
	 *
	 * @author 박상빈
	 * @param map
	 * @return
	 * @throws Exception
	 */

	@RequestMapping(value = "recipeReplyDelete.do", method = RequestMethod.POST)
	@ResponseBody
	public String recipeReplyDelete(@RequestParam Map<String, Object> map, Model model) throws Exception {
		System.out.println("댓글삭제 옴" + map);
		int recipeReplyDelete = recipeService.recipeReplyDelete(map);
		System.out.println("댓글삭제 하고 옴 = " + recipeReplyDelete);

		String msg = "ng";

		if (recipeReplyDelete > 0) {
			msg = "ok";
		}
		System.out.println("msg = " + msg);
		return msg;
	}

	/**
	 * 레시피 대 댓글 등록(recipeReply)
	 *
	 * @author 박상빈
	 * @param map
	 * @return
	 * @throws Exception
	 */

	@RequestMapping(value = "recipeReplyAdd.do", method = RequestMethod.POST)
	@ResponseBody
	public String recipeReplyAdd(@RequestParam Map<String, Object> map, Model model) throws Exception {

		System.out.println("대댓글 옴" + map);
		int recipeReplyAdd = recipeService.recipeReplyAdd(map);

		String msg = "ng";
		if (recipeReplyAdd > 0) {
			msg = "ok";
		}

		return msg;
	}

	/**
	 * 자유게시판 좋아요/북마크 제거
	 *
	 * @author 길민선
	 * @param BookgoodVO
	 * @return String - community/boardAdd
	 * @throws Exception
	 */
	@RequestMapping(value = "reciperemoveBookgood.do", produces = "application/text; charser=utf-8")
	public @ResponseBody String removeBookgood(BookgoodVO vo) throws Exception {

		int delCnt = communityService.deleteBookgood(vo);
		int cnt = communityService.selectBookgoodCnt(vo);
		String str_cnt = Integer.toString(cnt);

		String msg = "";

		if (delCnt > 0) {
			msg = str_cnt;
		} else {
			msg = "no";
		}

		return msg;
	}

	/**
	 * 자유게시판 좋아요/북마크 추가
	 *
	 * @author 길민선
	 * @param BookgoodVO
	 * @return String - community/boardAdd
	 * @throws Exception
	 */
	@RequestMapping(value = "recipeaddBookgood.do", produces = "application/text; charser=utf-8")
	public @ResponseBody String addBookgood(BookgoodVO vo) throws Exception {

		int insCnt = communityService.insertBookgood(vo);
		int cnt = communityService.selectBookgoodCnt(vo);
		String str_cnt = Integer.toString(cnt);

		String msg = "";

		if (insCnt > 0) {
			msg = str_cnt;
		} else {
			msg = "no";
		}
		return msg;
	}

	/**
	 * 레시피 카테고리 목록(recipeListCategorie)
	 *
	 * @author 박상빈
	 * @param map
	 * @return String - community/boardAdd
	 * @throws Exception
	 */
	@RequestMapping(value = "recipeListCategorie.do", method = {
			RequestMethod.POST })
	public String recipeListCategorie(@RequestParam Map<String, Object> map, HttpSession ssion, Model model) throws Exception {
		String memberId = (String) ssion.getAttribute("memberId");
		if (memberId == null) {
			memberId = "";
		}
		map.put("memberId", memberId);

		String condition = (String) map.get("selLev");
		String keyword = (String) map.get("keyword");

		System.out.println("레시피 카테고리" + map);
		System.out.println("검색어는 = " + condition);
		System.out.println("검색어는 = " + keyword);

		//목록 전부
		List<?> recipeListCategorie = recipeService.recipeListKeyword(map);
		List<?> recipeTopList = recipeService.recipeTopList(memberId);

		System.out.println("목록전부 돌아옴 = " + recipeListCategorie);
		System.out.println("인기글 돌아옴 = " + recipeTopList);

		model.addAttribute("data", recipeListCategorie);
		model.addAttribute("recipeTopList", recipeTopList);

		return "community/recipeList";
	}
}
