package guide;

import javax.servlet.http.HttpServletRequest;

public class Guide {

    public static String getRoute(HttpServletRequest request, String path) {
        return request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
                + request.getContextPath() + "/" + path;
    }
}
