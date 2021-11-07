package com.sankdev.fluffybest.entity.location;

import com.sankdev.fluffybest.entity.BaseEntity;
import com.sankdev.fluffybest.entity.Language;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import lombok.Data;

@Entity
@Table(name = "country_translations")
@Data
public class CountryTranslation extends BaseEntity {

  @Column(name = "short_name_translation")
  private String shortNameTranslation;

  @Column(name = "name_translation")
  private String nameTranslation;

  @OneToOne
  @JoinColumn(name = "language_id")
  private Language language;

  @ManyToOne
  @JoinColumn(name = "country_id", nullable = false)
  private Country country;

}
