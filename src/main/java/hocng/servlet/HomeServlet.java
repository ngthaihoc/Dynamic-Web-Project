package hocng.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hocng.daoImp.CategoriesDAOImpl;
import hocng.daoImp.NewletterDAOImpl;
import hocng.daoImp.NewsDAOImpl;
import hocng.daoImp.UsersDAOImpl;
import hocng.entity.NEWSLETTERS;

/**
 * Servlet implementation class HomeServlet
 */
@WebServlet({ "/home", "/admin", "/write", "/login", "/register" })
public class HomeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public HomeServlet() {
		super();
	}

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String method = request.getMethod();
		String email = request.getParameter("email");
		if ("POST".equalsIgnoreCase(method) && email != null && !email.trim().isEmpty()) {
			try {
				NEWSLETTERS nl = new NEWSLETTERS();
				nl.setEmail(email.trim());
				nl.setEnabled(true);
				new NewletterDAOImpl().create(nl);
				request.setAttribute("newsletterMsg", "Đăng ký nhận tin thành công!");
			} catch (Exception ex) {
				request.setAttribute("newsletterMsg", "Đăng ký không thành công hoặc email đã tồn tại.");
			}
		}

		String urlString = request.getRequestURI();

		if (urlString.contains("admin")) {
			try {
				request.setAttribute("newsList", new NewsDAOImpl().findAll());
				request.setAttribute("categoryList", new CategoriesDAOImpl().findAll());
				request.setAttribute("userList", new UsersDAOImpl().findAll());
				request.setAttribute("newsletterList", new NewletterDAOImpl().findAll());
			} catch (Exception ex) {
				// DB unavailable fallback to default JSP view
			}
			urlString = "/views/admin.jsp";
		} else if (urlString.contains("write")) {
			urlString = "/views/write.jsp";
		} else if (urlString.contains("login")) {
			urlString = "/views/login.jsp";
		} else if (urlString.contains("register")) {
			urlString = "/views/register.jsp";
		} else {
			try {
				request.setAttribute("homeNews", new NewsDAOImpl().findHomeNews());
				request.setAttribute("categoryList", new CategoriesDAOImpl().findAll());
			} catch (Exception ex) {
				// DB unavailable fallback to default JSP view
			}
			urlString = "/views/main.jsp";
		}

		request.setAttribute("view", urlString);
		request.getRequestDispatcher("/layout.jsp").forward(request, response);
	}
}
