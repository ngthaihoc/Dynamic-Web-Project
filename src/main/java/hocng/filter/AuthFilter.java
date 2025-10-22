package hocng.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import hocng.entity.USERS;

@WebFilter(urlPatterns = { "/write", "/admin" })
public class AuthFilter implements Filter {

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse resp = (HttpServletResponse) response;
        HttpSession session = req.getSession();
        USERS user = (USERS) session.getAttribute("user");

        if (user == null) {
            resp.sendRedirect("/ASM/login");
        } else {
            String uri = req.getRequestURI();
            if (uri.contains("/admin") && !user.isRole()) {
                resp.sendRedirect("/ASM/home");
            } else {
                chain.doFilter(request, response);
            }
        }
    }

}
