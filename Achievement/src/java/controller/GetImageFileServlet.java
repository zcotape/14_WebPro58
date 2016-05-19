package controller;

import database.DatabaseConnection;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletOutputStream;

@WebServlet(name = "GetImageFileServlet", urlPatterns = "/content.image")
public class GetImageFileServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        // Declare useful variables
        Integer achievement_id = Integer.parseInt(request.getParameter("id"));
        Blob photo_blob = null;
        ServletOutputStream outputStream = response.getOutputStream();
        
        // Database Connection
        try {
            String sql_command = "SELECT photo FROM achievements WHERE id = ?";
            PreparedStatement statement = DatabaseConnection.getInstance().getConnection().prepareStatement(sql_command);
            statement.setInt(1, achievement_id);
            
            ResultSet result = statement.executeQuery();
            if (result.next()) {
                photo_blob = result.getBlob("photo");
            } else {
                return;
            }
            
            response.setContentType("image/jpg");
            InputStream inputStream = photo_blob.getBinaryStream();
            Integer photo_binary_length = (int) photo_blob.length();
            
            Integer buffer_size = 102400;
            byte[] buffer = new byte[buffer_size];
            
            while ((photo_binary_length = inputStream.read(buffer)) != -1) {
                System.out.print("Writing " + photo_binary_length + " bytes");
                outputStream.write(buffer, 0, photo_binary_length);
            }
            
            inputStream.close();
            outputStream.flush();        
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
    }
}
