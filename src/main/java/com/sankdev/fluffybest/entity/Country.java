package com.sankdev.fluffybest.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import java.util.List;
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
@Table(name = "country")
@Getter
@Setter
public class Country {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Long id;

  @Column(name = "alpha_two_code")
  private String alphaTwoCode;

  @Column(name = "short_name")
  private String shortName;

  @Column(name = "name")
  private String name;

  @JsonIgnore
  @OneToMany(mappedBy = "country")
  private List<Address> addresses;

}
