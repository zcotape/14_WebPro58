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

@WebServlet(name = "AddArchiveServlet", urlPatterns = "/add_archive")
public class AddArchieveServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        Student student = StudentUtilities.getStudentInformation((String) request.getSession().getAttribute("user"));
        Staff staff = StaffUtilities.getStaffInformation((String) request.getSession().getAttribute("user"));

        if(student != null) {
            request.setAttribute("role", "student");
        } else if (staff != null && !staff.getStaff_id().equals("admin") ) {
            request.setAttribute("role", "staff");
        } else {
            if (staff != null) {
                request.setAttribute("role", "admin");
            }
        }

        getServletContext().getRequestDispatcher("/addarchive.jsp").forward(request, response);
    }
}
