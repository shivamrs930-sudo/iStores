package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import dao.UserDao;
import model.User;

@WebServlet("/SignupServlet")
public class SignupServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        User user = new User();

        user.setName(name);
        user.setEmail(email);
        user.setPassword(password);

        UserDao dao = new UserDao();

        if (dao.registerUser(user)) {

            response.sendRedirect("login.jsp?success=1");

        } else {

            response.sendRedirect("signup.jsp?error=1");

        }
    }
}