package com.sankdev.fluffybest.entity;

import lombok.Data;

import javax.persistence.*;

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
