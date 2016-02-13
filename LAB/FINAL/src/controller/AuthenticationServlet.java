package controller;

import guide.RouteGuide;
import staff.StaffUtilities;
import student.StudentUtilities;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sound.midi.SysexMessage;
import java.io.IOException;

@WebServlet(name = "AuthenticationServlet", urlPatterns = "/auth")
public class AuthenticationServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        String username = request.getParameter("inputUsername"),
                password = request.getParameter("inputPassword");

        if(username.contains("it57") && StudentUtilities.doAuthentication(username, password)) {
            HttpSession session = request.getSession();
            session.setAttribute("user", StudentUtilities.getStudentID(username));
            session.setMaxInactiveInterval(60*60);
            session.setAttribute("role", "student");

            response.sendRedirect(RouteGuide.getURL(request, "dashboard"));
        } else if(!username.isEmpty() && StaffUtilities.doAuthentication(username, password)){
            HttpSession session = request.getSession();
            session.setAttribute("user", StaffUtilities.getStaffID(username));
            session.setMaxInactiveInterval(60*60);
            if(!username.equals("admin")) {
                session.setAttribute("role", "staff");
            } else {
                session.setAttribute("role", "admin");
            }
            response.sendRedirect(RouteGuide.getURL(request, "dashboard"));
        } else if (username.equals("") && password.equals("")){
            request.setAttribute("error", 2);
            getServletContext().getRequestDispatcher("/login.jsp").forward(request, response);
        } else {
            request.setAttribute("error", 1);
            getServletContext().getRequestDispatcher("/login.jsp").forward(request, response);
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        getServletContext().getRequestDispatcher("/login.jsp").forward(request, response);
    }
}
