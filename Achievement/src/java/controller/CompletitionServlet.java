/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import database.DatabaseConnection;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import model.personal.AchievementUtilities;
import model.portfolio.Portfolio;
import model.portfolio.PortfolioUtilities;

/**
 *
 * @author earthz
 */
@WebServlet(name = "CompletitionServlet", urlPatterns = {"/register.completition"})
@MultipartConfig(maxFileSize = 999999999) // config file size 
public class CompletitionServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Achievement Description
        String achievement_name = request.getParameter("achievement_name"); //    
        String publish_date = request.getParameter("publish-date");
        String reward = request.getParameter("reward");
        String category = request.getParameter("category");
        Integer achievement_type = 1;
        InputStream inputStream = null;
        Part competition_file = request.getPart("file");
        // Competition Description
        String event_name = request.getParameter("event_name");
        String topic = request.getParameter("topic");
        String level = request.getParameter("level");
        String rank = request.getParameter("rank");
        switch (rank) {
            case "1":
                rank = "รางวัลชนะเลิศ";
                break;
            case "2":
                rank = "รางวัลรองชนะเลิศอันดับที่ 1";
                break;
            case "3":
                rank = "รางวัลรองชนะเลิศอันดับที่ 2";
                break;
            case "4":
                rank = "รางวัลชมเชย";
                break;
            case "5":
                rank = "ได้เข้าร่วมการแข่งขัน";
                break;
            default:
                rank = null;
                break;
        }
        switch (level) {
            case "1":
                level = "ระดับชั้น";
                break;
            case "2":
                level = "ระดับสถาบันการศึกษา / มหาวิทยาลัย";
                break;
            case "3":
                level = "ระดับจังหวัด";
                break;
            case "4":
                level = "ระดับภูมิภาค";
                break;
            case "5":
                level = "ระดับประเทศ";
                break;
            case "6":
                level = "ระดับนานาชาติ";
                break;
            default:
                level = null;
                break;
        }

        // Student Description
        String student = request.getParameter("co_student");

        // Advisor Description
        String advisor = request.getParameter("advisor");

        // Organization Description
        Integer organization_id = Integer.parseInt(request.getParameter("organization_name"));

        // Optional Description
        String organization_optional = request.getParameter("organization_optional");
        String rank_optional = request.getParameter("rank_optional");

        // Declare to get a file
        if (competition_file != null) {
            inputStream = competition_file.getInputStream();
        }

        // Insert to Achievement Table
        try {
            String sql_command = "INSERT INTO achievements (achievement_name, photo, reward, category, achievement_type)"
                    + "VALUES (?, ?, ?, ?, ?) ";
            PreparedStatement statement = DatabaseConnection.getInstance().getConnection().prepareStatement(sql_command);
            statement.setString(1, achievement_name);
            if (inputStream != null) {
                statement.setBlob(2, inputStream);
            }
            statement.setString(3, reward);
            statement.setString(4, category);
            statement.setInt(5, achievement_type);

            statement.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }

        // Insert to Competition Table
        try {
            String sql_command = "INSERT INTO competitions (event_name, topic, level, rank, achievement_id) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement statement = DatabaseConnection.getInstance().getConnection().prepareStatement(sql_command);
            statement.setString(1, event_name);
            statement.setString(2, topic);
            statement.setString(3, level);
            statement.setString(4, rank);
            statement.setInt(5, AchievementUtilities.getAchievementID(achievement_name));
            
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        // Insert to student_achievement table
        try {
            String sql_command = "INSERT INTO student_achievement (student_id, achievement_id) VALUES (?, ?)";
            PreparedStatement statement = DatabaseConnection.getInstance().getConnection().prepareStatement(sql_command);
            statement.setString(1, student);
            statement.setInt(2, AchievementUtilities.getAchievementID(achievement_name));
            
            statement.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }

        // Insert to teacher_achievement table
        try {
            String sql_command = "INSERT INTO teacher_achievement (teacher_id, achievement_id) VALUES (?, ?)";
            PreparedStatement statement = DatabaseConnection.getInstance().getConnection().prepareStatement(sql_command);
            statement.setString(1, advisor);
            statement.setInt(2, AchievementUtilities.getAchievementID(achievement_name));
            
            statement.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        // Insert to organization_achievement table
        try {
            String sql_command = "INSERT INTO organization_achievement (achievement_id, organization_id) VALUES (?, ?)";
            PreparedStatement statement = DatabaseConnection.getInstance().getConnection().prepareStatement(sql_command);
            statement.setInt(1, AchievementUtilities.getAchievementID(achievement_name));
            statement.setInt(2, organization_id);
            
            statement.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        getServletContext().getRequestDispatcher("/completition.jsp").forward(request, response);
    }
}
