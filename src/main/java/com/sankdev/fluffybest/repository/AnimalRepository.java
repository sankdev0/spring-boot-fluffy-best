package com.sankdev.fluffybest.repository;

import com.sankdev.fluffybest.entity.Animal;
import java.util.List;
import java.util.UUID;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

//@RepositoryRestResource(exported = false)
public interface AnimalRepository extends JpaRepository<Animal, UUID> {

  List<Animal> findAllByType_Id(int theTypeId);
}
