package com.sankdev.fluffybest.repository;

import com.sankdev.fluffybest.entity.Product;
import java.util.UUID;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestParam;

@CrossOrigin("http://localhost:4200") // accept calls from web browser scripts from this origin
public interface ProductRepository extends JpaRepository<Product, UUID> {

  // It is a query method. Behind the scenes Spring Data will execute a query similar to this:
  // SELECT * FROM product WHERE category_id=?
  // Spring Data Rest will automatically expose endpoint:
  // http://localhost:8080/api/products/search/findByCategoryId?id=2
  Page<Product> findByCategoryId(@RequestParam("id") Long id, Pageable pageable);

  // Example search string http://localhost:8080/api/products/search/findByNameContaining?name=Python
  Page<Product> findByNameContaining(@RequestParam("name") String name, Pageable pageable);

}
