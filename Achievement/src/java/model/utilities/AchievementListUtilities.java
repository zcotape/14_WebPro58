/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.utilities;

import database.DatabaseConnection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import model.personal.Teacher;

/**
 *
 * @author earthz
 */
public class AchievementListUtilities {

    public static List<AchievementList> getInformation() {

        List<AchievementList> achievementList = null;

        try {
            String sqlCommand = "SELECT \n"
                    + "    GROUP_CONCAT(DISTINCT student.th_name) AS 'StudentName', \n"
                    + "    achievements.achievement_name, \n"
                    + "    achievements.category, \n"
                    + "    organizations.organization_name, \n"
                    + "    achievements.reward, \n"
                    + "    achievements.date\n"
                    + "\n"
                    + "    FROM achievements\n"
                    + "    JOIN student_achievement\n"
                    + "    ON (student_achievement.achievement_id = achievements.id)\n"
                    + "    JOIN student\n"
                    + "    ON (student.student_id = student_achievement.student_id)\n"
                    + "    JOIN organization_achievement\n"
                    + "    ON (organization_achievement.achievement_id = student_achievement.achievement_id)\n"
                    + "    JOIN organizations\n"
                    + "    ON (organizations.id = organization_achievement.organization_id)\n"
                    + "    GROUP BY achievements.achievement_name\n"
                    + "    ORDER BY achievements.date";
            PreparedStatement statement = DatabaseConnection.getInstance().getConnection().prepareStatement(sqlCommand);

            ResultSet result = statement.executeQuery();
            while (result.next()) {
                AchievementList list = new AchievementList();
                list.setStudent_name(result.getString("StudentName"));
                list.setAchievement_name(result.getString("achievement_name"));
                list.setCategory(result.getString("category"));
                list.setOrganization_name(result.getString("organization_name"));
                list.setReward(result.getString("reward"));
                list.setDate(result.getString("date"));

                achievementList.add(list);
            }

            return achievementList;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}
