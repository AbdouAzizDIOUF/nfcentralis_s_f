package com.example.springnfc.repository;

import com.example.springnfc.entity.Intervention;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

@RepositoryRestResource
public interface InterventionRepository extends JpaRepository<Intervention, Long> {
}