package controller;

import guide.Guide;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import javax.servlet.http.HttpSession;
import model.utilities.QueryUtilities;

@WebServlet(name = "ResultServlet", urlPatterns = {"/guest.result", "/result"})
public class ResultServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        // Declare Parameter
        String query_string = request.getParameter("search_query");
        
        request.setAttribute("query_string", QueryUtilities.QueryByWord(query_string));

        getServletContext().getRequestDispatcher("/result_guest.jsp").forward(request, response);
        
    }
}
