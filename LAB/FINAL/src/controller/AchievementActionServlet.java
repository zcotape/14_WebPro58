package controller;

import guide.Guide;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by earthz on 4/10/16.
 */
@WebServlet(name = "AchievementActionServlet", urlPatterns = "/achievement.action")
public class AchievementActionServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String edit_id = request.getParameter("edit_id");
        String drop_id = request.getParameter("drop_id");

        String action = request.getParameter("action");

        if ("edit".equals(action)) {
            System.out.println(edit_id + " E");
        } else if ("drop".equals(action)) {


        }

        response.sendRedirect(Guide.getRoute(request, "portfolio"));


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


    }
}
