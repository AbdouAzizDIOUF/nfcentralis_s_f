package com.example.springnfc.repository;

import com.example.springnfc.entity.Provider;
//import com.example.springnfc.projection.ProviderProjectionDesactive;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

@RepositoryRestResource
public interface ProviderRepository extends JpaRepository<Provider, Long> {
}