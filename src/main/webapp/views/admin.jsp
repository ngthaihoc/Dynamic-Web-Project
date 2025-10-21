<%@ page pageEncoding="UTF-8"%>
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
            <%-- Nội dung cho mục này sẽ được thêm vào đây --%>
            <p>Chức năng đang được phát triển.</p>
        </div>
    </div>
    
    <%-- Mục 3: Quản lý người dùng (ẩn mặc định) --%>
    <div id="adminQuanLyNguoiDung" class="adminContentSection" style="display:none;">
        <div class="adminContentCard">
            <h2 class="adminSectionTitle">QUẢN LÝ NGƯỜI DÙNG</h2>
             <p>Chức năng đang được phát triển.</p>
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