<%@ page pageEncoding="UTF-8"%>

<%-- 
    Vì file này được nhúng vào layout.jsp, 
    nó sẽ tự động kế thừa file style.css chung.
    Chúng ta không cần khai báo lại <html>, <head>, <body>.
--%>

<%-- CSS dành riêng cho trang viết bài --%>
<style>
    .write-container {
        max-width: 900px;
        margin: 40px auto; /* Thêm khoảng cách trên dưới */
        padding: 0 15px; /* Thêm padding hai bên cho an toàn trên màn hình nhỏ */
    }
    
    #content-textarea {
        min-height: 50vh; /* Chiều cao tối thiểu bằng 50% chiều cao màn hình */
        resize: vertical; /* Cho phép người dùng thay đổi chiều cao */
    }
</style>

<div class="write-container">
    <div class="content-area">
        <div class="form-group">
            <%-- Sử dụng lại class chung từ style.css --%>
            <input type="text" id="title" placeholder="Nhập tiêu đề bài viết...">
        </div>
        
        <div class="form-group">
            <%-- Sử dụng lại class chung và thêm id riêng --%>
            <textarea id="content-textarea" placeholder="Nhập nội dung bài viết..."></textarea>
        </div>
        
        <div class="button-group">
            <%-- Sử dụng lại các class button chung --%>
            <button class="btn-save">Lưu nháp</button>
            <button class="btn-next">Đăng bài</button>
        </div>
    </div>
</div>
