package controller;

import guide.Guide;
import model.personal.PersonalUtilities;
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

@WebServlet(name = "AuthenticationServlet", urlPatterns = "/auth")
public class AuthenticationServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        String username = request.getParameter("inputUsername");
        String password = request.getParameter("inputPassword");

        if (PersonalUtilities.doAuthentication(username, password)) {
            Integer role_id = PersonalUtilities.getRoleID(username);

            HttpSession session = request.getSession(true);
            session.setMaxInactiveInterval(60 * 60);
            session.setAttribute("username", username);

            if (role_id == 1) {
                session.setAttribute("role", "teacher");

                Teacher teacher = PersonalUtilities.getTeacherInformation(username);
                if (teacher != null) {
                    session.setAttribute("teacher_id", teacher.getTeacher_id());
                    session.setAttribute("th_prename", teacher.getTh_prename());
                    session.setAttribute("th_name", teacher.getTh_name());
                    session.setAttribute("en_prename", teacher.getEn_prename());
                    session.setAttribute("en_name", teacher.getEn_name());
                    session.setAttribute("mobile", teacher.getMobile());
                    session.setAttribute("email", teacher.getEmail());

                }
            } else if (role_id == 2) {
                session.setAttribute("role", "staff");

                Staff staff = PersonalUtilities.getStaffInformation(username);
                if (staff != null) {
                    session.setAttribute("staff_id", staff.getStaff_id());
                    session.setAttribute("section_id", staff.getSection_id());
                    session.setAttribute("th_name", staff.getTh_name());
                    session.setAttribute("en_name", staff.getEn_name());
                    session.setAttribute("mobile", staff.getMobile());
                    session.setAttribute("email", staff.getEmail());
                }
            } else if (role_id == 3) {
                session.setAttribute("role", "student");

                Student student = PersonalUtilities.getStudentInformation(username);
                if (student != null) {
                    session.setAttribute("curriculum_id", student.getCurriculum_id());
                    session.setAttribute("track_id", student.getTrack_id());
                    session.setAttribute("th_name", student.getTh_name());
                    session.setAttribute("en_name", student.getEn_name());
                    session.setAttribute("email", student.getEmail());
                }

            } else if (username.equals("") && password.equals("")) {
                request.setAttribute("error", 2);
                getServletContext().getRequestDispatcher("/login.jsp").forward(request, response);
            }
        } else {
            request.setAttribute("error", 1);
            getServletContext().getRequestDispatcher("/login.jsp").forward(request, response);
        }


        response.sendRedirect(Guide.getRoute(request, "dashboard"));
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        getServletContext().getRequestDispatcher("/login.jsp").forward(request, response);
    }
}
