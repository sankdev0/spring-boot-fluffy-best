package com.sankdev.fluffybest.service;

import com.sankdev.fluffybest.entity.Animal;
import com.sankdev.fluffybest.entity.AnimalType;
import java.util.List;

public interface AnimalTypeService {

  List<AnimalType> findAnimalTypes();

  List<Animal> getAllAnimalsForAnimalType(int theId);
}
