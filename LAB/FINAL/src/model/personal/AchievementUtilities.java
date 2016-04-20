package model.personal;

import database.DatabaseConnection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Created by earthz on 4/20/16.
 */
public class AchievementUtilities {

    public static int getAchievementID(String achievement_name) {
        try {
            String sqlCommand = "SELECT id FROM it_14.achievements WHERE achievement_name = ?";
            PreparedStatement statement = DatabaseConnection.getInstance().getConnection().prepareStatement(sqlCommand);
            statement.setString(1, achievement_name);

            ResultSet result = statement.executeQuery();

            if (result.last()) {
                return result.getInt("id");
            }

            return 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return 0;
        }
    }
}
