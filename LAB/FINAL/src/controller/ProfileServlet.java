package controller;

import staff.Staff;
import staff.StaffUtilities;
import student.Student;
import student.StudentUtilities;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by earthz on 2/9/16.
 */
@WebServlet(name = "ProfileServlet", urlPatterns = "/profile")
public class ProfileServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        Student student = StudentUtilities.getStudentInformation((String) request.getSession().getAttribute("user"));
        Staff staff = StaffUtilities.getStaffInformation((String) request.getSession().getAttribute("user"));

        if(student != null) {
            request.setAttribute("role", "student");
            request.setAttribute("username", student.getStudent_id());
            request.setAttribute("first_name", student.getFirst_name());
            request.setAttribute("last_name", student.getLast_name());
        } else if (staff != null && !staff.getStaff_id().equals("admin")) {
            request.setAttribute("role", "staff");
            request.setAttribute("username", staff.getStaff_id());
            request.setAttribute("first_name", staff.getFirst_name());
            request.setAttribute("last_name", staff.getLast_name());
        } else {
            if (staff != null) {
                request.setAttribute("role", "admin");
                request.setAttribute("username", staff.getStaff_id());
                request.setAttribute("first_name", staff.getFirst_name());
                request.setAttribute("last_name", staff.getLast_name());
            }
        }

        getServletContext().getRequestDispatcher("/profile.jsp").forward(request, response);

    }
}
