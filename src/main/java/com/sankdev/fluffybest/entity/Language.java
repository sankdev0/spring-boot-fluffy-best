package com.sankdev.fluffybest.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import lombok.Data;

@Entity
@Table(name = "language")
@Data
public class Language extends NamedEntity {

  @Column(name = "alpha_two_code")
  private String alphaTwoCode;

  @Column(name = "native_name")
  private String nativeName;

  @Column(name = "date_format")
  private String dateFormat;

  @Column(name = "currency")
  private String currency;

}
