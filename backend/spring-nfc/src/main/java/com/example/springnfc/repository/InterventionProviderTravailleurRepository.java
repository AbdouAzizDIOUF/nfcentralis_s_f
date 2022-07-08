package com.example.springnfc.repository;

import com.example.springnfc.entity.InterventionProviderTravailleur;
import com.example.springnfc.projection.InterventionProviderTravailleurProjection;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;


@RepositoryRestResource(excerptProjection = InterventionProviderTravailleurProjection.class)
public interface InterventionProviderTravailleurRepository extends JpaRepository<InterventionProviderTravailleur, Integer> {
}