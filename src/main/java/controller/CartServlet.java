package controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/CartServlet")
public class CartServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        Map<String, Integer> cart =
                (Map<String, Integer>) session.getAttribute("cart");

        if (cart == null) {
            cart = new HashMap<>();
        }

        String action = request.getParameter("action");

        // ================= ADD =================
        if ("add".equals(action)) {

            String idParam = request.getParameter("id");
            String color = request.getParameter("color");
            String storage = request.getParameter("storage");

            if (idParam != null && color != null && storage != null) {

                int id = Integer.parseInt(idParam);
                String key = id + "-" + color + "-" + storage;

                cart.put(key, cart.getOrDefault(key, 0) + 1);
            }
        }

        // ================= INCREASE =================
        else if ("increase".equals(action)) {

            String key = request.getParameter("key");

            if (key != null && cart.containsKey(key)) {
                cart.put(key, cart.get(key) + 1);
            }
        }

        // ================= DECREASE =================
        else if ("decrease".equals(action)) {

            String key = request.getParameter("key");

            if (key != null && cart.containsKey(key)) {

                int qty = cart.get(key);

                if (qty <= 1) {
                    cart.remove(key);
                } else {
                    cart.put(key, qty - 1);
                }
            }
        }

        session.setAttribute("cart", cart);

        response.sendRedirect("cart.jsp");
    }
}