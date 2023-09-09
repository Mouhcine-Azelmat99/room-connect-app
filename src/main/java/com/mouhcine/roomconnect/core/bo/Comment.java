package com.mouhcine.roomconnect.core.bo;


import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity(name = "comments")
public class Comment {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "user_id")
    private Utilisateur user;

    @ManyToOne
    @JoinColumn(name = "property_listing_id")
    private PropertyListing propertyListing;

    // Additional fields for CommentEntity
    private String text;
    private String timestamp; // You can use a suitable date/time format
    @OneToOne
    @JoinColumn(name = "created_by")
    private Utilisateur createdBy;

}
