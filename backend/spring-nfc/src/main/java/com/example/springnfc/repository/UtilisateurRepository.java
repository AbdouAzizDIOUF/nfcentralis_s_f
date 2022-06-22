package com.example.springnfc.repository;

import com.example.springnfc.entity.Utilisateur;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@RepositoryRestResource
@Repository
public interface UtilisateurRepository extends JpaRepository<Utilisateur, Long> {

    Optional<Utilisateur> findByUserName(String username);

    Boolean existsByUserName(String username);

    Boolean existsByEmail(String email);
}