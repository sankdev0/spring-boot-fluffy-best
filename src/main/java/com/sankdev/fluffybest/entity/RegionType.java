package com.sankdev.fluffybest.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import java.util.List;
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

@Entity
@Table(name = "region_type")
@Getter
@Setter
public class RegionType {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  int id;

  @Column(name = "name")
  private String name;

  @JsonIgnore
  @OneToMany(mappedBy = "type", cascade = CascadeType.ALL)
  private List<Region> regions;

}
