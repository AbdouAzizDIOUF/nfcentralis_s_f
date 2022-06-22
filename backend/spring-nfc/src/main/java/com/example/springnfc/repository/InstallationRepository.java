package com.example.springnfc.repository;

import com.example.springnfc.entity.Installation;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

@RepositoryRestResource
public interface InstallationRepository extends JpaRepository<Installation, Long> {
}