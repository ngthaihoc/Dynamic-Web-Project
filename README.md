# Dynamic Web Project (ASM)

Web application quản lý tin tức, bài viết và người dùng xây dựng trên nền tảng Java Servlet & JSP.

## Công nghệ sử dụng

- **Java**: 21
- **Servlet / JSP**: Servlet 4.0.1, JSP 2.3.3, JSTL 1.2
- **Cơ sở dữ liệu**: Microsoft SQL Server (JDBC Driver `mssql-jdbc`)
- **Email**: Jakarta Mail 2.0.1
- **Build tool**: Apache Maven (WAR packaging)
- **Kiến trúc**: MVC (Model - View - Controller), DAO Pattern

## Cấu trúc dự án

```text
src/
├── main/
│   ├── java/
│   │   ├── hocng/
│   │   │   ├── dao/          # Giao diện DAO (CurdDAO, NewsDAO, UsersDAO,...)
│   │   │   ├── daoImp/       # Triển khai DAO với XQuery và SQL
│   │   │   ├── entity/       # Các thực thể (NEWS, CATEGORIES, USERS, NEWSLETTERS)
│   │   │   ├── servlet/      # Servlet điều hướng (HomeServlet)
│   │   │   └── utils/        # Tiện ích JDBC, Reflection ORM, gửi Mail
│   │   └── ngthaihoc/vn/     # Filter (LocaleFilter: i18n & UTF-8)
│   ├── resources/            # Tài nguyên cấu hình, bundle đa ngôn ngữ (i18n)
│   └── webapp/               # JSP views, CSS, media assets, layout
└── test/                     # Unit tests (JUnit 4)
```

## Các tính năng chính

- **Trang chủ (`/home`)**: Hiển thị bài viết nổi bật, bài viết mới nhất, hỗ trợ đa ngôn ngữ và form đăng ký nhận newsletter.
- **Trang quản trị (`/admin`)**: Quản lý danh sách bài viết, loại bài viết, tài khoản người dùng và người đăng ký nhận tin.
- **Biên soạn (`/write`)**: Soạn thảo bài viết mới.
- **Xác thực (`/login`, `/register`)**: Đăng nhập và đăng ký tài khoản.
- **Bộ lọc (`LocaleFilter`)**: Tự động chuyển ngôn ngữ theo session và áp dụng mã hóa UTF-8 toàn bộ request/response.

## Cấu hình môi trường

Hệ thống hỗ trợ cấu hình động qua biến môi trường hoặc System Properties:

| Biến môi trường | System Property | Mặc định | Mô tả |
|---|---|---|---|
| `DB_URL` | `db.url` | Windows Authentication | Chuỗi kết nối SQL Server JDBC |
| `SMTP_USER` | `smtp.user` | `ngthaihoc.vn@gmail.com` | Tài khoản Gmail gửi mail |
| `SMTP_PASS` | `smtp.pass` | (trống) | Mật khẩu ứng dụng (App Password) |

## Hướng dẫn chạy dự án

### 1. Yêu cầu
- JDK 21 trở lên
- Apache Maven 3.8+
- Apache Tomcat 9 hoặc 10 (hỗ trợ Java EE / javax.servlet)
- Microsoft SQL Server

### 2. Build dự án
```bash
mvn clean test
mvn package
```
File artifact `ASM-0.0.1-SNAPSHOT.war` sẽ được tạo tại thư mục `target/`.

### 3. Triển khai
Deploy file `.war` vào thư mục `webapps/` của Apache Tomcat và khởi động máy chủ.
Truy cập ứng dụng tại: `http://localhost:8080/ASM/home` (hoặc context path cấu hình).
