package controller;

import guide.RouteGuide;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Created by earthz on 2/10/16.
 */
@WebFilter(filterName = "AuthenticationFilter", urlPatterns = "/*")
public class AuthenticationFilter implements Filter {

    private FilterConfig filterConfig;

    public void destroy() {
        this.filterConfig = null;
    }


    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {

        if(filterConfig == null) {
            return;
        }

        HttpServletRequest request = (HttpServletRequest)req;
        HttpServletResponse response = (HttpServletResponse)resp;

        String uri = request.getRequestURI();
        HttpSession session = request.getSession();

        /**
         * Bypass contains file path
         */
        if(uri.contains("/dist/")) {
            chain.doFilter(req, resp);
            return;
        }


        if((session == null || session.getAttribute("user") == null) && !(uri.endsWith("auth"))) {
            response.sendRedirect(RouteGuide.getURL(request, "auth"));
            return;
        } else if(!(session == null || session.getAttribute("user") == null) && uri.endsWith("login")) {
            response.sendRedirect("./");
            return;
        }

        chain.doFilter(req, resp);

    }


    public void init(FilterConfig config) throws ServletException {
        this.filterConfig = config;
    }

}
