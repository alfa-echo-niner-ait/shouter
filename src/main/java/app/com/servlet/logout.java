package app.com.servlet;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "logout", value = "/logout")
public class logout extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }
        String logoutMsg = """
                    <div class="alert alert-warning alert-dismissible ms-3 me-3 mt-lg-5" fade show>
                        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                        Logout successful!
                    </div>
                    """;
        request.setAttribute("logoutMsg", logoutMsg);
        request.getRequestDispatcher("/").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}
