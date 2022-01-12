package com.sankdev.fluffybest.repository.location;

import com.sankdev.fluffybest.entity.location.CountryTranslation;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

@RepositoryRestResource(collectionResourceRel = "countryTranslation", path = "country-translation")
public interface CountryTranslationRepository extends JpaRepository<CountryTranslation, Long> {

}
