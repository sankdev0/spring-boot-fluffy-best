package com.sankdev.fluffybest.rest;

import com.sankdev.fluffybest.entity.Animal;
import com.sankdev.fluffybest.service.AnimalService;
import java.util.List;
import java.util.UUID;
import lombok.AllArgsConstructor;
import org.springframework.hateoas.CollectionModel;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/fluffy")
@AllArgsConstructor
public class AnimalRestController {

  private final AnimalService animalService;

  @GetMapping("/animals")
  public List<Animal> findAnimals() {
    return animalService.findAnimals();
  }

  @GetMapping("/animals/{animalId}")
  public Animal getAnimalById(@PathVariable String animalId) {
    return animalService.findAnimalById(UUID.fromString(animalId)).orElseThrow();
  }

}
