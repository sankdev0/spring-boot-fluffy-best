package com.sankdev.fluffybest.dto.mapper;

import com.sankdev.fluffybest.dto.model.AnimalDto;
import com.sankdev.fluffybest.entity.Animal;
import org.assertj.core.api.Assertions;
import org.junit.jupiter.api.Test;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.UUID;

class AnimalMapperUnitTest {

    @Test
    void shouldMapCarToDto() {
        String name = "Чаки";
        String description = "Чаки хороший мальчик";
        UUID uuid = UUID.randomUUID();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd.MM.yyyy");
        LocalDate localDate = LocalDate.now();
        String formattedLocalDate = formatter.format(localDate);

        //given
        Animal animal = new Animal();
        animal.setId(uuid);
        animal.setName(name);
        animal.setBirthDate(localDate);
        animal.setDescription(description);

        //when
        AnimalDto animalDto = AnimalMapper.INSTANCE.toDto(animal);

        //then
        Assertions.assertThat(animalDto).isNotNull();
        Assertions.assertThat(animalDto.getId()).isEqualTo(uuid.toString());
        Assertions.assertThat(animalDto.getName()).isEqualTo(name);
        Assertions.assertThat(animalDto.getDescription()).isEqualTo(description);
        Assertions.assertThat(animalDto.getBirthDate()).isEqualTo(formattedLocalDate);
    }
}
