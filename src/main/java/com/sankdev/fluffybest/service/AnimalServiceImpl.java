package com.sankdev.fluffybest.service;

import com.sankdev.fluffybest.entity.Animal;
import com.sankdev.fluffybest.repository.AnimalRepository;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Service
@AllArgsConstructor
@Transactional(readOnly = true)
public class AnimalServiceImpl implements AnimalService {

    private final AnimalRepository animalRepository;

    @Override
    public List<Animal> getAll() {
        return animalRepository.findAll();
    }

    @Override
    public Optional<Animal> getById(UUID uuid) {
        return animalRepository.findById(uuid);
    }

    @Override
    public List<Animal> getByType(int theTypeId) {
        return animalRepository.findAllByType_Id(theTypeId);
    }

}
