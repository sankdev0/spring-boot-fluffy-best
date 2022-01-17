package com.sankdev.fluffybest.service;

import com.sankdev.fluffybest.entity.Animal;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

public interface AnimalService {

  List<Animal> findAnimals();

  Optional<Animal> findAnimalById(UUID uuid);

  List<Animal> findAnimalsByType(int theTypeId);
}
