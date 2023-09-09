package com.lqt.security;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import com.lqt.pojo.Utilisateur;
import org.springframework.security.core.*;
import org.springframework.security.core.userdetails.UserDetails;


import java.util.Arrays;
import java.util.Collection;
import java.util.List;
import java.util.stream.Collectors;

public class UserPrincipal implements UserDetails {
    private String name;
    private String password;
    private List<GrantedAuthority> authorities;

    public UserPrincipal (Utilisateur utilisateur){
        this.name= utilisateur.getUsername();
        this.password=utilisateur.getPassword();
        authorities= Arrays.stream(utilisateur.getRole().toString().split(",")).map(SimpleGrantedAuthority::new).collect(Collectors.toList());

    }
    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return authorities;
    }

    @Override
    public String getPassword() {
        return password;
    }

    @Override
    public String getUsername() {
        return name;
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return true;
    }
}
