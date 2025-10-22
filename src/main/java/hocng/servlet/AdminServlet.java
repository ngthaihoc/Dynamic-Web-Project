package hocng.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hocng.daoImp.CategoriesDAOImpl;
import hocng.daoImp.NewsDAOImpl;
import hocng.daoImp.UsersDAOImpl;
import hocng.entity.CATEGORIES;
import hocng.entity.NEWS;
import hocng.entity.USERS;

@WebServlet("/admin")
public class AdminServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        NewsDAOImpl newsDAOImpl = new NewsDAOImpl();
        UsersDAOImpl usersDAOImpl = new UsersDAOImpl();
        CategoriesDAOImpl categoriesDAOImpl = new CategoriesDAOImpl();

        if (action != null) {
            String id = req.getParameter("id");
            if (action.startsWith("delete")) {
                if (action.equals("deleteUser")) {
                    usersDAOImpl.deleteById(id);
                } else if (action.equals("deleteCategory")) {
                    categoriesDAOImpl.deleteById(id);
                } else if (action.equals("deleteArticle")) {
                    newsDAOImpl.deleteById(id);
                }
                resp.sendRedirect("/ASM/admin");
                return;
            } else if (action.startsWith("edit")) {
                if (action.equals("editUser")) {
                    req.setAttribute("user", usersDAOImpl.findById(id));
                } else if (action.equals("editCategory")) {
                    req.setAttribute("category", categoriesDAOImpl.findById(id));
                } else if (action.equals("editArticle")) {
                    req.setAttribute("article", newsDAOImpl.findById(id));
                }
            }
        }

        req.setAttribute("users", usersDAOImpl.findAll());
        req.setAttribute("categories", categoriesDAOImpl.findAll());
        req.setAttribute("news", newsDAOImpl.findAll());

        req.getRequestDispatcher("/views/admin.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action != null) {
            if (action.equals("createUser")) {
                UsersDAOImpl usersDAOImpl = new UsersDAOImpl();
                USERS user = new USERS();
                user.setId(req.getParameter("id"));
                String password = req.getParameter("password");
                if (password == null || password.length() < 8) {
                    req.setAttribute("error", "Password must be at least 8 characters long.");
                    doGet(req, resp);
                    return;
                }
                user.setPassword(hocng.utils.PasswordUtils.hashPassword(password));
                user.setFullname(req.getParameter("fullname"));
                user.setEmail(req.getParameter("email"));
                user.setRole(req.getParameter("role").equals("1"));
                usersDAOImpl.create(user);
            } else if (action.equals("createCategory")) {
                CategoriesDAOImpl categoriesDAOImpl = new CategoriesDAOImpl();
                CATEGORIES category = new CATEGORIES();
                category.setId(req.getParameter("id"));
                category.setName(req.getParameter("name"));
                categoriesDAOImpl.create(category);
            } else if (action.equals("createArticle")) {
                NewsDAOImpl newsDAOImpl = new NewsDAOImpl();
                NEWS article = new NEWS();
                article.setId(req.getParameter("id"));
                article.setTitle(req.getParameter("title"));
                article.setContent(req.getParameter("content"));
                article.setAuthor(req.getParameter("author"));
                article.setCategoryId(req.getParameter("categoryId"));
                newsDAOImpl.create(article);
            } else if (action.equals("updateUser")) {
                UsersDAOImpl usersDAOImpl = new UsersDAOImpl();
                USERS user = usersDAOImpl.findById(req.getParameter("id"));
                user.setFullname(req.getParameter("fullname"));
                user.setEmail(req.getParameter("email"));
                user.setRole(req.getParameter("role").equals("1"));
                String password = req.getParameter("password");
                if (password != null && !password.isEmpty()) {
                    if (password.length() >= 8) {
                        user.setPassword(hocng.utils.PasswordUtils.hashPassword(password));
                    } else {
                        req.setAttribute("error", "Password must be at least 8 characters long.");
                        doGet(req, resp);
                        return;
                    }
                }
                usersDAOImpl.update(user);
            } else if (action.equals("updateCategory")) {
                CategoriesDAOImpl categoriesDAOImpl = new CategoriesDAOImpl();
                CATEGORIES category = categoriesDAOImpl.findById(req.getParameter("id"));
                category.setName(req.getParameter("name"));
                categoriesDAOImpl.update(category);
            } else if (action.equals("updateArticle")) {
                NewsDAOImpl newsDAOImpl = new NewsDAOImpl();
                NEWS article = newsDAOImpl.findById(req.getParameter("id"));
                article.setTitle(req.getParameter("title"));
                article.setContent(req.getParameter("content"));
                article.setAuthor(req.getParameter("author"));
                article.setCategoryId(req.getParameter("categoryId"));
                newsDAOImpl.update(article);
            }
        }
        resp.sendRedirect("/ASM/admin");
    }

}
