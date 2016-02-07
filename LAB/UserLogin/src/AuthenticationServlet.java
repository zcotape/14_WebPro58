import Member.Member;
import Member.MemberUtility;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Created by earthz on 2/5/16.
 */
@WebServlet(name = "AuthenticationServlet", urlPatterns = "/login")
public class AuthenticationServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        String username = request.getParameter("username"),
                password = request.getParameter("password");

        if(MemberUtility.doAuthentication(username, password)) {
            Member member = MemberUtility.getUsername(username);
            request.setAttribute("username", member.getUsername());

            String usertype;
            switch (member.getType()) {
                case 1: usertype = "ADMIN"; break;
                case 2: usertype = "MANAGER"; break;
                default: usertype = "USER"; break;
            }

            request.setAttribute("user_type", usertype);

            RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/login.jsp");
            requestDispatcher.forward(request, response);
        } else {
            response.getWriter().println("Incorrect Username");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
