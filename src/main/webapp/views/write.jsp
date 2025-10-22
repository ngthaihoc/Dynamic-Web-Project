<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/write.css">

<div class="writeContainer">
	<div class="writeContentArea">
		<h2>Create/Edit Article</h2>
		<form action="/ASM/write" method="post">
			<input type="hidden" name="id" value="${article.id}">
			<div class="writeFormGroup">
				<label for="writeTitle">Title</label> <input type="text"
					id="writeTitle" name="title" value="${article.title}" required>
			</div>
			<div class="writeFormGroup">
				<label for="writeContentTextarea">Content</label>
				<textarea id="writeContentTextarea" name="content" required>${article.content}</textarea>
			</div>
			<div class="writeButtonGroup">
				<button type="submit">Save</button>
			</div>
		</form>
	</div>

	<div class="writeArticleList">
		<h2>My Articles</h2>
		<table>
			<thead>
				<tr>
					<th>Title</th>
					<th>Actions</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="item" items="${news}">
					<tr>
						<td>${item.title}</td>
						<td><a href="/ASM/write?action=edit&id=${item.id}">Edit</a>
							<a href="/ASM/write?action=delete&id=${item.id}">Delete</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>
