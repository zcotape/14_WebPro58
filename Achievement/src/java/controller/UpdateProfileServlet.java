package controller;

import guide.Guide;
import model.utilities.PersonalUtilities;
import model.personal.Staff;
import model.personal.Student;
import model.personal.Teacher;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Created by earthz on 3/21/16.
 */
@WebServlet(name = "UpdateProfileServlet", urlPatterns = "/update")
public class UpdateProfileServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("username");

        String email = request.getParameter("email");
        session.setAttribute("email", email);

        String mobile = request.getParameter("mobile");
        session.setAttribute("mobile", mobile);

        String password = request.getParameter("password");

        if (password != null) {
            PersonalUtilities.updatePassword(username, password);
        }

        if (session.getAttribute("role").equals("student")) {
            Student student = new Student();
            student.setEmail(email);

            PersonalUtilities.updateStudentInformation(student, username);
        } else if (session.getAttribute("role").equals("staff")) {
            Staff staff = new Staff();
            staff.setEmail(email);
            staff.setMobile(mobile);

            PersonalUtilities.updateStaffInformation(staff, username);
        } else {
            Teacher teacher = new Teacher();
            teacher.setEmail(email);
            teacher.setMobile(mobile);

            PersonalUtilities.updateTeacherInformation(teacher, username);
        }

        response.sendRedirect(Guide.getRoute(request, "account"));
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
