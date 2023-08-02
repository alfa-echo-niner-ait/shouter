package app.com.servlet;

import app.com.service.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "register", value = "/register")
public class register extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        String getUsername = request.getParameter("reg-username");
        String getPassword = request.getParameter("reg-password");

        UserService userService = new UserService();
        try {
            userService.addUser(getUsername, getPassword);

            String registerMsg = """
                    <div class="alert alert-success alert-dismissible ms-3 me-3 mt-lg-5" fade show>
                        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                        Registration successful!
                    </div>
                    """;

            request.setAttribute("registerMsg", registerMsg);
            request.getRequestDispatcher("/").forward(request, response);
        }
        catch (Exception e) {
            System.out.println(e.getLocalizedMessage());
            String registerError = """
                    <div class="alert alert-danger alert-dismissible ms-3 me-3 mt-lg-5" fade show>
                        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                        Registration Error! Please try again.
                    </div>
                    """;
            request.setAttribute("registerError", registerError);
            request.getRequestDispatcher("/").forward(request, response);
        }
    }
}