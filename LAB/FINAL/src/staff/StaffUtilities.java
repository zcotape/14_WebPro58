package staff;

import database.DatabaseConnection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class StaffUtilities {

    private StaffUtilities() {

    }

    public static boolean doAuthentication(String username, String password) {
        try {
            String sqlCommand = "SELECT * FROM staffs WHERE staff_id = ? AND password = ?";
            PreparedStatement statement = DatabaseConnection.getInstance().getConnection().prepareStatement(sqlCommand);
            statement.setString(1, username);
            statement.setString(2, password);
            return statement.executeQuery().last();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public static String getStaffID(String username) {
        try {
            String sqlCommand = "SELECT * FROM staffs WHERE staff_id = ?";
            PreparedStatement statement = DatabaseConnection.getInstance().getConnection().prepareStatement(sqlCommand);
            statement.setString(1, username);

            ResultSet result = statement.executeQuery();
            result.last();

            return result.getString("staff_id");
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }

    public static Staff getStaffInformation(String staff_id) {
        try {
            String sqlCommand = "SELECT * FROM staffs WHERE staff_id = ?";
            PreparedStatement statement = DatabaseConnection.getInstance().getConnection().prepareStatement(sqlCommand);
            statement.setString(1, staff_id);

            ResultSet result = statement.executeQuery();
            result.last();

            return new Staff(staff_id, result.getString("first_name"),
                    result.getString("last_name"), result.getString("email"));
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }
}
