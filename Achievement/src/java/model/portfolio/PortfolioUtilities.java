package model.portfolio;

import database.DatabaseConnection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

public class PortfolioUtilities {

    protected List<Portfolio> portfolioList;

    public static String getPortfolioID(String portfolio_id) {
        try {
            String sqlCommand = "SELECT * FROM archieves WHERE student_id = ?";
            PreparedStatement statement = DatabaseConnection.getInstance().getConnection().prepareStatement(sqlCommand);
            statement.setString(1, portfolio_id);

            ResultSet result = statement.executeQuery();
            result.last();

            return result.getString("arch_id");
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }
}
