package com.sankdev.fluffybest.repository;

import com.sankdev.fluffybest.entity.Language;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.web.bind.annotation.CrossOrigin;

@CrossOrigin("http://localhost:4200")
public interface LanguageRepository extends JpaRepository<Language, Long> {

}
