package student;

import database.DatabaseConnection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class StudentUtilities {

    private StudentUtilities() {

    }

    public static boolean doAuthentication(String username, String password) {
        try {
            String sqlCommand = "SELECT * FROM students WHERE student_id = ? AND password = ?";
            PreparedStatement statement = DatabaseConnection.getInstance().getConnection().prepareStatement(sqlCommand);
            statement.setString(1, username);
            statement.setString(2, password);
            return statement.executeQuery().last();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public static String getStudentID(String username) {
        try {
            String sqlCommand = "SELECT * FROM students WHERE student_id = ?";
            PreparedStatement statement = DatabaseConnection.getInstance().getConnection().prepareStatement(sqlCommand);
            statement.setString(1, username);

            ResultSet result = statement.executeQuery();
            result.last();

            return result.getString("student_id");
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }

    public static Student getStudentInformation(String student_id) {
        try {
            String sqlCommand = "SELECT * FROM students WHERE student_id = ?";
            PreparedStatement statement = DatabaseConnection.getInstance().getConnection().prepareStatement(sqlCommand);
            statement.setString(1, student_id);

            ResultSet result = statement.executeQuery();
            result.last();

            return new Student(student_id, result.getInt("year"), result.getString("first_name"),
                    result.getString("last_name"), result.getString("email"));
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }

}
