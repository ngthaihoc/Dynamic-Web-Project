<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/admin.css">

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
                    <c:choose>
                        <c:when test="${not empty newsList}">
                            <c:forEach var="item" items="${newsList}">
                                <tr>
                                    <td>${item.id}</td>
                                    <td>${item.title}</td>
                                    <td>${item.author}</td>
                                    <td class="adminActions">
                                        <button class="adminBtnSua">Sửa</button>
                                        <button class="adminBtnXoa">Xóa</button>
                                    </td>
                                </tr>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <tr>
                                <td>1</td>
                                <td>Tiêu đề bài viết mẫu 1</td>
                                <td>Nguyễn Thái Học</td>
                                <td class="adminActions">
                                    <button class="adminBtnSua">Sửa</button>
                                    <button class="adminBtnXoa">Xóa</button>
                                </td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td>Làm thế nào để trở thành Kỹ sư dữ liệu?</td>
                                <td>Nguyễn Thái Học</td>
                                <td class="adminActions">
                                    <button class="adminBtnSua">Sửa</button>
                                    <button class="adminBtnXoa">Xóa</button>
                                </td>
                            </tr>
                        </c:otherwise>
                    </c:choose>
                </tbody>
            </table>

            <div id="adminFormBaiViet" class="adminForm">
                <h3>THÊM BÀI VIẾT MỚI</h3>
                <div class="adminFormGroup">
                    <input type="text" placeholder="Tiêu đề bài viết...">
                </div>
                <div class="adminFormGroup">
                    <textarea placeholder="Nội dung bài viết..."></textarea>
                </div>
                <div class="adminButtonGroup">
                    <button class="adminBtnThem">Lưu</button>
                    <button type="button" class="adminBtnHuy" onclick="toggleForm('adminFormBaiViet')">Hủy</button>
                </div>
            </div>
        </div>
    </div>

    <%-- Mục 2: Quản lý loại bài viết (ẩn mặc định) --%>
    <div id="adminQuanLyLoaiBaiViet" class="adminContentSection" style="display:none;">
        <div class="adminContentCard">
            <h2 class="adminSectionTitle">QUẢN LÝ LOẠI BÀI VIẾT</h2>
            <c:choose>
                <c:when test="${not empty categoryList}">
                    <table class="adminDataTable">
                        <thead>
                            <tr>
                                <th>Mã loại</th>
                                <th>Tên loại</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="cat" items="${categoryList}">
                                <tr>
                                    <td>${cat.id}</td>
                                    <td>${cat.name}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </c:when>
                <c:otherwise>
                    <p>Chưa có loại bài viết.</p>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
    
    <%-- Mục 3: Quản lý người dùng (ẩn mặc định) --%>
    <div id="adminQuanLyNguoiDung" class="adminContentSection" style="display:none;">
        <div class="adminContentCard">
            <h2 class="adminSectionTitle">QUẢN LÝ NGƯỜI DÙNG</h2>
            <c:choose>
                <c:when test="${not empty userList}">
                    <table class="adminDataTable">
                        <thead>
                            <tr>
                                <th>Tài khoản</th>
                                <th>Họ và tên</th>
                                <th>Email</th>
                                <th>Vai trò</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="u" items="${userList}">
                                <tr>
                                    <td>${u.id}</td>
                                    <td>${u.fullname}</td>
                                    <td>${u.email}</td>
                                    <td>${u.role ? 'Quản trị viên' : 'Người dùng'}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </c:when>
                <c:otherwise>
                    <p>Chưa có người dùng.</p>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
    
    <%-- Mục 4: Quản lý Newsletter (ẩn mặc định) --%>
    <div id="adminQuanLyNewsletter" class="adminContentSection" style="display:none;">
        <div class="adminContentCard">
            <h2 class="adminSectionTitle">QUẢN LÝ NEWSLETTER</h2>
            <c:choose>
                <c:when test="${not empty newsletterList}">
                    <table class="adminDataTable">
                        <thead>
                            <tr>
                                <th>Email</th>
                                <th>Trạng thái</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="nl" items="${newsletterList}">
                                <tr>
                                    <td>${nl.email}</td>
                                    <td>${nl.enabled ? 'Đang hoạt động' : 'Tạm dừng'}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </c:when>
                <c:otherwise>
                    <p>Chưa có người đăng ký nhận tin.</p>
                </c:otherwise>
            </c:choose>
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