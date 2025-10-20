<%@ page pageEncoding="UTF-8"%>
<style>
    .logincontainer {
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
    }
    .loginform-container {
        background-color: rgb(74, 74, 74);
        padding: 2rem;
        border-radius: 10px;
        width: 100%;
        max-width: 400px;
    }
    .loginform-group {
        margin-bottom: 1rem;
    }
    .loginform-group label {
        display: block;
        margin-bottom: 0.5rem;
    }
    .loginform-group input {
        width: 100%;
        padding: 0.5rem;
        border-radius: 5px;
        border: 1px solid #ccc;
    }
    .loginform-group button {
        width: 100%;
        padding: 0.75rem;
        border: none;
        border-radius: 5px;
        background-color: #3c6cdd;
        color: white;
        font-size: 1rem;
        cursor: pointer;
    }
    .loginform-group button:hover {
        background-color: #2c5cd5;
    }
    .loginregister-link {
        text-align: center;
        margin-top: 1rem;
    }
    .loginregister-link a {
        color: #92b0f5;
        text-decoration: none;
    }
</style>


<style>

#loginMainDIV{
width: 500px;
margin: 0 auto;
}
#loginMainDIV h2{
text-align: center;
}



</style>

<div class="logincontainer">
    <div class="form-container">
        
        
        <div id="loginMainDIV">
        <h2>Login</h2>
        <form action="${pageContext.request.contextPath}/login" method="post">
            <div class="loginform-group">
                <label for="loginemail">Email</label>
                <input type="email" id="loginemail" name="email" required>
            </div>
            <div class="loginform-group">
                <label for="password">Password</label>
                <input type="password" id="loginemail" name="password" required>
            </div>
            <div class="loginform-group">
                <button type="submit">Login</button>
            </div>
        </form>
        <div class="loginregister-link">
            <p>Don't have an account? <a href="${pageContext.request.contextPath}/register">Register here</a></p>
        </div>
        </div>
        
        
    </div>
</div>
