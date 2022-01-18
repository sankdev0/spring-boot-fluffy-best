package com.sankdev.fluffybest.service;

import com.sankdev.fluffybest.entity.AnimalType;
import com.sankdev.fluffybest.repository.AnimalTypeRepository;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@AllArgsConstructor
@Transactional(readOnly = true)
public class AnimalTypeServiceImpl implements AnimalTypeService {

    private final AnimalTypeRepository animalTypeRepository;

    @Override
    public List<AnimalType> getAll() {
        return animalTypeRepository.findAll();
    }

}
