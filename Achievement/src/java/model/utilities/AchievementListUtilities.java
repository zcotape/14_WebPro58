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

    public static AchievementList getCompetitionInformation(Integer achievement_id) {
        try {
            String sqlCommand = "SELECT competitions.event_name, competitions.topic, competitions.level, competitions.rank,\n"
                    + "achievements.achievement_name, achievements.category, achievements.reward, achievements.date\n"
                    + "FROM achievements\n"
                    + "JOIN competitions\n"
                    + "ON (achievements.id = competitions.achievement_id)\n"
                    + "WHERE achievements.id = ?";
            PreparedStatement statement = DatabaseConnection.getInstance().getConnection().prepareStatement(sqlCommand);
            statement.setInt(1, achievement_id);

            ResultSet result = statement.executeQuery();
            if (result.next()) {
                AchievementList list = new AchievementList();
                list.setAchievement_name(result.getString("achievement_name"));
                list.setCategory(result.getString("category"));
                list.setDate(result.getString("date"));
                list.setEvent_name(result.getString("event_name"));
                list.setLevel(result.getString("level"));
                list.setRank(result.getString("rank"));
                list.setReward(result.getString("reward"));
                list.setTopic(result.getString("topic"));
                return list;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public static AchievementList getAmbassadorInformation(Integer achievement_id) {
        try {
            String sqlCommand = "SELECT ambassadors.year,\n"
                    + "achievements.achievement_name, achievements.category, achievements.reward, achievements.date\n"
                    + "FROM achievements\n"
                    + "JOIN ambassadors\n"
                    + "ON (achievements.id = ambassadors.achievement_id)\n"
                    + "WHERE achievements.id = ?;";
            PreparedStatement statement = DatabaseConnection.getInstance().getConnection().prepareStatement(sqlCommand);
            statement.setInt(1, achievement_id);

            ResultSet result = statement.executeQuery();
            if (result.next()) {
                AchievementList list = new AchievementList();
                list.setYear(result.getString("year"));
                list.setAchievement_name(result.getString("achievement_name"));
                list.setDate(result.getString("date"));
                return list;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public static AchievementList getCertificateInformation(Integer achievement_id) {
        try {
            String sqlCommand = "SELECT certs.exp_date,\n"
                    + "achievements.achievement_name, achievements.category, achievements.reward, achievements.date\n"
                    + "FROM achievements\n"
                    + "JOIN certs\n"
                    + "ON (achievements.id = certs.achievement_id)\n"
                    + "WHERE achievements.id = ?;";
            PreparedStatement statement = DatabaseConnection.getInstance().getConnection().prepareStatement(sqlCommand);
            statement.setInt(1, achievement_id);
            System.out.println(achievement_id);
            ResultSet result = statement.executeQuery();
            if (result.next()) {
                AchievementList list = new AchievementList();
                list.setExpire_date(result.getString("exp_date"));
                list.setAchievement_name(result.getString("achievement_name"));
                list.setDate(result.getString("date"));
                return list;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}
