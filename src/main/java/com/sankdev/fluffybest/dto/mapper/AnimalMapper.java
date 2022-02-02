package com.sankdev.fluffybest.dto.mapper;

import com.sankdev.fluffybest.dto.model.AnimalDto;
import com.sankdev.fluffybest.entity.Animal;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.factory.Mappers;

@Mapper
public interface AnimalMapper extends DefaultConversionMapper {

    AnimalMapper INSTANCE = Mappers.getMapper(AnimalMapper.class);

    @Mapping(target = "birthDate", source = "birthDate", dateFormat = "dd.MM.yyyy")
    AnimalDto toDto(Animal animal);

}
