<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Add Property Listing</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
</head>
<body>
<div class="container">
    <h1 class="my-4">Add a New Property Listing</h1>
    <form method="POST" action="/app/landlord/propertyListings/add" enctype="multipart/form-data">
        <div class="row">
            <div class="col-6">
                <div class="mb-3">
                    <label for="propertyType" class="form-label">Property Type</label>
                    <input class="form-control" id="propertyType" name="propertyType"/>
                </div>
                <div class="mb-3">
                    <label for="title" class="form-label">Title</label>
                    <input class="form-control" name="title" id="title"/>
                </div>
                <div class="mb-3">
                    <label for="numberOfBedrooms" class="form-label">Number of Bedrooms</label>
                    <input class="form-control" type="number" name="numberOfBedrooms" id="numberOfBedrooms"/>
                </div>
                <div class="mb-3">
                    <label for="numberOfBathrooms" class="form-label">Number of Bathrooms</label>
                    <input class="form-control" type="number" name="numberOfBathrooms" id="numberOfBathrooms"/>
                </div>
                <div class="mb-3">
                    <label for="totalSquareFootage" class="form-label">Total Square Footage</label>
                    <input class="form-control" type="number" name="totalSquareFootage" id="totalSquareFootage"/>
                </div>
                <div class="mb-3">
                    <label for="furnished" class="form-label">Furnished</label>
                    <input type="checkbox"  id="furnished" name="furnished"/>
                </div>
                <div class="mb-3">
                    <label for="petFriendly" class="form-label">PetFriendly</label>
                    <input type="checkbox"  id="petFriendly" name="petFriendly"/>
                </div>
                <div class="mb-3">
                    <label for="price" class="form-label">Price</label>
                    <input class="form-control" type="number" name="price" id="price"/>
                </div>
                <div class="mb-3">
                    <label for="numberOfResidents" class="form-label">Number of Residents</label>
                    <input class="form-control" type="number" id="numberOfResidents" name="numberOfResidents"/>
                </div>
                <div class="mb-3">
                    <label for="location.address" class="form-label">Location address</label>
                    <input class="form-control" id="location.address" name="location.address"/>
                </div>
            </div>
            <div class="col-6">
                <div class="mb-3">
                    <label for="description" class="form-label">Description</label>
                    <textarea name="description" class="form-control" id="description"></textarea>
                </div>

                <div class="mb-3">
                    <label for="location.city" class="form-label">Location city</label>
                    <input class="form-control" id="location.city" name="location.city"/>
                </div>
                <div class="mb-3">
                    <label for="location.country" class="form-label">Location country</label>
                    <input class="form-control" id="location.country" name="location.country"/>
                </div>
                <div class="mb-3">
                    <label for="location.stateProvince" class="form-label">Location stateProvince</label>
                    <input class="form-control" id="location.stateProvince" name="location.stateProvince"/>
                </div>
                <div class="mb-3">
                    <label for="location.zipPostalCode" class="form-label">Location zipPostalCode</label>
                    <input class="form-control" id="location.zipPostalCode" name="location.zipPostalCode"/>
                </div>
                <div class="mb-3">
                    <label for="image1" class="form-label">Image 1</label>
                    <input type="file" id="image1" name="image1" class="form-control"/>
                </div>
                <div class="mb-3">
                    <label for="image2" class="form-label">Image 1</label>
                    <input type="file" id="image2" name="image2" class="form-control"/>
                </div>
                <div class="mb-3">
                    <label for="image3" class="form-label">Image 1</label>
                    <input type="file" id="image3" name="image3" class="form-control"/>
                </div>
            </div>
        </div>
        <div class="d-grid gap-2 mb-3">
            <button class="btn btn-primary" type="submit">Add Listing</button>
            <a class="btn" href="/app/">Cancel</a>
        </div>
    </form>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
</body>
</html>
