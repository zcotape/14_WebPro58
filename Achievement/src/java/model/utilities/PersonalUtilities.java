package model.utilities;

import database.DatabaseConnection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.personal.Staff;
import model.personal.Student;
import model.personal.Teacher;

public class PersonalUtilities {

    public static boolean doAuthentication(String username, String password) {
        try {
            String sqlCommand = "SELECT username, password FROM it_14.user WHERE username = ? AND password = ?";
            PreparedStatement statement = DatabaseConnection.getInstance().getConnection().prepareStatement(sqlCommand);
            statement.setString(1, username);
            statement.setString(2, password);

            return statement.executeQuery().last();
        } catch (SQLException e) {
            e.printStackTrace();

            return false;
        }
    }

    public static int getRoleID(String username) {
        try {
            String sqlCommand = "SELECT role_id FROM it_14.user WHERE username = ?";
            PreparedStatement statement = DatabaseConnection.getInstance().getConnection().prepareStatement(sqlCommand);
            statement.setString(1, username);

            ResultSet result = statement.executeQuery();

            if (result.last()) {
                return result.getInt("role_id");
            }

            return 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return 0;
        }
    }

    public static void updatePassword(String username, String password) {
        try {
            String sqlCommand = "UPDATE it_14.user SET password = ? WHERE username = ?";
            PreparedStatement statement = DatabaseConnection.getInstance().getConnection().prepareStatement(sqlCommand);
            statement.setString(1, password);
            statement.setString(2, username);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static Student getStudentInformation(String username) {
        try {
            String sqlCommand = "SELECT * FROM it_14.student WHERE username = ?";
            PreparedStatement statement = DatabaseConnection.getInstance().getConnection().prepareStatement(sqlCommand);
            statement.setString(1, username);

            ResultSet result = statement.executeQuery();
            if (result.last()) {
                Student student = new Student();
                student.setStudent_id(username);
                student.setCurriculum_id(result.getInt("curriculum_id"));
                student.setTrack_id(result.getInt("track_id"));
                student.setTh_name(result.getString("th_name"));
                student.setEn_name(result.getString("en_name"));
                student.setEmail(result.getString("email"));

                return student;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public static void updateStudentInformation(Student student, String username) {
        try {
            String sqlCommand = "UPDATE it_14.student SET email = ? WHERE username = ?";
            PreparedStatement statement = DatabaseConnection.getInstance().getConnection().prepareStatement(sqlCommand);
            statement.setString(1, student.getEmail());
            statement.setString(2, username);

            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    public static Teacher getTeacherInformation(String username) {
        try {
            String sqlCommand = "SELECT * FROM it_14.teacher WHERE username = ?";
            PreparedStatement statement = DatabaseConnection.getInstance().getConnection().prepareStatement(sqlCommand);
            statement.setString(1, username);

            ResultSet result = statement.executeQuery();
            if (result.last()) {
                Teacher teacher = new Teacher();
                teacher.setTeacher_id(result.getString("teacher_id"));
                teacher.setStatus_id(result.getInt("status_id"));
                teacher.setTh_prename(result.getString("th_prename"));
                teacher.setTh_name(result.getString("th_name"));
                teacher.setEn_prename(result.getString("en_prename"));
                teacher.setEn_name(result.getString("en_name"));
                teacher.setMobile(result.getString("mobile"));
                teacher.setEmail(result.getString("email"));

                return teacher;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public static void updateTeacherInformation(Teacher teacher, String username) {
        try {
            String sqlCommand = "UPDATE it_14.teacher SET email = ?, mobile = ? WHERE username = ?";
            PreparedStatement statement = DatabaseConnection.getInstance().getConnection().prepareStatement(sqlCommand);
            statement.setString(1, teacher.getEmail());
            statement.setString(2, teacher.getMobile());
            statement.setString(3, username);

            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    public static Staff getStaffInformation(String username) {
        try {
            String sqlCommand = "SELECT * FROM it_14.staff WHERE username = ?";
            PreparedStatement statement = DatabaseConnection.getInstance().getConnection().prepareStatement(sqlCommand);
            statement.setString(1, username);

            ResultSet result = statement.executeQuery();
            if (result.last()) {
                Staff staff = new Staff();
                staff.setStaff_id(result.getString("staff_id"));
                staff.setTh_name(result.getString("th_name"));
                staff.setEn_name(result.getString("en_name"));
                staff.setSection_id(result.getInt("section_id"));
                staff.setMobile(result.getString("mobile"));
                staff.setEmail(result.getString("email"));

                return staff;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public static void updateStaffInformation(Staff staff, String username) {
        try {
            String sqlCommand = "UPDATE it_14.staff SET email = ?, mobile = ? WHERE username = ?";
            PreparedStatement statement = DatabaseConnection.getInstance().getConnection().prepareStatement(sqlCommand);
            statement.setString(1, staff.getEmail());
            statement.setString(2, staff.getMobile());
            statement.setString(3, username);

            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }
}
