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
</style>
<div class="container">
    <div class="form-container">
        <h2>Register</h2>
        <form action="${pageContext.request.contextPath}/register" method="post">
            <div class="form-group">
                <label for="username">Username</label>
                <input type="text" id="username" name="username" required>
            </div>
            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" id="email" name="email" required>
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" required>
            </div>
            <div class="form-group">
                <button type="submit">Register</button>
            </div>
        </form>
    </div>
</div>
