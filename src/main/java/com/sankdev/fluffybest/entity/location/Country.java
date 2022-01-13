package com.sankdev.fluffybest.entity.location;

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

@Entity
@Table(name = "country")
@Getter
@Setter
public class Country {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Long id;

  @Column(name = "name")
  private String name;

  @Column(name = "alpha_two_code")
  private String alphaTwoCode;

  @Column(name = "short_name")
  private String shortName;

  @OneToMany(cascade = CascadeType.ALL, mappedBy = "country")
  private Set<CountryTranslation> translations;
}
