<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="container">
    <h1>${article.title}</h1>
    <p>
        <strong>Author:</strong> ${article.author}
    </p>
    <div>${article.content}</div>
</div>