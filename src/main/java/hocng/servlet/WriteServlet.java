package hocng.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.UUID;
import hocng.daoImp.NewsDAOImpl;
import hocng.entity.NEWS;
import hocng.entity.USERS;

@WebServlet("/write")
public class WriteServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        USERS user = (USERS) req.getSession().getAttribute("user");
        NewsDAOImpl newsDAOImpl = new NewsDAOImpl();

        if (action != null) {
            String id = req.getParameter("id");
            NEWS article = newsDAOImpl.findById(id);

            // Authorization check
            if (article != null && !article.getAuthor().equals(user.getId())) {
                resp.sendRedirect("/ASM/write");
                return;
            }

            if (action.equals("edit")) {
                req.setAttribute("article", article);
            } else if (action.equals("delete")) {
                newsDAOImpl.deleteById(id);
                resp.sendRedirect("/ASM/write");
                return;
            }
        }

        req.setAttribute("news", newsDAOImpl.findByAuthor(user.getId()));
        req.getRequestDispatcher("/views/write.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        USERS user = (USERS) req.getSession().getAttribute("user");
        String id = req.getParameter("id");
        String title = req.getParameter("title");
        String content = req.getParameter("content");

        NewsDAOImpl newsDAOImpl = new NewsDAOImpl();
        if (id != null && !id.isEmpty()) {
            // update
            NEWS article = newsDAOImpl.findById(id);

            // Authorization check
            if (article != null && !article.getAuthor().equals(user.getId())) {
                resp.sendRedirect("/ASM/write");
                return;
            }

            article.setTitle(title);
            article.setContent(content);
            newsDAOImpl.update(article);
        } else {
            // create
            NEWS article = new NEWS();
            article.setId(UUID.randomUUID().toString());
            article.setTitle(title);
            article.setContent(content);
            article.setAuthor(user.getId());
            newsDAOImpl.create(article);
        }
        resp.sendRedirect("/ASM/write");
    }

}
