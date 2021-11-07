package com.sankdev.fluffybest.entity;

import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name = "product_category")
//@Data -- known bug in Lombok
@Getter
@Setter
public class ProductCategory extends NamedEntity {

  @OneToMany(cascade = CascadeType.ALL, mappedBy = "category")
  private Set<Product> products;

}
