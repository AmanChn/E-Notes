package com.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Hibernate.Dao.UserDao;
import com.User.User;

@WebServlet("/login")
public class LoginController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserDao loginDao;

    public void init() {
        loginDao = new UserDao();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.sendRedirect("login.jsp");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        try {
            authenticate(request, response);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    private void authenticate(HttpServletRequest request, HttpServletResponse response)
    throws Exception {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        
        
		/*
		 * if (loginDao.validate(email, password)) { RequestDispatcher dispatcher =
		 * request.getRequestDispatcher("login-success.jsp");
		 * dispatcher.forward(request, response); } else { throw new
		 * Exception("Login not successful.."); }
		 */
        User user = loginDao.validate(email, password);
        HttpSession s;
		if( user != null) {
			s = request.getSession();
			s.setAttribute("userDetails", user);
			response.sendRedirect("home.jsp");
		}
		else {
			s = request.getSession();
			s.setAttribute("login-failed", "Invalid Username or Password");
			response.sendRedirect("login.jsp");
		}
    }
}
