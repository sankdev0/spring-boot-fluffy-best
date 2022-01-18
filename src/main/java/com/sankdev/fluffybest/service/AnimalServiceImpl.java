package com.sankdev.fluffybest.service;

import com.sankdev.fluffybest.entity.Animal;
import com.sankdev.fluffybest.repository.AnimalRepository;
import java.util.List;
import java.util.Optional;
import java.util.UUID;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@AllArgsConstructor
@Transactional(readOnly = true)
public class AnimalServiceImpl implements AnimalService {

  private final AnimalRepository animalRepository;

  @Override
  public List<Animal> getAllAnimals() {
    return animalRepository.findAll();
  }

  @Override
  public Optional<Animal> findAnimalById(UUID uuid) {
    return animalRepository.findById(uuid);
  }

  @Override
  public List<Animal> findAnimalsByType(int theTypeId) {
    return animalRepository.findAllByType_Id(theTypeId);
  }
}
