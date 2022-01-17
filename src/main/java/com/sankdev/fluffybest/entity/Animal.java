package com.sankdev.fluffybest.entity;

import java.time.LocalDate;
import java.util.UUID;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.GenericGenerator;
import org.springframework.hateoas.RepresentationModel;

@Entity
@Table(name = "animal")
@Setter
@Getter
public class Animal extends RepresentationModel<Animal> {

  @Id
  @GeneratedValue(generator = "uuid2")
  @GenericGenerator(name = "uuid2", strategy = "uuid2")
  @Column(columnDefinition = "BINARY(16)")
  private UUID id;

  @Column(name = "name")
  private String name;

  @Column(name = "birth_date")
  private LocalDate birthDate;

  @Column(name = "description")
  private String description;

  @ManyToOne
  @JoinColumn(name = "type_id")
  private AnimalType type;

}
