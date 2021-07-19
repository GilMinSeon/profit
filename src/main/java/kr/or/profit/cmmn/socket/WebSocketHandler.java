package kr.or.profit.cmmn.socket;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;

import kr.or.profit.service.DietService;
import kr.or.profit.vo.MemberVO;

public class WebSocketHandler extends TextWebSocketHandler{
	
	@Resource(name = "dietService")
	private DietService dietService;
	
	private final ObjectMapper objectMapper = new ObjectMapper();
	
	List<WebSocketSession> sessions = new ArrayList<>();
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		System.out.println("첫번째");
		System.out.println("afterConnectionEstablished:" + session);
		
		System.out.println(session.getAttributes());
		
		sessions.add(session);
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		System.out.println("두번째");
		System.out.println("handleTextMessage:" + session + " : " + message);
		
		session.getAttributes().put("a", "a");
		
		String msg = message.getPayload();
		ChatMessageVO chatMessage = objectMapper.readValue(msg, ChatMessageVO.class);
		
//		System.out.println(chatMessage);
//		System.out.println(chatMessage.getCommand());
//		System.out.println(chatMessage.getConnectionType());
//		System.out.println(chatMessage.getMemberGubun());
//		System.out.println(chatMessage.getMemberId());
//		System.out.println(chatMessage.getTrainerChatFlag());
		
		//String senderId = session.getId();
		
		//실제 사이트 아이디
		//String senderId = getId(session);//웹소켓 세션 값 주가
		//HttpServletRequest req = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
		//req.getServletContext().setAttribute("addFlag", "N");
		
		if(chatMessage.getCommand().equals("firstConnection")) {
			System.out.println("first커맨드");
			
			List<MemberVO> list = websocketSessionList();
			
			for(int i=0; i<list.size(); i++) {
				System.out.println(list.get(i).getAddFlag());
				System.out.println(list.get(i).getMemberId());
				Map<String, String> map = new HashMap<String, String>();
				map.put("memberId", list.get(i).getMemberId());
				map.put("addFlag", list.get(i).getAddFlag());
				session.getAttributes().put("trainerList", map);
			}
			
			String memberId = chatMessage.getMemberId();
			System.out.println(memberId);
			
			
			
			String a = (String) session.getAttributes().get("a");
//			List<MemberVO> resultList = (List<MemberVO>) session.getAttributes().get("trainerList");
			
//			for(int i=0;i<resultList.size();i++) {
//				System.out.println("for문");
//				System.out.println(resultList.get(i).getAddFlag());
//			}
			
//			TextMessage newMsg = new TextMessage("first"+resultList.get(0).getMemberId()+ "," +resultList.get(0).getAddFlag() + "," 
//													+resultList.get(1).getMemberId()+ "," +resultList.get(1).getAddFlag()+ ","
//													+resultList.get(2).getMemberId()+ "," +resultList.get(2).getAddFlag()
//												);
			
			//TextMessage firstMsg = new TextMessage("first," + memberId + "," + a);
			int cnt = 0;
//			for(WebSocketSession sess : sessions) {
//				sess.sendMessage(newMsg);
//				System.out.println(cnt);
//				System.out.println(newMsg);
//				cnt++;
//			}
			
		}else if(chatMessage.getCommand().equals("add")) {
			System.out.println("add커맨드");
			String memberId = chatMessage.getMemberId();
			
			//request
			//HttpServletRequest req = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
			//req.getServletContext().setAttribute("memberId", memberId);
			//req.getServletContext().setAttribute("addFlag", "Y");
			
			//System.out.println("addFlag");
			//System.out.println(req.getServletContext().getAttribute("addFlag"));
			
		}
		
		
		
		
//		System.out.println("보낸거");
//		System.out.println(msg);
//		TextMessage uu = new TextMessage("add,");
//		for(WebSocketSession sess : sessions) {
//			sess.sendMessage(uu);
//		}
		
		
//		if(StringUtils.isNotEmpty(msg)) {
//			String[] strs = msg.split(",");
//			if(strs != null && strs.length == 2) {
//				String cmd = strs[0];
//				String trainerId = strs[1];
//				
//				if("add".equals(cmd)) {
//					TextMessage tmpMsg = new TextMessage("add," + trainerId);
//					
//					for(WebSocketSession sess : sessions) {
//						sess.sendMessage(tmpMsg);
//					}
//					
//				}
//			}
//		}
		
		
//		for(WebSocketSession sess : sessions) {
//			sess.sendMessage(new TextMessage(senderId + ": " + message.getPayload() ));
//		}
	}
	
	

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		System.out.println("세번째");
		System.out.println("afterConnectionClosed:" + session + ":" + status);
		sessions.remove(session);
	}

	
	
	
	
	//실제 http세션에 있는 우리 사이트 아이디 구하기
	private String getId(WebSocketSession session) {
		Map<String, Object> httpSession = session.getAttributes();
		String memberId = (String)httpSession.get("memberId");
		return memberId;
	}
	
	
	public List<MemberVO> websocketSessionList() throws Exception{
		List<MemberVO> list = dietService.websocketSessionList();
		return list;
	}
	
	
}


