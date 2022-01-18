package com.sankdev.fluffybest.rest;

import com.sankdev.fluffybest.entity.Animal;
import com.sankdev.fluffybest.service.AnimalService;
import lombok.AllArgsConstructor;
import org.springframework.hateoas.CollectionModel;
import org.springframework.hateoas.Link;
import org.springframework.hateoas.config.EnableHypermediaSupport;
import org.springframework.hateoas.config.EnableHypermediaSupport.HypermediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.UUID;

import static org.springframework.hateoas.server.mvc.WebMvcLinkBuilder.linkTo;

@RestController
@AllArgsConstructor
@RequestMapping("custom-api/animals")
@EnableHypermediaSupport(type = HypermediaType.HAL)
public class AnimalRestController {

    private final AnimalService animalService;

    @GetMapping(produces = "application/hal+json")
    public CollectionModel<Animal> getAllAnimals() {

        List<Animal> animals = animalService.getAll();
        animals.forEach(animal -> {
            String animalId = animal.getId().toString();
            Link selfLink = linkTo(AnimalRestController.class).slash(animalId).withSelfRel();
            animal.add(selfLink);
        });

        Link link = linkTo(AnimalRestController.class).withSelfRel();
        return CollectionModel.of(animals, link);
    }

    @GetMapping("/{animalId}")
    public Animal getAnimalById(@PathVariable String animalId) {
        return animalService.getById(UUID.fromString(animalId)).orElseThrow();
    }

}
