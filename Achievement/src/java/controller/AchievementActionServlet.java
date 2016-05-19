package controller;

import database.DatabaseConnection;
import guide.Guide;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 * Created by earthz on 4/10/16.
 */
@WebServlet(name = "AchievementActionServlet", urlPatterns = "/achievement.action")
public class AchievementActionServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String drop_id = request.getParameter("drop_id");
        String action = request.getParameter("action");
        
        if ("drop".equals(action)) {
            try {
                String sql_command = "DELETE FROM student_achievement WHERE achievement_id = ?";
                PreparedStatement statement = DatabaseConnection.getInstance().getConnection().prepareStatement(sql_command);
                statement.setString(1, drop_id);

                statement.executeUpdate();
            } catch (SQLException e) {
                e.printStackTrace();
            }

            try {
                String sql_command = "DELETE FROM teacher_achievement WHERE achievement_id = ?";
                PreparedStatement statement = DatabaseConnection.getInstance().getConnection().prepareStatement(sql_command);
                statement.setString(1, drop_id);

                statement.executeUpdate();
            } catch (SQLException e) {
                e.printStackTrace();
            }

            try {
                String sql_command = "DELETE FROM organization_achievement WHERE achievement_id = ?";
                PreparedStatement statement = DatabaseConnection.getInstance().getConnection().prepareStatement(sql_command);
                statement.setString(1, drop_id);

                statement.executeUpdate();
            } catch (SQLException e) {
                e.printStackTrace();
            }

            try {
                String sql_command = "DELETE FROM competitions WHERE achievement_id = ?";
                PreparedStatement statement = DatabaseConnection.getInstance().getConnection().prepareStatement(sql_command);
                statement.setString(1, drop_id);

                statement.executeUpdate();
            } catch (SQLException e) {
                e.printStackTrace();
            }

            try {
                String sql_command = "DELETE FROM certs WHERE achievement_id = ?";
                PreparedStatement statement = DatabaseConnection.getInstance().getConnection().prepareStatement(sql_command);
                statement.setString(1, drop_id);

                statement.executeUpdate();
            } catch (SQLException e) {
                e.printStackTrace();
            }

            try {
                String sql_command = "DELETE FROM ambassadors WHERE achievement_id = ?";
                PreparedStatement statement = DatabaseConnection.getInstance().getConnection().prepareStatement(sql_command);
                statement.setString(1, drop_id);

                statement.executeUpdate();
            } catch (SQLException e) {
                e.printStackTrace();
            }

            try {
                String sql_command = "DELETE FROM achievements WHERE id = ?";
                PreparedStatement statement = DatabaseConnection.getInstance().getConnection().prepareStatement(sql_command);
                statement.setString(1, drop_id);

                statement.executeUpdate();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        response.sendRedirect(Guide.getRoute(request, "achievement.manager"));

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
