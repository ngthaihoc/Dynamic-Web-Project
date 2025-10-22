package hocng.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import hocng.daoImp.CategoriesDAOImpl;
import hocng.daoImp.NewletterDAOImpl;
import hocng.daoImp.NewsDAOImpl;
import hocng.daoImp.UsersDAOImpl;
import hocng.entity.USERS;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class HomeServlet
 */
@WebServlet({ "/home", "/login", "/register", "/article" })
public class HomeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public HomeServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String urlString = request.getRequestURI();

		if (urlString.contains("login")) {

			urlString = "/views/login.jsp";
		} else if (urlString.contains("register")) {

			urlString = "/views/register.jsp";
		} else if (urlString.contains("article")) {
			// article detail page
			String id = request.getParameter("id");
			NewsDAOImpl newsDAOImpl = new NewsDAOImpl();
			request.setAttribute("article", newsDAOImpl.findById(id));

			urlString = "/views/article.jsp";
		} else {
			// main page
			NewsDAOImpl newsDAOImpl = new NewsDAOImpl();
			String categoryId = request.getParameter("category");
			if (categoryId != null && !categoryId.isEmpty()) {
				request.setAttribute("news", newsDAOImpl.findByCategory(categoryId));
			} else {
				request.setAttribute("news", newsDAOImpl.findAll());
			}

			CategoriesDAOImpl categoriesDAOImpl = new CategoriesDAOImpl();
			request.setAttribute("categories", categoriesDAOImpl.findAll());

			urlString = "/views/main.jsp";
		}

		request.setAttribute("view", urlString);

		request.getRequestDispatcher("/layout.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		NewletterDAOImpl newletterDAOImpl = new NewletterDAOImpl();
		String email = request.getParameter("email");
		newletterDAOImpl.create(new hocng.entity.NEWSLETTERS(email, true));

		String name = request.getParameter("displayName");

		String content = "Thank you " + name + " for subscribing to our newsletter. You will receive new bulletins soon. We look forward to you reading them all, hehe.";
		try {
			hocng.utils.sendMail.sendEmail(email, "Newsletter Subscription", content);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		response.sendRedirect("/ASM/home");
	}

}
