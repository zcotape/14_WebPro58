package guide;

import javax.servlet.http.HttpServletRequest;

public class RouteGuide {
    public static String getURL(HttpServletRequest request, String path) {
        return request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() +
                request.getContextPath() + "/" + path;
    }
}
