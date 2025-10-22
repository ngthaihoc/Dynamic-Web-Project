<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/login.css">

<div class="loginContainer">
    <div class="loginFormContainer">
        
        
        <div id="loginMainDiv">
        <h2>Login</h2>
        <c:if test="${not empty error}">
            <p style="color: red;">${error}</p>
        </c:if>
        <form action="${pageContext.request.contextPath}/login" method="post">
            <div class="loginFormGroup">
                <label for="loginId">ID</label>
                <input type="text" id="loginId" name="id" required>
            </div>
            <div class="loginFormGroup">
                <label for="password">Password</label>
                <input type="password" id="loginPassword" name="password" required>
            </div>
            <div class="loginFormGroup">
                <button type="submit">Login</button>
            </div>
        </form>
        <div class="loginRegisterLink">
            <p>Don't have an account? <a href="${pageContext.request.contextPath}/register">Register here</a></p>
        </div>
        </div>
        
        
    </div>
</div>
