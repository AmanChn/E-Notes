package com.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.Hibernate.Dao.UserDao;
import com.User.User;
import com.helper.FactoryProvider;

@WebServlet("/register")
public class UserController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserDao userDao;

    public void init() {
        userDao = new UserDao();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        register(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.sendRedirect("register.jsp");
    }

    private void register(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        User user = new User();
        user.setFullName(fullName);
        user.setEmail(email);
        user.setPassword(password);

		boolean f = userDao.saveUser(user);
		/*
		 * Session session = FactoryProvider.getFactory().openSession();
		 * 
		 * // start a transaction Transaction transaction = session.beginTransaction();
		 * // save the student object session.save(user); // commit transaction
		 * transaction.commit();
		 * 
		 * session.close();
		 */
		HttpSession s;
		if( f ) {
			s = request.getSession();
			s.setAttribute("reg-success", "Registration Successfull !!");
			response.sendRedirect("register.jsp");
		}
		else {
			s = request.getSession();
			s.setAttribute("failed-msg", "Something went wrong on Server");
			response.sendRedirect("register.jsp");
		}

		/*
		 * RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
		 * dispatcher.forward(request, response);
		 */
    }
}
