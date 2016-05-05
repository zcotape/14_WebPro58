package controller;

import database.DatabaseConnection;
import guide.Guide;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.InputStream;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.Part;
import model.utilities.AchievementUtilities;

@WebServlet(name = "AmbassadorServlet", urlPatterns = "/register.ambassador")
public class AmbassadorServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        // Declare informations
        String achievement_name = request.getParameter("achievement_name");
        
        System.out.println(request.getParameter("organization_name"));
        System.out.println(achievement_name);
        
        Integer organization_id = Integer.parseInt(request.getParameter("organization_name"));
        String year = request.getParameter("year");

        // Optional Description
        String organization_optional = request.getParameter("organization_optional_name");
        
        // Declare SimpleDateFormat and get date's parameter

        String publish_date = request.getParameter("publish_date");


        Part certificate_file = request.getPart("ambassador_file");
        InputStream inputStream = null;

        // Get InputStream
        if (certificate_file != null) {
            inputStream = certificate_file.getInputStream();
        }

        // Insert to Achievement Table
        try {
            String sql_command = "INSERT INTO achievements (achievement_name, date, category, photo, achievement_type, created_at, updated_at) VALUES (?, ?, ?, ?, ?, NOW(), NOW())";
            PreparedStatement statement = DatabaseConnection.getInstance().getConnection().prepareStatement(sql_command);
            statement.setString(1, achievement_name);
            statement.setString(2, publish_date);
            statement.setString(3, "");
            statement.setString(5, "2");
            if (inputStream != null) {
                statement.setBlob(4, inputStream);
            }

            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        // Insert to Ambassador Table
        try {
            String sql_command = "INSERT INTO ambassadors (year, achievement_id) VALUES (?, ?)";
            PreparedStatement statement = DatabaseConnection.getInstance().getConnection().prepareStatement(sql_command);
            statement.setString(1, year);
            statement.setInt(2, AchievementUtilities.getAchievementID(achievement_name));

            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        // Insert to student_achievement table
        try {
            String sql_command = "INSERT INTO student_achievement (student_id, achievement_id) VALUES (?, ?)";
            PreparedStatement statement = DatabaseConnection.getInstance().getConnection().prepareStatement(sql_command);
            statement.setString(1, (String) request.getSession().getAttribute("username"));
            statement.setInt(2, AchievementUtilities.getAchievementID(achievement_name));

            statement.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }

         // Insert to organization_achievement table
        if (organization_optional != null) {
            try {
                String sql_command = "INSERT INTO organizations (organization_name) VALUES (?)";
                PreparedStatement statement = DatabaseConnection.getInstance().getConnection().prepareStatement(sql_command);
                statement.setString(1, organization_optional);

                statement.executeUpdate();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        try {
            String sql_command = "INSERT INTO organization_achievement (achievement_id, organization_id) VALUES (?, ?)";
            PreparedStatement statement = DatabaseConnection.getInstance().getConnection().prepareStatement(sql_command);
            statement.setInt(1, AchievementUtilities.getAchievementID(achievement_name));
            if(organization_id != 0 && organization_optional == null){
                statement.setInt(2, organization_id);

            } else {
                statement.setInt(2, AchievementUtilities.getOrganizationID(organization_optional));
            }
            statement.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }

        response.sendRedirect(Guide.getRoute(request, "achievement.manager"));
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        getServletContext().getRequestDispatcher("/ambassador.jsp").forward(request, response);
    }
}
