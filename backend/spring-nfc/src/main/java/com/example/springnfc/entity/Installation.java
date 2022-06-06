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
public class Installation implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String adresse;
    @ManyToOne
    private Client client;

    @OneToMany(mappedBy="installation")
    private Collection<Intervention> interventions;
}
