package com.sankdev.fluffybest.service;

import com.sankdev.fluffybest.entity.Animal;
import com.sankdev.fluffybest.entity.AnimalType;
import com.sankdev.fluffybest.repository.AnimalTypeRepository;
import java.util.List;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@AllArgsConstructor
public class AnimalTypeServiceImpl implements AnimalTypeService{

  private final AnimalTypeRepository animalTypeRepository;

  @Override
  @Transactional
  public List<AnimalType> findAnimalTypes() {
    return animalTypeRepository.findAll();
  }

  @Override
  public List<Animal> getAllAnimalsForAnimalType(int theId) {
    return null;
  }
}
