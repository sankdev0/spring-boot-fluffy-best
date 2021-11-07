package com.sankdev.fluffybest.entity.location;

import com.sankdev.fluffybest.entity.NamedEntity;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name = "country")
@Getter
@Setter
public class Country extends NamedEntity {

  @Column(name = "alpha_two_code")
  private String alphaTwoCode;

  @Column(name = "short_name")
  private String shortName;

  @OneToMany(cascade = CascadeType.ALL, mappedBy = "country")
  private Set<CountryTranslation> translations;
}
