<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Property Listing</title>
</head>
<body>
<h1>Edit Property Listing</h1>
<form action="EditListingServlet" method="post">
    <!-- Add form fields for editing property details -->
    <label>Title:</label>
    <input type="text" name="title" value="${listing.title}"><br>
    <!-- Add other property fields here -->
    <input type="hidden" name="id" value="${listing.id}">
    <input type="submit" value="Save Changes">
</form>
</body>
</html>
