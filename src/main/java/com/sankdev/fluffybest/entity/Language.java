package com.sankdev.fluffybest.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import lombok.Data;

@Entity
@Table(name = "language")
@Data
public class Language {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Long id;

  @Column(name = "name")
  private String name;

  @Column(name = "alpha_two_code")
  private String alphaTwoCode;

  @Column(name = "native_name")
  private String nativeName;

  @Column(name = "date_format")
  private String dateFormat;

  @Column(name = "currency")
  private String currency;

}
