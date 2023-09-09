package com.lqt.pojo;


import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.ArrayList;
import java.util.List;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Entity(name = "property_listings")
public class PropertyListing {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "landlord_id")
    private Landlord landlord;
    private String propertyType;
    // the title of the property listing
    private String title;
    // the number of bedrooms in the property
    private Integer numberOfBedrooms;
    // the number of bathrooms in the property
    private Integer numberOfBathrooms;
    // the total square footage of the property
    private Double totalSquareFootage;
    // whether the property is furnished or not
    private Boolean furnished;
    private Boolean petFriendly;
    private Double price;
    private Integer numberOfResidents;
    private String description;

    @OneToMany(mappedBy = "propertyListing")
    private List<Comment> comments;

    // use Location to store the location of the property
    @OneToOne
    @JoinColumn(name = "location_id")
    private Location location;

    @ElementCollection
    @CollectionTable(name = "property_listing_images", joinColumns = @JoinColumn(name = "property_listing_id"))
    @Column(name = "image_url")
    private List<String> imageUrls;

}
