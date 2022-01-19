package com.sankdev.fluffybest.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "region")
@Setter
@Getter
public class Region {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    int id;

    @Column(name = "name")
    private String name;

    @ManyToOne
    @JoinColumn(name = "type_id")
    private RegionType type;

    @JsonIgnore
    @OneToMany(mappedBy = "region")
    private List<Locality> localities;

    @JsonIgnore
    @OneToMany(mappedBy = "region")
    private List<Address> addresses;

}
