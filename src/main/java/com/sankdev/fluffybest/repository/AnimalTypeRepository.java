package com.sankdev.fluffybest.repository;

import com.sankdev.fluffybest.entity.AnimalType;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

@RepositoryRestResource(exported = false)
public interface AnimalTypeRepository extends JpaRepository<AnimalType, Integer> {

}
