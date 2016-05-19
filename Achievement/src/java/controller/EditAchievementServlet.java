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
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.Part;
import model.utilities.AchievementList;
import model.utilities.AchievementListUtilities;
import model.utilities.AchievementUtilities;

@WebServlet(name = "EditAchievementServlet", urlPatterns = "/edit.achievement")
@MultipartConfig(maxFileSize = 999999999) // config file size 
public class EditAchievementServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        String action = request.getParameter("action");
        Integer achievement_id = Integer.parseInt((String) request.getParameter("achievement_id"));
        
        switch (action) {
            case "competition":
                // Declare information
                String achievement_name = request.getParameter("achievement_name"); //
                String publish_date = request.getParameter("publish_date");
                String reward = request.getParameter("reward");
                String category = request.getParameter("category");
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

                // Declare to get a file
                if (competition_file != null) {
                    inputStream = competition_file.getInputStream();
                }
                         
                // Update to Achievement Table
                try {
                    String sql_command = "UPDATE achievements SET achievement_name = ?, date = ?, reward = ?, category = ?, updated_at = NOW() WHERE id = ?";
                    PreparedStatement statement = DatabaseConnection.getInstance().getConnection().prepareStatement(sql_command);
                    statement.setString(1, achievement_name);
                    statement.setString(2, publish_date);
                    statement.setString(3, reward);
                    statement.setString(4, category);
                    statement.setInt(5, achievement_id);

                    statement.executeUpdate();
                } catch (Exception e) {
                    e.printStackTrace();
                }

                if (inputStream != null) {
                    try {
                        String sql_command = "UPDATE achievements SET photo = ?, updated_at = NOW() WHERE id = ?";
                        PreparedStatement statement = DatabaseConnection.getInstance().getConnection().prepareStatement(sql_command);
                        statement.setBlob(1, inputStream);
                        statement.setInt(2, achievement_id);

                        statement.executeUpdate();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }

                // Insert to Competition Table
                try {
                    String sql_command = "UPDATE competitions SET event_name = ?, topic = ?, level = ?, rank = ? WHERE achievement_id = ?";
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
                break;
                
            case "ambassador":
                // Declare information
                achievement_name = request.getParameter("achievement_name"); //
                publish_date = request.getParameter("publish_date");
                inputStream = null;
                Part ambassador_file = request.getPart("ambassador_file");

                // Ambassador Description
                String year = request.getParameter("year");
                
                // Update to Achievement Table
                try {
                    String sql_command = "UPDATE achievements SET achievement_name = ?, date = ?, updated_at = NOW() WHERE id = ?";
                    PreparedStatement statement = DatabaseConnection.getInstance().getConnection().prepareStatement(sql_command);
                    statement.setString(1, achievement_name);
                    statement.setString(2, publish_date);
                    statement.setInt(3, achievement_id);

                    statement.executeUpdate();
                } catch (Exception e) {
                    e.printStackTrace();
                }

                if (inputStream != null) {
                    try {
                        String sql_command = "UPDATE achievements SET photo = ?, updated_at = NOW() WHERE id = ?";
                        PreparedStatement statement = DatabaseConnection.getInstance().getConnection().prepareStatement(sql_command);
                        statement.setBlob(1, inputStream);
                        statement.setInt(2, achievement_id);

                        statement.executeUpdate();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }

                // Insert to Ambassador Table
                try {
                    String sql_command = "UPDATE ambassadors SET year = ? WHERE achievement_id = ?";
                    PreparedStatement statement = DatabaseConnection.getInstance().getConnection().prepareStatement(sql_command);
                    statement.setString(1, year);
                    statement.setInt(2, AchievementUtilities.getAchievementID(achievement_name));

                    statement.executeUpdate();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                break;
            case "certificate":
                // Declare information
                achievement_name = request.getParameter("achievement_name"); //
                publish_date = request.getParameter("publish_date");
                inputStream = null;
                Part certificate_file = request.getPart("certificate_file");
                
                // Ambassador Description
                String expired_date = request.getParameter("expire_date");
                
                // Update to Achievement Table
                try {
                    String sql_command = "UPDATE achievements SET achievement_name = ?, date = ?, updated_at = NOW() WHERE id = ?";
                    PreparedStatement statement = DatabaseConnection.getInstance().getConnection().prepareStatement(sql_command);
                    statement.setString(1, achievement_name);
                    statement.setString(2, publish_date);
                    statement.setInt(3, achievement_id);

                    statement.executeUpdate();
                } catch (Exception e) {
                    e.printStackTrace();
                }

                if (inputStream != null) {
                    try {
                        String sql_command = "UPDATE achievements SET photo = ?, updated_at = NOW() WHERE id = ?";
                        PreparedStatement statement = DatabaseConnection.getInstance().getConnection().prepareStatement(sql_command);
                        statement.setBlob(1, inputStream);
                        statement.setInt(2, achievement_id);

                        statement.executeUpdate();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }

                // Insert to Certs Table
                try {
                    String sql_command = "UPDATE certs SET exp_date = ? WHERE achievement_id = ?";
                    PreparedStatement statement = DatabaseConnection.getInstance().getConnection().prepareStatement(sql_command);
                    statement.setString(1, expired_date);
                    statement.setInt(2, AchievementUtilities.getAchievementID(achievement_name));

                    statement.executeUpdate();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                break;
            default:
                break;
        }
        response.sendRedirect(Guide.getRoute(request, "achievement.manager"));
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        String achievement_type = request.getParameter("edit");
        Integer achievement_id = Integer.parseInt(request.getParameter("achievement_id"));

        request.setAttribute("achievement_type", achievement_type);
        request.setAttribute("achievement_id", achievement_id);

        switch (achievement_type) {
            case "1":
                // Competition
                AchievementList competition_list = AchievementListUtilities.getCompetitionInformation(achievement_id);
                if (competition_list != null) {
                    request.setAttribute("event_name", competition_list.getEvent_name());
                    request.setAttribute("topic", competition_list.getTopic());
                    request.setAttribute("level", getLevelID(competition_list.getLevel()));
                    request.setAttribute("category", getCategoryID(competition_list.getCategory()));
                    request.setAttribute("achievement_name", competition_list.getAchievement_name());
                    request.setAttribute("rank", getRankID(competition_list.getRank()));
                    request.setAttribute("reward", competition_list.getReward());
                    request.setAttribute("publish_date", competition_list.getDate());
                }
                break;
            case "2":
                // Ambassador
                AchievementList ambassador_list = AchievementListUtilities.getAmbassadorInformation(achievement_id);
                if (ambassador_list != null) {
                    request.setAttribute("achievement_name", ambassador_list.getAchievement_name());
                    request.setAttribute("reward", ambassador_list.getReward());
                    request.setAttribute("publish_date", ambassador_list.getDate());
                    request.setAttribute("year", ambassador_list.getYear());
                }
                break;
            case "3":
                // Certificate
                AchievementList certificate_list = AchievementListUtilities.getCertificateInformation(achievement_id);
                if (certificate_list != null) {
                    request.setAttribute("achievement_name", certificate_list.getAchievement_name());
                    request.setAttribute("reward", certificate_list.getReward());
                    request.setAttribute("publish_date", certificate_list.getDate());
                    request.setAttribute("expire_date", certificate_list.getExpire_date());
                }
                break;
            default:
                break;
        }
        getServletContext().getRequestDispatcher("/edit_achievement.jsp").forward(request, response);
    }

    private Integer getLevelID(String level) {
        switch (level) {
            case "ระดับชั้น":
                return 1;
            case "ระดับสถาบันการศึกษา / มหาวิทยาลัย":
                return 2;
            case "ระดับจังหวัด":
                return 3;
            case "ระดับภูมิภาค":
                return 4;
            case "ระดับประเทศ":
                return 5;
            case "ระดับนานาชาติ":
                return 6;
            default:
                return 0;
        }
    }

    private Integer getRankID(String rank) {
        switch (rank) {
            case "รางวัลชนะเลิศ":
                return 1;
            case "รางวัลรองชนะเลิศอันดับที่ 1":
                return 2;
            case "รางวัลรองชนะเลิศอันดับที่ 2":
                return 3;
            case "รางวัลชมเชย":
                return 4;
            case "ได้เข้าร่วมการแข่งขัน":
                return 5;
            default:
                return 0;
        }
    }

    private Integer getCategoryID(String category) {
        switch (category) {
            case "วิชาการ (เดี่ยว)":
                return 1;
            case "วิชาการ (ทีม)":
                return 2;
            case "คุณธรรม จริยธรรม":
                return 3;
            default:
                return 0;
        }
    }
}
