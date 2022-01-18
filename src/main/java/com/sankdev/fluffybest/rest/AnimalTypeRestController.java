package com.sankdev.fluffybest.rest;

import com.sankdev.fluffybest.entity.Animal;
import com.sankdev.fluffybest.entity.AnimalType;
import com.sankdev.fluffybest.service.AnimalService;
import com.sankdev.fluffybest.service.AnimalTypeService;
import lombok.AllArgsConstructor;
import org.springframework.hateoas.CollectionModel;
import org.springframework.hateoas.Link;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

import static org.springframework.hateoas.server.mvc.WebMvcLinkBuilder.linkTo;
import static org.springframework.hateoas.server.mvc.WebMvcLinkBuilder.methodOn;

@RestController
@RequestMapping("custom-api/animal-types")
@AllArgsConstructor
public class AnimalTypeRestController {

    private final AnimalTypeService animalTypeService;
    private final AnimalService animalService;

    @GetMapping
    public List<AnimalType> getAnimalTypes() {
        return animalTypeService.getAll();
    }

    @GetMapping(value = "/{animalTypeId}/animals", produces = {"application/hal+json"})
    public CollectionModel<Animal> getAnimalsForAnimalType(@PathVariable final String animalTypeId) {
        int theId = Integer.parseInt(animalTypeId);
        List<Animal> animals = animalService.getByType(theId);

        animals.forEach(animal -> {
            Link selfLink = linkTo(methodOn(AnimalRestController.class)
                    .getAnimalById(animal.getId().toString())).withSelfRel();
            animal.add(selfLink);
        });

        Link link = linkTo(methodOn(AnimalTypeRestController.class)
                .getAnimalsForAnimalType(animalTypeId)).withSelfRel();
        return CollectionModel.of(animals, link);
    }

}
