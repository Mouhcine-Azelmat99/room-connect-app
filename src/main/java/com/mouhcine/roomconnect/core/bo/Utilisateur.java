package com.mouhcine.roomconnect.core.bo;

import com.mouhcine.roomconnect.core.bo.enumm.Role;
import jakarta.persistence.*;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@NoArgsConstructor
public class Utilisateur {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String name;
    private String email;
    private String password;
    @Enumerated(value = EnumType.STRING)
    private Role role;

}
