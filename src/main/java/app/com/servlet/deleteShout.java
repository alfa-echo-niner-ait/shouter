package app.com.servlet;

import app.com.service.ShoutService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "deleteShout", value = "/deleteShout")
public class deleteShout extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");

        Integer userID = (Integer) request.getSession(false).getAttribute("userID");
        String username = (String) request.getSession(false).getAttribute("username");

        String shouter = request.getParameter("shouter");
        Integer sid = Integer.valueOf(request.getParameter("sid"));

        if(username.equals(shouter)) {
            ShoutService shoutService = new ShoutService();
            shoutService.delete(sid);
        }

        RequestDispatcher rd = request.getRequestDispatcher("/profile");
        rd.include(request, response);
        response.sendRedirect( request.getContextPath() + "/profile?user=" + username);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}
