package controller;

import database.DatabaseConnection;
import guide.Guide;
import java.io.IOException;
import java.io.InputStream;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import model.utilities.AchievementUtilities;

@WebServlet(name = "CompetitionServlet", urlPatterns = {"/register.competition"})
@MultipartConfig(maxFileSize = 999999999) // config file size 
public class CompetitionServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        // Achievement Description
        String achievement_name = request.getParameter("achievement_name"); //
        String publish_date = request.getParameter("publish_date");
        String reward = request.getParameter("reward");
        String category = request.getParameter("category");
        Integer achievement_type = 1;
        InputStream inputStream = null;
        Part competition_file = request.getPart("file");
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("username");

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
        switch (category) {
            case "1":
                category = "วิชาการ (เดี่ยว)";
                break;
            case "2":
                category = "วิชาการ (ทีม)";
                break;
            case "3":
                category = "คุณธรรม จริยธรรม";
                break;
            default:
                category = null;
                break;
        }

        // Student Description
        String student = request.getParameter("co_student");

        // Advisor Description
        String advisor = request.getParameter("advisor");

        // Organization Description
        Integer organization_id = Integer.parseInt(request.getParameter("organization_name"));

        // Optional Description
        String organization_optional = request.getParameter("organization_optional_name");

        // Declare to get a file
        if (competition_file != null) {
            inputStream = competition_file.getInputStream();
        }

        // Insert to Achievement Table
        try {
            String sql_command = "INSERT INTO achievements (achievement_name, photo, date, reward, category, achievement_type, created_at, updated_at)"
                    + "VALUES (?, ?, ?, ?, ?, ?, NOW(), NOW()) ";
            PreparedStatement statement = DatabaseConnection.getInstance().getConnection().prepareStatement(sql_command);
            statement.setString(1, achievement_name);
            if (inputStream != null) {
                statement.setBlob(2, inputStream);
            }
            statement.setString(3, publish_date);
            statement.setString(4, reward);
            statement.setString(5, category);
            statement.setInt(6, achievement_type);

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

        if (session.getAttribute("role").equals("student")) {
            // Insert to teacher_achievement table
            System.out.println("teacher_id = " + advisor);
            try {
                String sql_command = "INSERT INTO teacher_achievement (teacher_id, achievement_id) VALUES (?, ?)";
                PreparedStatement statement = DatabaseConnection.getInstance().getConnection().prepareStatement(sql_command);
                statement.setString(1, advisor);
                statement.setInt(2, AchievementUtilities.getAchievementID(achievement_name));

                statement.executeUpdate();
            } catch (Exception e) {
                e.printStackTrace();
            }
            try {
                String sql_command = "INSERT INTO student_achievement (student_id, achievement_id) VALUES (?, ?)";
                PreparedStatement statement = DatabaseConnection.getInstance().getConnection().prepareStatement(sql_command);
                statement.setString(1, username);
                statement.setInt(2, AchievementUtilities.getAchievementID(achievement_name));

                statement.executeUpdate();
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else if (session.getAttribute("role").equals("teacher")) {
            // Insert to teacher_achievement table
            System.out.println("teacher_id = " + (String) session.getAttribute("teacher_id"));
            try {
                String sql_command = "INSERT INTO teacher_achievement (teacher_id, achievement_id) VALUES (?, ?)";
                PreparedStatement statement = DatabaseConnection.getInstance().getConnection().prepareStatement(sql_command);
                statement.setString(1, (String) session.getAttribute("teacher_id"));
                statement.setInt(2, AchievementUtilities.getAchievementID(achievement_name));

                statement.executeUpdate();
            } catch (Exception e) {
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
        }

        // Insert to organization_achievement table
        if (!(organization_optional.length() == 0)) {
            System.out.println("eiei" + organization_optional.length());
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
            if (organization_id != 0 && organization_optional.length() == 0) {
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

        getServletContext().getRequestDispatcher("/competition.jsp").forward(request, response);
    }
}
