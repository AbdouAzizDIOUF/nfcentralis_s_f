package com.example.springnfc.entity;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Collection;
import java.util.Date;


@Entity
@NoArgsConstructor
@AllArgsConstructor
@Data
@ToString
public class Installation implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String title;
    @Lob
    private String description;
    private String adress;
    private String city;
    private String zipcode;
    private String image;

    private Date createdAt = new Date();
    private Date updatedAt;

    @ManyToOne
    @JoinColumn(nullable = false)
    private Client client;

    @ManyToOne
    @JoinColumn(nullable = false)
    private Utilisateur utilisateur;

    @OneToMany(mappedBy="installation")
    private Collection<InterventionProvider> interventionList;

    @OneToMany(mappedBy="installation")
    private Collection<Intervention> interventions;
}
