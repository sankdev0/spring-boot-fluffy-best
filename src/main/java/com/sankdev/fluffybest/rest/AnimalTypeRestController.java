package com.sankdev.fluffybest.rest;

import static org.springframework.hateoas.server.mvc.WebMvcLinkBuilder.linkTo;
import static org.springframework.hateoas.server.mvc.WebMvcLinkBuilder.methodOn;

import com.sankdev.fluffybest.entity.Animal;
import com.sankdev.fluffybest.entity.AnimalType;
import com.sankdev.fluffybest.service.AnimalService;
import com.sankdev.fluffybest.service.AnimalTypeService;
import java.util.List;
import java.util.UUID;
import lombok.AllArgsConstructor;
import org.springframework.hateoas.CollectionModel;
import org.springframework.hateoas.Link;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/fluffy")
@AllArgsConstructor
public class AnimalTypeRestController {

  private final AnimalTypeService animalTypeService;
  private final AnimalService animalService;

  @GetMapping("/animal-types")
  public List<AnimalType> getAnimalTypes() {
    return animalTypeService.findAnimalTypes();
  }

  @GetMapping(value = "/animal-types/{animalTypeId}/animals", produces = { "application/hal+json" })
  public CollectionModel<Animal> getAnimalsForAnimalType(@PathVariable final String animalTypeId) {
    int theId = Integer.parseInt(animalTypeId);
    List<Animal> animals = animalService.findAnimalsByType(theId);

    for (final Animal tempAnimal : animals) {
      Link selfLink = linkTo(methodOn(AnimalRestController.class)
          .getAnimalById(tempAnimal.getId().toString())).withSelfRel();
      tempAnimal.add(selfLink);
    }

    Link link = linkTo(methodOn(AnimalTypeRestController.class)
        .getAnimalsForAnimalType(animalTypeId)).withSelfRel();
    CollectionModel<Animal> result = CollectionModel.of(animals, link);
    return result;
  }

}
