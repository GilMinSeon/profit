package kr.or.profit.cmmn.socket;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Random;
import java.util.Set;

import javax.annotation.Resource;
import javax.json.Json;
import javax.json.JsonArrayBuilder;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;

import kr.or.profit.service.DietService;
import kr.or.profit.vo.ChatProfileVO;

public class UserServerHandler extends TextWebSocketHandler {

	@Resource(name = "dietService")
	private DietService dietService;

	private final ObjectMapper objectMapper = new ObjectMapper();

	private List<WebSocketSession> connectedAllUsers = new ArrayList<>();

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		connectedAllUsers.add(session);
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		String msg = message.getPayload();
		ChatMessageVO chatMessage = objectMapper.readValue(msg, ChatMessageVO.class);
		
		//1) firstConnection
		if (chatMessage.getCommand().equals("firstConnection")) {
			List<ChatProfileVO> list = dietService.websocketSessionList();
			List<String> flagYList = new ArrayList<>();
			for (int i = 0; i < list.size(); i++) {
				flagYList.add(list.get(i).getChatProfileId());
			}
			System.out.println("db에서 flag Y인 리스트 : " + flagYList);
			HashSet<String> returnSet = new HashSet<String>();
			for (int i = 0; i < connectedAllUsers.size(); i++) {
				if (flagYList.contains(connectedAllUsers.get(i).getAttributes().get("memberId"))) {
					returnSet.add((String) connectedAllUsers.get(i).getAttributes().get("memberId"));
				}
			}
			System.out.println("현재 웹소켓 접속한 트레이너 중 Y인 리스트 : " + returnSet);
			TextMessage trainerList = new TextMessage(buildJsonUserData(returnSet).toString());
			for (WebSocketSession sess : connectedAllUsers) {
				sess.sendMessage(trainerList);
			}
		}
		//2)chatConnection
		else if(chatMessage.getCommand().equals("chatConnection")) {
			String chatroomId = genRandom();
			Set<WebSocketSession> chatroomMembers = new HashSet<WebSocketSession>();
			chatroomMembers.add(session);
			
			String connectingUser = chatMessage.getConnectingUser();
			if(connectingUser != null) {
				for (WebSocketSession sess : connectedAllUsers) {
					if(connectingUser.equals(sess.getAttributes().get("memberId"))) {
						chatroomMembers.add(sess);
					}
				}
				
				for(WebSocketSession sess : chatroomMembers) {
					TextMessage txt = new TextMessage(Json.createObjectBuilder().add("enterChatId", chatroomId).add("username", (String) sess.getAttributes().get("memberId")).build().toString());
					sess.sendMessage(txt);
				}
				
				
			}
			
		}

	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		connectedAllUsers.remove(session);
	}

	public List<ChatProfileVO> websocketSessionList() throws Exception {
		List<ChatProfileVO> list = dietService.websocketSessionList();
		return list;
	}

	private String buildJsonUserData(Set<String> set) {
		JsonArrayBuilder jsonArrayBuilder = Json.createArrayBuilder();
		for (String user : set) {
			jsonArrayBuilder.add(user);
		}
		return Json.createObjectBuilder().add("allTrainers", jsonArrayBuilder).build().toString();
	}
	
	private String genRandom() {
		String chatroomId = "";
		for (int i = 0; i < 8; i++) {
			chatroomId += (char) ((new Random().nextDouble() * 26) + 97);
		}
		return chatroomId;
	}
	

}
