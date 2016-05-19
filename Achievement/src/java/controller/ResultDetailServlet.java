package controller;

import database.DatabaseConnection;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.utilities.QueryUtilities;

@WebServlet(name = "ResultDetailServlet", urlPatterns = {"/guest.result.detail", "/result.detail"})
public class ResultDetailServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        Integer achievement_id = Integer.parseInt(request.getParameter("achievement_id"));
        Integer achievement_type = Integer.parseInt(request.getParameter("achievement_type"));

        request.setAttribute("achievement_id", request.getParameter("achievement_id"));
        request.setAttribute("achievement_type", request.getParameter("achievement_type"));
        System.out.print("------");
        
        try {
            String sql_command = QueryUtilities.QueryByAchievementType(achievement_id, achievement_type);
            PreparedStatement statement = DatabaseConnection.getInstance().getConnection().prepareStatement(sql_command);
            
            ResultSet result = statement.executeQuery();
            if (result.next()) {
                // Personal
                    request.setAttribute("student_id", result.getString("student_id"));
                    request.setAttribute("student_name", result.getString("student_name"));
                    
                switch (achievement_type) {
                    case 1:
                        // Description
                        request.setAttribute("teacher_name", result.getString("teacher_name"));
                        request.setAttribute("organization_name", result.getString("organization"));
                        request.setAttribute("achievement_name", result.getString("achievement_name"));
                        request.setAttribute("competition_event_name", result.getString("event_name"));
                        request.setAttribute("competition_topic", result.getString("topic"));
                        request.setAttribute("competition_category", result.getString("category"));
                        request.setAttribute("competition_level", result.getString("level"));
                        request.setAttribute("competition_rank", result.getString("rank"));
                        request.setAttribute("competition_reward", result.getString("reward"));
                        request.setAttribute("date", result.getString("date"));
                        break;
                    case 2:
                        // Description
                        request.setAttribute("organization_name", result.getString("organization"));
                        request.setAttribute("achievement_name", result.getString("achievement_name"));
                        request.setAttribute("ambassador_year", result.getString("year"));
                        request.setAttribute("date", result.getString("date"));
                        break;
                    case 3:
                        // Description
                        request.setAttribute("organization_name", result.getString("organization"));
                        request.setAttribute("achievement_name", result.getString("achievement_name"));
                        request.setAttribute("publish_date", result.getString("date"));
                        request.setAttribute("expire_date", result.getString("exp_date"));
                        break;
                    default:
                        break;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        getServletContext().getRequestDispatcher("/result_detail_guest.jsp").forward(request, response);

    }
}
