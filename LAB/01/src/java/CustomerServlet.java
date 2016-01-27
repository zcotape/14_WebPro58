import customer.Customer;
import customer.CustomerUtilities;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = {"/CustomerServlet"})
public class CustomerServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        String function = request.getParameter("function");
        switch (function) {
            case "addCustomer": addCustomer(request, response); break;
            case "findCustomer": findCustomer(request, response); break;
        }

        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/showCustomer.jsp");
        dispatcher.forward(request, response);
    }

    private void addCustomer(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("newcustomer", CustomerUtilities.addCustomer(new Customer(
                request.getParameter("firstname"),
                request.getParameter("lastname"),
                request.getParameter("company"),
                request.getParameter("mobile"),
                request.getParameter("email"),
                request.getParameter("address"))));

    }

    private void findCustomer(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("findcustomer", CustomerUtilities.getCustomer(
                request.getParameter("firstname"),
                request.getParameter("lastname")
                ));
        
    }
}
