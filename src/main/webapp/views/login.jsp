<%@ page pageEncoding="UTF-8"%>
<style>
    .container {
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
    }
    .form-container {
        background-color: rgb(74, 74, 74);
        padding: 2rem;
        border-radius: 10px;
        width: 100%;
        max-width: 400px;
    }
    .form-group {
        margin-bottom: 1rem;
    }
    .form-group label {
        display: block;
        margin-bottom: 0.5rem;
    }
    .form-group input {
        width: 100%;
        padding: 0.5rem;
        border-radius: 5px;
        border: 1px solid #ccc;
    }
    .form-group button {
        width: 100%;
        padding: 0.75rem;
        border: none;
        border-radius: 5px;
        background-color: #3c6cdd;
        color: white;
        font-size: 1rem;
        cursor: pointer;
    }
    .form-group button:hover {
        background-color: #2c5cd5;
    }
    .register-link {
        text-align: center;
        margin-top: 1rem;
    }
    .register-link a {
        color: #92b0f5;
        text-decoration: none;
    }
</style>
<div class="container">
    <div class="form-container">
        <h2>Login</h2>
        <form action="${pageContext.request.contextPath}/login" method="post">
            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" id="email" name="email" required>
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" required>
            </div>
            <div class="form-group">
                <button type="submit">Login</button>
            </div>
        </form>
        <div class="register-link">
            <p>Don't have an account? <a href="${pageContext.request.contextPath}/register">Register here</a></p>
        </div>
    </div>
</div>
