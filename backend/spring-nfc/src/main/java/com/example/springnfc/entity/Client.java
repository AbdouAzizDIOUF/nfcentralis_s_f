package com.example.springnfc.entity;

import lombok.*;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Collection;


@Entity
@NoArgsConstructor
@AllArgsConstructor
@Data
@ToString
public class Client implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String name;
    @Lob
    private String description;

    @OneToMany(mappedBy="client")
    private Collection<Installation> installations;

}
