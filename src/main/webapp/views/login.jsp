<%@ page pageEncoding="UTF-8"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/login.css">

<div class="loginContainer">
    <div class="loginFormContainer">
        
        
        <div id="loginMainDiv">
        <h2>Login</h2>
        <form action="${pageContext.request.contextPath}/login" method="post">
            <div class="loginFormGroup">
                <label for="loginEmail">Email</label>
                <input type="email" id="loginEmail" name="email" required>
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
