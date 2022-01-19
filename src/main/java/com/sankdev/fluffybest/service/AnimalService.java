package com.sankdev.fluffybest.service;

import com.sankdev.fluffybest.entity.Animal;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

public interface AnimalService {

    List<Animal> getAll();

    Optional<Animal> getById(UUID uuid);

    List<Animal> getByType(int theTypeId);
}
