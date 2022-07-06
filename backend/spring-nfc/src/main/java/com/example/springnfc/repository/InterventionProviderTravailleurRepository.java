package com.example.springnfc.repository;

import com.example.springnfc.entity.InterventionProviderTravailleur;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;


@RepositoryRestResource
public interface InterventionProviderTravailleurRepository extends JpaRepository<InterventionProviderTravailleur, Integer> {
}