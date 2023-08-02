package app.com.servlet;

import app.com.service.ShoutService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "shoutUpdater", value = "/shoutUpdater")
public class shoutUpdater extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");

        Integer userID = (Integer) request.getSession(false).getAttribute("userID");
        String username = (String) request.getSession(false).getAttribute("username");
        String text = request.getParameter("shoutText");
        Integer sid = Integer.valueOf(request.getParameter("sid"));

        ShoutService shoutService = new ShoutService();
        shoutService.update(text, sid);

        RequestDispatcher rd = request.getRequestDispatcher("/profile");
        rd.include(request, response);
        response.sendRedirect( request.getContextPath() + "/profile?user=" + username);
    }
}
