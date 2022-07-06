package com.example.springnfc.repository;

import com.example.springnfc.entity.InterventionProvider;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

@RepositoryRestResource
public interface InterventionProviderRepository extends JpaRepository<InterventionProvider, Integer> {


}