package com.sankdev.fluffybest.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import lombok.Getter;
import lombok.Setter;
import org.springframework.hateoas.RepresentationModel;

@Entity
@Table(name = "animal_type")
@Setter
@Getter
public class AnimalType extends RepresentationModel<AnimalType> {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  int id;

  @Column(name = "name")
  private String name;

  @Column(name = "breed")
  private String breed;

  @JsonIgnore
  @OneToMany(mappedBy = "type", cascade = CascadeType.ALL)
  private Set<Animal> animals;

}