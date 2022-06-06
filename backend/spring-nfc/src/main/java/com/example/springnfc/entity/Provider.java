package com.example.springnfc.entity;

import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;

@Entity
@DiscriminatorValue("Provider")
public class Provider extends Company{

}
