package com.example.springnfc.repository;

import com.example.springnfc.entity.Installation;
import com.example.springnfc.projection.InstallationProjection;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

@RepositoryRestResource(excerptProjection = InstallationProjection.class)
public interface InstallationRepository extends JpaRepository<Installation, Long> {
}