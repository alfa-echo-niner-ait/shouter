package app.com.servlet;

import app.com.service.ShoutService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "shouts", value = "/shouts")
public class shouts extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");

        Integer userID = (Integer) request.getSession(false).getAttribute("userID");
        String username = (String) request.getSession(false).getAttribute("username");
        String text = request.getParameter("shoutText");

        ShoutService shoutService = new ShoutService();
        shoutService.addShout(userID, username, text);

        RequestDispatcher rd = request.getRequestDispatcher("/feed");
        rd.include(request, response);
        response.sendRedirect( request.getContextPath() + "/feed");
    }
}
