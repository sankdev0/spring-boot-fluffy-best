package com.sankdev.fluffybest.dao.location;

import com.sankdev.fluffybest.entity.location.Country;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CountryRepository extends JpaRepository<Country, Long> {

}
