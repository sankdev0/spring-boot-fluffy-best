package com.sankdev.fluffybest.service;

import com.sankdev.fluffybest.entity.Animal;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

public interface AnimalService {

  List<Animal> getAllAnimals();

  Optional<Animal> getAnimalById(UUID uuid);

  List<Animal> getAnimalsByType(int theTypeId);
}
