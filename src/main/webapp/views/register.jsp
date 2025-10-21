<%@ page pageEncoding="UTF-8"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/register.css">
<div class="registerContainer">
    <div class="registerFormContainer">
        <h2>Register</h2>
        <form action="${pageContext.request.contextPath}/register" method="post">
            <div class="registerFormGroup">
                <label for="username">Username</label>
                <input type="text" id="registerUsername" name="username" required>
            </div>
            <div class="registerFormGroup">
                <label for="email">Email</label>
                <input type="email" id="registerEmail" name="email" required>
            </div>
            <div class="registerFormGroup">
                <label for="password">Password</label>
                <input type="password" id="registerPassword" name="password" required>
            </div>
            <div class="registerFormGroup">
                <button type="submit">Register</button>
            </div>
        </form>
    </div>
</div>
