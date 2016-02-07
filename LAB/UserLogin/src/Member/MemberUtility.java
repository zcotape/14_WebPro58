package Member;

import Database.DatabaseConnection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Created by earthz on 2/5/16.
 */
public class MemberUtility {

    private MemberUtility() {

    }

    // Authentication Class to query data
    public static boolean doAuthentication(String username, String password) {
        try {
            String sqlCommand = "SELECT * FROM Member WHERE username = ? AND password = ?";
            PreparedStatement statement = DatabaseConnection.getInstance().getConnection().prepareStatement(sqlCommand);
            statement.setString(1, username);
            statement.setString(2, password);
            return statement.executeQuery().last();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public static Member getUsername(String username) {
        try {
            String sqlCommand = "SELECT * FROM Member WHERE username = ?";
            PreparedStatement statement = DatabaseConnection.getInstance().getConnection().prepareStatement(sqlCommand);
            statement.setString(1, username);

            ResultSet result = statement.executeQuery();
            result.last();

            return new Member(username, result.getInt("type"));
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }
}
