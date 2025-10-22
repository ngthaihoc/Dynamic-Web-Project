<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%-- Thiết lập ngôn ngữ dựa trên session, mặc định là tiếng Anh ('en') --%>
<fmt:setLocale value="${sessionScope.lang != null ? sessionScope.lang : 'en'}" />
<%-- Nạp gói ngôn ngữ chung từ src/main/resources/i18n/global.properties --%>
<fmt:setBundle basename="i18n.global" />

<!DOCTYPE html>
<html lang="${sessionScope.lang != null ? sessionScope.lang : 'en'}">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Wellum</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/layout.css">
</head>
<body>
    <%-- ================= HEADER ================= --%>
    <header id="layoutNavbar" role="banner">
        <div id="layoutMainDiv">
            <nav class="layoutDivContent" aria-label="Chuyên mục">
                <%-- Sử dụng fmt:message để hiển thị menu đa ngôn ngữ --%>
                <div class="layoutNoiDungNavBar"><a href="${pageContext.request.contextPath}/home"><fmt:message key="nav.home"/></a></div>
                <div class="layoutNoiDungNavBar"><a href="#"><fmt:message key="nav.debate"/></a></div>
                <div class="layoutNoiDungNavBar"><a href="#"><fmt:message key="nav.tech"/></a></div>
                <div class="layoutNoiDungNavBar"><a href="#"><fmt:message key="nav.philosophy"/></a></div>
                <div class="layoutNoiDungNavBar"><a href="#"><fmt:message key="nav.economy"/></a></div>
                <div class="layoutNoiDungNavBar"><a href="#"><fmt:message key="nav.psychology"/></a></div>
                <div class="layoutNoiDungNavBar"><a href="${pageContext.request.contextPath}/write"  aria-label="Viết bài"><fmt:message key="nav.write"/></a></div>
                <div class="layoutNoiDungNavBar"><a href="${pageContext.request.contextPath}/admin" aria-label="Quản trị"><fmt:message key="nav.admin"/></a></div>
            </nav>
            <div class="layoutDivIcon">
                <form id="layoutSearchForm" action="#" method="get" role="search">
                    <input type="search" name="q" placeholder="Tìm bài viết..." aria-label="Tìm kiếm">
                </form>
                <div class="layoutNoiDungNavBar"><a href="#" title="Newsletter"><i class="bi bi-envelope"></i></a></div>
                <c:if test="${empty sessionScope.user}">
                    <div class="layoutNoiDungNavBar"><a href="${pageContext.request.contextPath}/login" title="Đăng nhập"><i class="bi bi-person-circle"></i></a></div>
                </c:if>
                <c:if test="${not empty sessionScope.user}">
                    <div class="layoutNoiDungNavBar"><a href="${pageContext.request.contextPath}/logout" title="Đăng xuất"><i class="bi bi-box-arrow-right"></i></a></div>
                </c:if>
            </div>
        </div>
    </header>

    <%-- ================= MAIN CONTENT (DYNAMIC) ================= --%>
    <main>
        <%-- Nội dung từ các file view (main.jsp, admin.jsp, ...) sẽ được nạp vào đây --%>
        <jsp:include page="${view}" />
    </main>

    <%-- ================= FOOTER ================= --%>
    <footer role="contentinfo">
        <div id="layoutMainFooter">
            <div id="layoutFooterName">
                <h3><fmt:message key="footer.company"/></h3>
                <h4><fmt:message key="footer.under"/></h4>
                <h4><fmt:message key="footer.responsible"/></h4>
            </div>
            <address class="layoutFooterContact">
                <h3><fmt:message key="footer.contact"/></h3>
                <h4>Email: <a href="mailto:ngthaihoc.vn@gmail.com">ngthaihoc.vn@gmail.com</a></h4>
                <h4><fmt:message key="footer.phone"/>: <a href="tel:0963672903">0963672903</a></h4>
            </address>
            <div id="layoutFooterCopyright">
                 <h3><fmt:message key="footer.copyright"/></h3>
                 <%-- Phần tử chuyển đổi ngôn ngữ --%>
                 <div class="layoutLanguageSwitcher" style="margin-top: 10px; color: rgb(183, 176, 176);">
                    <a href="?lang=vi" style="text-decoration: none; color: inherit;"><fmt:message key="lang.vietnamese"/></a> | 
                    <a href="?lang=en" style="text-decoration: none; color: inherit;"><fmt:message key="lang.english"/></a>
                 </div>
            </div>
        </div>
    </footer>
</body>
</html>