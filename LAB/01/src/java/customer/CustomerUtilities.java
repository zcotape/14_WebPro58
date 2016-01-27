package customer;

import net.DatabaseConnection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class CustomerUtilities {
    
    private CustomerUtilities() {
        
    }
    
    public static String addCustomer(Customer customer) {
        try {
            String sql_command = "INSERT INTO Customer VALUES(?, ?, ?, ?, ?, ?)";
            PreparedStatement statement = DatabaseConnection.getInstance().getConnection().prepareStatement(sql_command);
            statement.setString(1, customer.getFirstName());
            statement.setString(2, customer.getLastName());
            statement.setString(3, customer.getCompany());
            statement.setString(4, customer.getMobile());
            statement.setString(5, customer.getEmail());
            statement.setString(6, customer.getAddr());

            statement.executeUpdate();
            statement.close();

        } catch (SQLException e) {
            System.out.print("Error");
        } finally {
            System.out.print("Error");
        }
        return null;
    }
    
    public static Customer getCustomer(String firstname, String lastname) {
        try {
            String sql_command = "SELECT * FROM Customer WHERE firstname = ? OR lastname = ?";
            PreparedStatement statement = DatabaseConnection.getInstance().getConnection().prepareStatement(sql_command);
            statement.setString(1, firstname);
            statement.setString(2, lastname);

            return queryCustomer(statement);
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }
    
    private static Customer queryCustomer(PreparedStatement statement) throws SQLException {
        ResultSet result;
        if((result = statement.executeQuery()) != null) {
            result.last();
            Customer customer = new Customer(
                    result.getString("firstname"),
                    result.getString("lastname"),
                    result.getString("company"),
                    result.getString("mobile"),
                    result.getString("email"),
                    result.getString("address")
            );
            statement.close();

            return customer;
        } else {
            return null;
        }
    }
}
