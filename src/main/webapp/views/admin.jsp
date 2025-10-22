<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/admin.css">

<div class="adminContainer">
    <%-- Thanh điều hướng của trang Admin --%>
    <nav id="adminNav" class="adminNav">
        <div class="adminNavItem active" onclick="showSection('adminQuanLyBaiViet', this)">QUẢN LÝ BÀI VIẾT</div>
        <div class="adminNavItem" onclick="showSection('adminQuanLyLoaiBaiViet', this)">QUẢN LÝ LOẠI BÀI VIẾT</div>
        <div class="adminNavItem" onclick="showSection('adminQuanLyNguoiDung', this)">QUẢN LÝ NGƯỜI DÙNG</div>
        <div class="adminNavItem" onclick="showSection('adminQuanLyNewsletter', this)">QUẢN LÝ NEWSLETTER</div>
    </nav>

    <%-- Mục 1: Quản lý bài viết --%>
    <div id="adminQuanLyBaiViet" class="adminContentSection">
        <div class="adminContentCard">
            <h2 class="adminSectionTitle">QUẢN LÝ BÀI VIẾT</h2>
            <div class="adminButtonGroup">
                <button class="adminBtnThem" onclick="toggleForm('adminFormBaiViet')">Thêm Bài Viết</button>
            </div>
            
            <table class="adminDataTable">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Tiêu đề</th>
                        <th>Tác giả</th>
                        <th class="adminActions">Thao tác</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="item" items="${news}">
                        <tr>
                            <td>${item.id}</td>
                            <td>${item.title}</td>
                            <td>${item.author}</td>
                            <td class="adminActions">
                                <a href="/ASM/admin?action=editArticle&id=${item.id}">Sửa</a>
                                <a href="/ASM/admin?action=deleteArticle&id=${item.id}">Xóa</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>

            <div id="adminFormBaiViet" class="adminForm">
                <h3>THÊM/SỬA BÀI VIẾT</h3>
                <form action="/ASM/admin" method="post">
                    <input type="hidden" name="action" value="${empty article.id ? 'createArticle' : 'updateArticle'}">
                    <input type="hidden" name="id" value="${article.id}">
                    <div class="adminFormGroup">
                        <input type="text" name="id" placeholder="ID bài viết..." value="${article.id}" ${empty article.id ? '' : 'readonly'}>
                    </div>
                    <div class="adminFormGroup">
                        <input type="text" name="title" placeholder="Tiêu đề bài viết..." value="${article.title}">
                    </div>
                    <div class="adminFormGroup">
                        <textarea name="content" placeholder="Nội dung bài viết...">${article.content}</textarea>
                    </div>
                    <div class="adminFormGroup">
                        <input type="text" name="author" placeholder="Tác giả..." value="${article.author}">
                    </div>
                    <div class="adminFormGroup">
                        <select name="categoryId">
                            <c:forEach var="item" items="${categories}">
                                <option value="${item.id}" ${item.id == article.categoryId ? 'selected' : ''}>${item.name}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="adminButtonGroup">
                        <button type="submit" class="adminBtnThem">Lưu</button>
                        <button type="button" class="adminBtnHuy" onclick="toggleForm('adminFormBaiViet')">Hủy</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <%-- Mục 2: Quản lý loại bài viết (ẩn mặc định) --%>
    <div id="adminQuanLyLoaiBaiViet" class="adminContentSection" style="display:none;">
        <div class="adminContentCard">
            <h2 class="adminSectionTitle">QUẢN LÝ LOẠI BÀI VIẾT</h2>
            <div class="adminButtonGroup">
                <button class="adminBtnThem" onclick="toggleForm('adminFormLoaiBaiViet')">Thêm Loại Bài Viết</button>
            </div>

            <table class="adminDataTable">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th class="adminActions">Thao tác</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="item" items="${categories}">
                        <tr>
                            <td>${item.id}</td>
                            <td>${item.name}</td>
                            <td class="adminActions">
                                <a href="/ASM/admin?action=editCategory&id=${item.id}">Sửa</a>
                                <a href="/ASM/admin?action=deleteCategory&id=${item.id}">Xóa</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>

            <div id="adminFormLoaiBaiViet" class="adminForm">
                <h3>THÊM/SỬA LOẠI BÀI VIẾT</h3>
                <form action="/ASM/admin" method="post">
                    <input type="hidden" name="action" value="${empty category.id ? 'createCategory' : 'updateCategory'}">
                    <input type="hidden" name="id" value="${category.id}">
                    <div class="adminFormGroup">
                        <input type="text" name="id" placeholder="ID loại bài viết..." value="${category.id}" ${empty category.id ? '' : 'readonly'}>
                    </div>
                    <div class="adminFormGroup">
                        <input type="text" name="name" placeholder="Tên loại bài viết..." value="${category.name}">
                    </div>
                    <div class="adminButtonGroup">
                        <button type="submit" class="adminBtnThem">Lưu</button>
                        <button type="button" class="adminBtnHuy" onclick="toggleForm('adminFormLoaiBaiViet')">Hủy</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    
    <%-- Mục 3: Quản lý người dùng (ẩn mặc định) --%>
    <div id="adminQuanLyNguoiDung" class="adminContentSection" style="display:none;">
        <div class="adminContentCard">
            <h2 class="adminSectionTitle">QUẢN LÝ NGƯỜI DÙNG</h2>
            <div class="adminButtonGroup">
                <button class="adminBtnThem" onclick="toggleForm('adminFormNguoiDung')">Thêm Người Dùng</button>
            </div>

            <table class="adminDataTable">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Fullname</th>
                        <th>Email</th>
                        <th>Role</th>
                        <th class="adminActions">Thao tác</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="item" items="${users}">
                        <tr>
                            <td>${item.id}</td>
                            <td>${item.fullname}</td>
                            <td>${item.email}</td>
                            <td>${item.role ? 'Admin' : 'Reporter'}</td>
                            <td class="adminActions">
                                <a href="/ASM/admin?action=editUser&id=${item.id}">Sửa</a>
                                <a href="/ASM/admin?action=deleteUser&id=${item.id}">Xóa</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>

            <div id="adminFormNguoiDung" class="adminForm">
                <h3>THÊM/SỬA NGƯỜI DÙNG</h3>
                <c:if test="${not empty error}">
                    <p style="color: red;">${error}</p>
                </c:if>
                <form action="/ASM/admin" method="post">
                    <input type="hidden" name="action" value="${empty user.id ? 'createUser' : 'updateUser'}">
                    <input type="hidden" name="id" value="${user.id}">
                    <div class="adminFormGroup">
                        <input type="text" name="id" placeholder="ID người dùng..." value="${user.id}" ${empty user.id ? '' : 'readonly'}>
                    </div>
                    <div class="adminFormGroup">
                        <input type="password" name="password" placeholder="Mật khẩu...">
                    </div>
                    <div class="adminFormGroup">
                        <input type="text" name="fullname" placeholder="Họ và tên..." value="${user.fullname}">
                    </div>
                    <div class="adminFormGroup">
                        <input type="email" name="email" placeholder="Email..." value="${user.email}">
                    </div>
                    <div class="adminFormGroup">
                        <select name="role">
                            <option value="0" ${user.role ? '' : 'selected'}>Reporter</option>
                            <option value="1" ${user.role ? 'selected' : ''}>Admin</option>
                        </select>
                    </div>
                    <div class="adminButtonGroup">
                        <button type="submit" class="adminBtnThem">Lưu</button>
                        <button type="button" class="adminBtnHuy" onclick="toggleForm('adminFormNguoiDung')">Hủy</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    
    <%-- Mục 4: Quản lý Newsletter (ẩn mặc định) --%>
    <div id="adminQuanLyNewsletter" class="adminContentSection" style="display:none;">
        <div class="adminContentCard">
             <h2 class="adminSectionTitle">QUẢN LÝ NEWSLETTER</h2>
             <p>Chức năng đang được phát triển.</p>
        </div>
    </div>
</div>

<script>
    // Hàm hiển thị section được chọn và cập nhật trạng thái active cho tab
    function showSection(sectionId, element) {
        // Ẩn tất cả các section
        document.querySelectorAll('.adminContentSection').forEach(section => {
            section.style.display = 'none';
        });
        // Hiển thị section được chọn
        document.getElementById(sectionId).style.display = 'block';

        // Xóa class 'active' khỏi tất cả các tab
        document.querySelectorAll('.adminNavItem').forEach(item => {
            item.classList.remove('active');
        });
        // Thêm class 'active' vào tab được click
        element.classList.add('active');
    }

    // Hàm ẩn/hiện form
    function toggleForm(formId) {
        const form = document.getElementById(formId);
        form.style.display = (form.style.display === 'block') ? 'none' : 'block';
    }
</script>