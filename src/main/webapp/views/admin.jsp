<%@ page pageEncoding="UTF-8"%>

<div class="admin-container">
    <%-- Thanh điều hướng của trang Admin --%>
    <nav id="adminNav" class="admin-nav">
        <div class="admin-nav-item active" onclick="showSection('quanLyBaiViet', this)">QUẢN LÝ BÀI VIẾT</div>
        <div class="admin-nav-item" onclick="showSection('quanLyLoaiBaiViet', this)">QUẢN LÝ LOẠI BÀI VIẾT</div>
        <div class="admin-nav-item" onclick="showSection('quanLyNguoiDung', this)">QUẢN LÝ NGƯỜI DÙNG</div>
        <div class="admin-nav-item" onclick="showSection('quanLyNewsletter', this)">QUẢN LÝ NEWSLETTER</div>
    </nav>

    <%-- Mục 1: Quản lý bài viết --%>
    <div id="quanLyBaiViet" class="content-section">
        <div class="admin-content-card">
            <h2 class="section-title">QUẢN LÝ BÀI VIẾT</h2>
            <div class="button-group">
                <button class="btn-them" onclick="toggleForm('formBaiViet')">Thêm Bài Viết</button>
            </div>
            
            <table class="data-table">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Tiêu đề</th>
                        <th>Tác giả</th>
                        <th class="actions">Thao tác</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>1</td>
                        <td>Tiêu đề bài viết mẫu 1</td>
                        <td>Nguyễn Thái Học</td>
                        <td class="actions">
                            <button class="btn-sua">Sửa</button>
                            <button class="btn-xoa">Xóa</button>
                        </td>
                    </tr>
                     <tr>
                        <td>2</td>
                        <td>Làm thế nào để trở thành Kỹ sư dữ liệu?</td>
                        <td>Nguyễn Thái Học</td>
                        <td class="actions">
                            <button class="btn-sua">Sửa</button>
                            <button class="btn-xoa">Xóa</button>
                        </td>
                    </tr>
                </tbody>
            </table>

            <div id="formBaiViet" class="admin-form">
                <h3>THÊM BÀI VIẾT MỚI</h3>
                <div class="form-group">
                    <input type="text" placeholder="Tiêu đề bài viết...">
                </div>
                <div class="form-group">
                    <textarea placeholder="Nội dung bài viết..."></textarea>
                </div>
                <div class="button-group">
                    <button class="btn-them">Lưu</button>
                    <button type="button" class="btn-huy" onclick="toggleForm('formBaiViet')">Hủy</button>
                </div>
            </div>
        </div>
    </div>

    <%-- Mục 2: Quản lý loại bài viết (ẩn mặc định) --%>
    <div id="quanLyLoaiBaiViet" class="content-section" style="display:none;">
        <div class="admin-content-card">
            <h2 class="section-title">QUẢN LÝ LOẠI BÀI VIẾT</h2>
            <%-- Nội dung cho mục này sẽ được thêm vào đây --%>
            <p>Chức năng đang được phát triển.</p>
        </div>
    </div>
    
    <%-- Mục 3: Quản lý người dùng (ẩn mặc định) --%>
    <div id="quanLyNguoiDung" class="content-section" style="display:none;">
        <div class="admin-content-card">
            <h2 class="section-title">QUẢN LÝ NGƯỜI DÙNG</h2>
             <p>Chức năng đang được phát triển.</p>
        </div>
    </div>
    
    <%-- Mục 4: Quản lý Newsletter (ẩn mặc định) --%>
    <div id="quanLyNewsletter" class="content-section" style="display:none;">
        <div class="admin-content-card">
             <h2 class="section-title">QUẢN LÝ NEWSLETTER</h2>
             <p>Chức năng đang được phát triển.</p>
        </div>
    </div>
</div>

<script>
    // Hàm hiển thị section được chọn và cập nhật trạng thái active cho tab
    function showSection(sectionId, element) {
        // Ẩn tất cả các section
        document.querySelectorAll('.content-section').forEach(section => {
            section.style.display = 'none';
        });
        // Hiển thị section được chọn
        document.getElementById(sectionId).style.display = 'block';

        // Xóa class 'active' khỏi tất cả các tab
        document.querySelectorAll('.admin-nav-item').forEach(item => {
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