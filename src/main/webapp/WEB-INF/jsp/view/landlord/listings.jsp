<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
    <title>Property Listings</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">

</head>
<body>
<div class="container-fluid my-2">

    <jsp:include page="../layout/menu.jsp" />

    <c:if test="${param.success == 'true'}">
        <div class="alert alert-success" role="alert">
            Property added successfully!
        </div>
    </c:if>

    <table class="table">
        <thead>
        <tr>
            <th scope="col">Id</th>
            <th scope="col">Landlord</th>
            <th scope="col">Property Type</th>
            <th scope="col">Title</th>
            <th scope="col">Bedrooms</th>
            <th scope="col">Bathrooms</th>
            <th scope="col">Square Footage</th>
            <th scope="col">Furnished</th>
            <th scope="col">Pet Friendly</th>
            <th scope="col">Price</th>
            <th scope="col">Residents</th>
            <th scope="col">Description</th>
            <th scope="col">Comments</th>
            <th scope="col">Location</th>
            <th scope="col">Image URLs</th>
            <th scope="col">Edit</th>
            <th scope="col">Delete</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="listing" items="${propertyListings}">
            <tr>
                <td>${listing.id}</td>
                <td>${listing.landlord.name}</td>
                <td>${listing.propertyType}</td>
                <td>${listing.title}</td>
                <td>${listing.numberOfBedrooms}</td>
                <td>${listing.numberOfBathrooms}</td>
                <td>${listing.totalSquareFootage}</td>
                <td>${listing.furnished ? 'Yes' : 'No'}</td>
                <td>${listing.petFriendly ? 'Yes' : 'No'}</td>
                <td>${listing.price}</td>
                <td>${listing.numberOfResidents}</td>
                <td>${listing.description}</td>
                <td>${listing.comments.size()}</td>
                <td>${listing.location.address}</td>
                <td>
                    <ul>
                        <c:forEach var="imageUrl" items="${listing.imageUrls}" varStatus="loopStatus">
                            <li><a href="/app/propertyListings/download/listing/${imageUrl}">Image ${loopStatus.index + 1}</a></li>
                        </c:forEach>
                    </ul>
                </td>
                <td>
                    <a class="btn btn-primary" href="/edit/${listing.id}">Edit</a>
                </td>
                <td>
                    <form action="/app/landlord/propertyListings/delete" method="post">
                        <input type="hidden" name="listingId" value="${listing.id}">
                        <button class="btn btn-danger">Delete</button>
                    </form>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
</body>
</html>
