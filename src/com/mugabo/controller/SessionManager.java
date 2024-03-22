package com.mugabo.controller;

import javax.servlet.http.HttpSession;

import com.mugabo.domain.Users;

public class SessionManager {

	public static Users getUser(HttpSession session) {
        return (Users) session.getAttribute("user");
    }

    public static boolean isLoggedIn(HttpSession session) {
        return getUser(session) != null;
    }

    public static void logout(HttpSession session) {
        session.invalidate(); // Invalidate the session to log the user out
    }
	
}
