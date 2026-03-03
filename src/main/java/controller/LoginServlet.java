package controller;

import dao.UserDao;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.io.IOException;

@WebServlet("/LoginServlet")

public class LoginServlet extends HttpServlet {

protected void doPost(HttpServletRequest request, HttpServletResponse response)
throws ServletException, IOException {

String email = request.getParameter("email");
String password = request.getParameter("password");

UserDao dao = new UserDao();

boolean status = dao.loginUser(email, password);

if(status){

HttpSession session = request.getSession();
session.setAttribute("user", email);

response.sendRedirect("index.jsp");

}else{

response.sendRedirect("login.jsp?error=1");

}

}
}