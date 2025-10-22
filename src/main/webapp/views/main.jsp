<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/main.css">

<section class="mainBanner" aria-label="Banner">
    <div id="mainBannerDiv">
        <%-- Đường dẫn đến ảnh banner --%>
        <img src="${pageContext.request.contextPath}/assets/media/7d527980982e11f0b9538ffc36f64168.jpg" alt="Banner Wellum">
    </div>
</section>

<fmt:setLocale value="${sessionScope.lang != null ? sessionScope.lang : 'en'}" />
<fmt:setBundle basename="i18n.home"/>

<section id="mainContentSection" aria-labelledby="featuredTitle">
    <div id="mainContentContainer">
        <div id="mainDivTextContent">
            <h2 id="featuredTitle" style="color: rgb(183, 176, 176);">
                <%-- Sử dụng fmt:message để hiển thị tiêu đề --%>
                <fmt:message key="home.featured.title"/>
            </h2>
        </div>

		<div id="mainDivContent" role="list">
			<c:forEach var="item" items="${news}">
				<article class="mainContent" role="listitem">
					<a href="/ASM/article?id=${item.id}">
						<div class="mainPic">
							<img
								src="${pageContext.request.contextPath}/assets/media/noibat1.jpg"
								alt="Không Self-help thì Ai help?">
						</div>
						<div class="mainTitle">
							<div class="mainRealTitle">${item.title}</div>
						</div>
					</a>
				</article>
			</c:forEach>
		</div>
	</div>
</section>

<section class="mainContentPlus" aria-label="Nội dung chính">
	<div id="mainContentPlusContainer">
		<section id="mainContentOne" aria-labelledby="listTitle">
			<h2 id="listTitle" class="visually-hidden">Danh sách bài viết</h2>

			<c:forEach var="item" items="${news}">
				<article class="mainContentOne">
					<a class="mainCardLink" href="/ASM/article?id=${item.id}">
						<div class="mainContentOnePic">
							<img
								src="${pageContext.request.contextPath}/assets/media/Baiviet1-QuáKhứHiệnTạiVàTươngLai.jpg"
								alt="QUÁ KHỨ HIỆN TẠI VÀ TƯƠNG LAI">
						</div>
						<div class="mainContentOneTitle">
							<div class="mainTitleOne">${item.title}</div>
							<p class="mainTenBaiVietOne">${item.content}</p>
							<div class="mainInfoTacGia">${item.author}</div>
						</div>
					</a>
				</article>
			</c:forEach>
		</section>

		<aside id="mainContentTwo" aria-label="Đăng ký & Banner">
			<div>
				<form action="/ASM/home" method="get">
					<select name="category" onchange="this.form.submit()">
						<option value="">-- Chọn chuyên mục --</option>
						<c:forEach var="item" items="${categories}">
							<option value="${item.id}"
								${param.category == item.id ? 'selected' : ''}>${item.name}</option>
						</c:forEach>
					</select>
				</form>
			</div>
            <div class="mainNewletterDiv">
                <h2>Đăng ký nhận newsletter hàng tuần của chúng tôi</h2>
                <h3>Nội dung giới thiệu newsletter</h3>

                <form id="mainNewsletterForm" action="/home" method="post">
                    <h4><label for="newsletterEmail">Nhập email của bạn</label></h4>
                    <input type="email" id="mainNewsletterEmail" name="email" placeholder="email@domain.com" required>

                    <h4><label for="newsletterName">Chúng mình có thể gọi bạn là?</label></h4>
                    <input type="text" id="mainNewsletterName" name="displayName" placeholder="Tên hiển thị" maxlength="64">

                    <button type="submit">ĐĂNG KÝ</button>
                </form>
            </div>

            <div id="mainContentTwoBanner">
                <img src="${pageContext.request.contextPath}/assets/media/Screenshot 2025-10-03 151611.png" alt="Chiến dịch nổi bật">
            </div>
        </aside>
    </div>
</section>