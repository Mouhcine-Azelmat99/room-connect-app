package com.mouhcine.roomconnect.core.bo;


import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Tenant {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @OneToOne
    @JoinColumn(name = "user_id")
    private Utilisateur user;

    @ManyToMany
    @JoinTable(name = "tenant_follows",
            joinColumns = @JoinColumn(name = "tenant_id"),
            inverseJoinColumns = @JoinColumn(name = "landlord_id"))
    private List<Landlord> followedLandlords;

    @OneToOne
    @JoinColumn(name = "location_id")
    private Location location;

}
