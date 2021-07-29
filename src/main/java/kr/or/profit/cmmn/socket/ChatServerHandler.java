package kr.or.profit.cmmn.socket;

import java.io.IOException;

import java.util.Collections;
import java.util.HashSet;
import java.util.Set;


import javax.websocket.EncodeException;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

import kr.or.profit.cmmn.socket.config.ChatServerAppConfig;
import kr.or.profit.cmmn.socket.model.ChatMessage;
import kr.or.profit.cmmn.socket.model.Message;
import kr.or.profit.cmmn.socket.model.UsersMessage;
import kr.or.profit.cmmn.socket.model.decoder.MessageDecoder;
import kr.or.profit.cmmn.socket.model.encoder.MessageEncoder;

@ServerEndpoint(value = "/chat/{room}", encoders = { MessageEncoder.class }, decoders = { MessageDecoder.class }, configurator=ChatServerAppConfig.class)
public class ChatServerHandler {
	private Set<Session> chatroomUsers = Collections.synchronizedSet(new HashSet<Session>());
	@OnOpen
	public void handleOpen(Session userSession, @PathParam("room") final String room) throws IOException, EncodeException {
		userSession.getUserProperties().put("room", room);
		chatroomUsers.add(userSession);
	}
	@OnMessage
	public void handleMessage(Message incomingMessage, Session userSession, @PathParam("room") final String room) throws IOException, EncodeException {
		ChatMessage outgoingChatMessage = new ChatMessage();
		ChatMessage incomingChatMessage = (ChatMessage) incomingMessage;
		String username = (String) userSession.getUserProperties().get("username");
		
		if (username == null) {
			username = incomingChatMessage.getMessage();
			if (username != null) {
				userSession.getUserProperties().put("username", username);
			}

			synchronized (chatroomUsers) {
				for (Session session : chatroomUsers) {
					session.getBasicRemote().sendObject(new UsersMessage(getUsers()));
				}
			}
		} 
		
		else { 
			outgoingChatMessage.setName(username);
			outgoingChatMessage.setMessage(incomingChatMessage.getMessage());

			for (Session session : chatroomUsers) {
				session.getBasicRemote().sendObject(outgoingChatMessage);
			}
		}
	}

	@OnClose
	public void handleClose(Session userSession, @PathParam("room") final String room) throws IOException, EncodeException {
		chatroomUsers.remove(userSession);

		for (Session session : chatroomUsers) {
			session.getBasicRemote().sendObject(new UsersMessage(getUsers()));
		}
	}
	@OnError
	public void handleError(Session session, Throwable throwable, @PathParam("room") final String room) {
		System.out.println("ChatServerEndPoint (room: " + room + ") occured Exception!");
		System.out.println("Exception : " + throwable.getMessage());
	}

	private Set<String> getUsers() {
		HashSet<String> returnSet = new HashSet<String>();

		for (Session session : chatroomUsers) {
			if (session.getUserProperties().get("username") != null) {
				returnSet.add(session.getUserProperties().get("username").toString());
			}
		}
		return returnSet;
	}

}
