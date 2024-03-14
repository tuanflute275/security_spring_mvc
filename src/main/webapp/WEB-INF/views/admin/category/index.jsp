<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
</head>
<body>

	<div class="container my-5">
		<h2 class="text-center text-uppercase my-3">Danh Sách Danh Mục</h2>
		<a class="btn btn-primary my-3" href="category-add" role="button">Add
			New +</a>	
		<table class="table">
			<thead>
				<tr>
					<th>CategoryId</th>
					<th>Name</th>
					<th>Description</th>
					<th>Action</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="c" items="${categories}">
					<tr>
						<td>${ c.id }</td>
						<td>${ c.name }</td>
						<td>
							<p class="mb-0">${ c.description }</p>
						</td>
						<td><a class="btn btn-warning text-white"
							href="editCategory?id=${ c.id }" role="button">Edit</a> <a
							onclick="return confirm('Do you want to delete this item ?')"
							class="btn btn-danger" href="deleteCategory?id=${ c.id }"
							role="button">Delete</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>



	<!-- jQuery library -->
	<script
		src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>

	<!-- Popper JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

	<!-- Latest compiled JavaScript -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>