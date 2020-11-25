package com.dine.listener;

import lombok.extern.slf4j.Slf4j;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;
import java.util.Date;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

@Slf4j
public class SessionListener implements HttpSessionListener {

	private static Map<String, HttpSession> M_USERHASHMAP = new ConcurrentHashMap<>();

	@Override
	public void sessionCreated(HttpSessionEvent se) {
		log.info("---Session start at " + new Date() + "---");
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent se) {
		log.info("---Session end at " + new Date() + "---");
	}

	public static boolean addSession(HttpSession httpSession) {
		//防止同一个浏览器同时登录同一账号会被注销
		HttpSession oldsession= M_USERHASHMAP.get(httpSession.getAttribute("userId"));
		if(oldsession != null && !oldsession.getId().equals(httpSession.getId())){
			removeSession(httpSession);
		}

		M_USERHASHMAP.put((String) httpSession.getAttribute("userId"), httpSession);
		return true;
	}
	
	public static boolean removeSession(HttpSession httpSession) {
		HttpSession pHttpSession = M_USERHASHMAP.remove( httpSession.getAttribute("userId"));
		if (pHttpSession != null) {
			pHttpSession.invalidate();
		}
		return true;
		
	}

}