package com.sankdev.fluffybest.repository;

import com.sankdev.fluffybest.entity.Animal;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.UUID;

//@RepositoryRestResource(exported = false)
public interface AnimalRepository extends JpaRepository<Animal, UUID> {

    List<Animal> findAllByType_Id(int theTypeId);
}
