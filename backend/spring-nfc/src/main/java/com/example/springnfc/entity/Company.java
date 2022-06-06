package com.example.springnfc.entity;


import javax.persistence.Entity;
import javax.persistence.*;
import java.io.Serializable;
import java.util.Collection;

@Entity
@Inheritance(strategy = InheritanceType.SINGLE_TABLE)
@DiscriminatorColumn(name="TYPE_COMPANY", discriminatorType=DiscriminatorType.STRING)
public class Company implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String name;
    private String adresse;
    @Lob
    private String description;

    @OneToMany(mappedBy="company")
    private Collection<Utilisateur> utilisateurs;
}
