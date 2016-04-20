package controller;

import database.DatabaseConnection;
import model.personal.AchievementUtilities;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet(name = "AchievementRegisterServlet", urlPatterns = "/achievement.register")
public class AchievementRegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        String action = request.getParameter("action");

        if ("competition".equals(action)) {
            String advisor = request.getParameter("advisor");
            String compete_name = request.getParameter("compete_name");
            String compete_topic = request.getParameter("compete_topic");
            String compete_level = request.getParameter("compete_level");
            Integer compete_type = Integer.parseInt(request.getParameter("compete_type"));

            if (!(request.getParameter("organization_optinal_name").equals(""))) {
                String organization_name = request.getParameter("organization_optinal_name");
            } else {
                String organization_name = request.getParameter("orgaization_name");
            }

            String reward_name = request.getParameter("reward_name");
            String reward_description = request.getParameter("reward_description");
            String reward_rank = request.getParameter("reward_rank");
            String date = request.getParameter("publish-date");

            try {
                String sqlCommand = "INSERT INTO it_14.achievements (achievement_name, reward, category, achievement_type) VALUES (?, ?, ?, ?)";
                PreparedStatement statement = DatabaseConnection.getInstance().getConnection().prepareStatement(sqlCommand);
                statement.setString(1, reward_name);
                statement.setString(2, reward_description);
                statement.setString(3, compete_level);
                statement.setInt(4, compete_type);

                statement.executeUpdate();

            } catch (SQLException e) {
                e.printStackTrace();
            }

            try {
                System.err.print(AchievementUtilities.getAchievementID(reward_name));
                String sqlCommand = "INSERT INTO it_14.competitions (event_name, topic, level, rank, achievement_id) VALUES (?, ?, ?, ?, ?)";
                PreparedStatement statement = DatabaseConnection.getInstance().getConnection().prepareStatement(sqlCommand);
                statement.setString(1, compete_name);
                statement.setString(2, compete_topic);
                statement.setString(3, compete_level);
                statement.setString(4, reward_rank);
                statement.setInt(5, AchievementUtilities.getAchievementID(reward_name));
                System.err.print(AchievementUtilities.getAchievementID(reward_name));

                statement.executeUpdate();

            } catch (SQLException e) {
                e.printStackTrace();
            }

        } else if ("participation".equals(action)) {

            String reward_name = request.getParameter("reward_name");
            String organization_name = request.getParameter("organization_name");
            String year = request.getParameter("year");
            String publish_date = request.getParameter("publish_date");

            try {
                String sqlCommand = "INSERT INTO it_14.ambassadors (year, achievement_id) VALUE (?, ?)";
                PreparedStatement statement = DatabaseConnection.getInstance().getConnection().prepareStatement(sqlCommand);
                statement.setString(1, year);

                statement.executeUpdate();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        } else {

            String reward_name = request.getParameter("reward_name");
            String organization_name = request.getParameter("organization_name");
            String expire_date = request.getParameter("expire_date");
            InputStream stream = null;

            Part certiicateFile = request.getPart("certificate_file");

            if (certiicateFile != null) {
                stream = certiicateFile.getInputStream();
            }

            try {
                String sqlCommand = "INSERT INTO it_14.certs (exp_date, achievement_id, cert_file) VALUE (?, ?, ?)";
                PreparedStatement statement = DatabaseConnection.getInstance().getConnection().prepareStatement(sqlCommand);
                statement.setString(1, expire_date);
                if (certiicateFile != null) {
                    statement.setBlob(3, stream);
                }

                statement.executeUpdate();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        getServletContext().getRequestDispatcher("/achievement_register.jsp").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        getServletContext().getRequestDispatcher("/achievement_register.jsp").forward(request, response);
    }
}
