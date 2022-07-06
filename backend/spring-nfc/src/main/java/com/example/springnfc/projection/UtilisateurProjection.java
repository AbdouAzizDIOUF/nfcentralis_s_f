package com.example.springnfc.projection;


import com.example.springnfc.entity.Company;
import com.example.springnfc.entity.InterventionProvider;
import com.example.springnfc.entity.Role;
import com.example.springnfc.entity.Utilisateur;
import org.springframework.data.rest.core.config.Projection;

import java.util.List;

@Projection(types = {Utilisateur.class}, name = "utilisateurProjection")
public interface UtilisateurProjection {
    Long getId();
    String getFirstName();
    String getLastName();
    String getEmail();
    String getUserName();
    String getMobile();
    Company getCompany();
    List<Role> getRoles();
}
