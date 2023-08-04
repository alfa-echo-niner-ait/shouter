package app.com.servlet;

import app.com.pojo.Users;
import app.com.service.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "login", value = "/login")
public class login extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        String getUsername = request.getParameter("username");
        String getPassword = request.getParameter("password");
        String remember = request.getParameter("remember");
        String loginError;

        UserService userService = new UserService();
        Users user = userService.getUser(getUsername);

        if(getPassword.equals(user.getPassword())) {
            // get the old session and invalidate
            HttpSession oldSession = request.getSession(false);
            if (oldSession != null) {
                oldSession.invalidate();
            }
            //generate a new session
            HttpSession newSession = request.getSession(true);
            newSession.setAttribute("userID", user.getUserID());
            newSession.setAttribute("username", user.getUsername());
            newSession.setAttribute("password", user.getPassword());

            if(remember != null) {
                //setting session to expiry in 60 mins
                newSession.setMaxInactiveInterval(60*60);
            }
            RequestDispatcher rd = request.getRequestDispatcher("/feed");
            rd.include(request, response);
            response.sendRedirect( request.getContextPath() + "/feed");

//            request.getRequestDispatcher("/feed").forward(request, response);
        }
        else {
            loginError = """
                    <div class="alert alert-danger alert-dismissible ms-3 me-3 mt-lg-5" fade show>
                        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                        Login Error! Please try again.
                    </div>
                    """;
            request.setAttribute("loginError", loginError);
            request.getRequestDispatcher("/").forward(request, response);
        }

    }
}