package com.example.springnfc.repository;

import com.example.springnfc.entity.Client;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

import javax.persistence.Entity;

@RepositoryRestResource
public interface ClientRepository extends JpaRepository<Client, Long> {

}