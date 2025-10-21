<%@ page pageEncoding="UTF-8"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/write.css">

<%-- 
    Vì file này được nhúng vào layout.jsp, 
    nó sẽ tự động kế thừa file style.css chung.
    Chúng ta không cần khai báo lại <html>, <head>, <body>.
--%>

<div class="writeContainer">
    <div class="writeContentArea">
        <div class="writeFormGroup">
            <%-- Sử dụng lại class chung từ style.css --%>
            <input type="text" id="writeTitle" placeholder="Nhập tiêu đề bài viết...">
        </div>
        
        <div class="writeFormGroup">
            <%-- Sử dụng lại class chung và thêm id riêng --%>
            <textarea id="writeContentTextarea" placeholder="Nhập nội dung bài viết..."></textarea>
        </div>
        
        <div class="writeButtonGroup">
            <%-- Sử dụng lại các class button chung --%>
            <button class="writeBtnSave">Lưu nháp</button>
            <button class="writeBtnNext">Đăng bài</button>
        </div>
    </div>
</div>
