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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
</head>
<body>
    <%-- ================= HEADER ================= --%>
    <header id="navbar" role="banner">
        <div id="mainDiv">
            <nav class="divContent" aria-label="Chuyên mục">
                <%-- Sử dụng fmt:message để hiển thị menu đa ngôn ngữ --%>
                <div class="noiDungNavBar"><a href="${pageContext.request.contextPath}/home"><fmt:message key="nav.home"/></a></div>
                <div class="noiDungNavBar"><a href="#"><fmt:message key="nav.debate"/></a></div>
                <div class="noiDungNavBar"><a href="#"><fmt:message key="nav.tech"/></a></div>
                <div class="noiDungNavBar"><a href="#"><fmt:message key="nav.philosophy"/></a></div>
                <div class="noiDungNavBar"><a href="#"><fmt:message key="nav.economy"/></a></div>
                <div class="noiDungNavBar"><a href="#"><fmt:message key="nav.psychology"/></a></div>
                <div class="noiDungNavBar"><a href="${pageContext.request.contextPath}/write"  aria-label="Viết bài"><fmt:message key="nav.write"/></a></div>
                <div class="noiDungNavBar"><a href="${pageContext.request.contextPath}/admin" aria-label="Quản trị"><fmt:message key="nav.admin"/></a></div>
            </nav>
            <div class="divIcon">
                <form id="searchForm" action="#" method="get" role="search">
                    <input type="search" name="q" placeholder="Tìm bài viết..." aria-label="Tìm kiếm">
                </form>
                <div class="noiDungNavBar"><a href="#" title="Newsletter"><i class="bi bi-envelope"></i></a></div>
                <div class="noiDungNavBar"><a href="${pageContext.request.contextPath}/login" title="Đăng nhập"><i class="bi bi-person-circle"></i></a></div>
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
        <div id="mainFooter">
            <div id="footerName">
                <h3><fmt:message key="footer.company"/></h3>
                <h4><fmt:message key="footer.under"/></h4>
                <h4><fmt:message key="footer.responsible"/></h4>
            </div>
            <address class="footerContact">
                <h3><fmt:message key="footer.contact"/></h3>
                <h4>Email: <a href="mailto:ngthaihoc.vn@gmail.com">ngthaihoc.vn@gmail.com</a></h4>
                <h4><fmt:message key="footer.phone"/>: <a href="tel:0963672903">0963672903</a></h4>
            </address>
            <div id="footerCopyright">
                 <h3><fmt:message key="footer.copyright"/></h3>
                 <%-- Phần tử chuyển đổi ngôn ngữ --%>
                 <div class="language-switcher" style="margin-top: 10px; color: rgb(183, 176, 176);">
                    <a href="?lang=vi" style="text-decoration: none; color: inherit;"><fmt:message key="lang.vietnamese"/></a> | 
                    <a href="?lang=en" style="text-decoration: none; color: inherit;"><fmt:message key="lang.english"/></a>
                 </div>
            </div>
        </div>
    </footer>
</body>
</html>