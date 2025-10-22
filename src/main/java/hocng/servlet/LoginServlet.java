package hocng.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import hocng.daoImp.UsersDAOImpl;
import hocng.entity.USERS;

@WebServlet("/auth")
public class LoginServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = req.getParameter("id");
		String password = req.getParameter("password");

		UsersDAOImpl usersDAOImpl = new UsersDAOImpl();
		USERS user = usersDAOImpl.findById(id);

		if (user != null && hocng.utils.PasswordUtils.checkPassword(password, user.getPassword())) {
			HttpSession session = req.getSession();
			session.setAttribute("user", user);
			resp.sendRedirect("/ASM/home");
		} else {
			req.setAttribute("error", "Invalid credentials");
			req.getRequestDispatcher("/views/login.jsp").forward(req, resp);
		}
	}

}
