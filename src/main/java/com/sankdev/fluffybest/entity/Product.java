package com.sankdev.fluffybest.entity;

import java.math.BigDecimal;
import java.time.LocalDate;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import lombok.Data;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

@Entity
@Table(name = "product")
@Data
public class Product extends NamedEntity {

  @Column(name = "sku")
  private String sku;

  @Column(name = "description")
  private String description;

  @Column(name = "unit_price")
  private BigDecimal unitPrice;

  @Column(name = "image_url")
  private String imageUrl;

  @Column(name = "active")
  private boolean active;

  @Column(name = "units_in_stock")
  private int unitsInStock;

  @Column(name = "date_created")
  @CreationTimestamp
  private LocalDate dateCreated;

  @Column(name = "last_updated")
  @UpdateTimestamp
  private LocalDate lastUpdated;

  @ManyToOne
  @JoinColumn(name = "category_id", nullable = false)
  private ProductCategory category;
}
