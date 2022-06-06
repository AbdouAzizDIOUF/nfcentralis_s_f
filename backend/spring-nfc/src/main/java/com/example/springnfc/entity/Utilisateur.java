package com.example.springnfc.entity;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;
import javax.persistence.*;
import java.io.Serializable;
import java.util.Collection;


@Entity
@NoArgsConstructor
@AllArgsConstructor
@Data
@ToString
public class Utilisateur implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String firstName;
    private String lastName;

    @ManyToOne
    private Company company;

    @OneToMany(mappedBy="utilisateur")
    private Collection<Intervention> interventions;
}
