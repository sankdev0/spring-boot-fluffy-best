package com.sankdev.fluffybest.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name = "locality")
@Setter
@Getter
public class Locality {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  Long id;

  @Column(name = "name")
  private String name;

  @ManyToOne
  @JoinColumn(name = "type_id")
  private LocalityType type;

  @ManyToOne
  @JoinColumn(name = "region_id")
  private Region region;

  @JsonIgnore
  @OneToMany(mappedBy = "locality")
  private List<Address> addresses;

}
