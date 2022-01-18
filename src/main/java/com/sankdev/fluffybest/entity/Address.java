package com.sankdev.fluffybest.entity;

import java.util.List;
import java.util.UUID;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name = "address")
@Getter
@Setter
public class Address {

  @Id
  @GeneratedValue(generator = "uuid2")
  @GenericGenerator(name = "uuid2", strategy = "uuid2")
  @Column(columnDefinition = "BINARY(16)")
  private UUID id;

  @Column(name = "post_office_box_number")
  private String postOfficeBoxNumber;

  @Column(name = "postal_code")
  private String postalCode;

  @Column(name = "street")
  private String street;

  @Column(name = "building")
  private String building;

  @Column(name = "apartment")
  private String apartment;

  @ManyToOne
  @JoinColumn(name = "address_type_id")
  private AddressType type;

  @ManyToOne
  @JoinColumn(name = "country_id")
  private Country country;

  @ManyToOne
  @JoinColumn(name = "locality_id")
  private Locality locality;

  @ManyToOne
  @JoinColumn(name = "region_id")
  private Region region;

  @ManyToMany
  @JoinTable(
      name = "animal_address",
      joinColumns = @JoinColumn(name = "address_id"),
      inverseJoinColumns = @JoinColumn(name = "animal_id")
  )
  private List<Animal> animals;

}
