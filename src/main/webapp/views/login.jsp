<%@ page pageEncoding="UTF-8"%>


<style>

#loginMainDIV{
width: 500px;
margin: 0 auto;
}
#loginMainDIV h2{
text-align: center;
}



</style>

<div class="container">
    <div class="form-container">
        
        
        <div id="loginMainDIV">
        <h2>Login</h2>
        <form action="${pageContext.request.contextPath}/login" method="post">
            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" id="email" name="email" required>
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="email" name="password" required>
            </div>
            <div class="form-group">
                <button type="submit">Login</button>
            </div>
        </form>
        </div>
        
        
    </div>
</div>
