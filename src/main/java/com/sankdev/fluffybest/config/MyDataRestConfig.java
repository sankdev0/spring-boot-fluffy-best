package com.sankdev.fluffybest.config;

import com.sankdev.fluffybest.entity.Language;
import com.sankdev.fluffybest.entity.Product;
import com.sankdev.fluffybest.entity.ProductCategory;
import com.sankdev.fluffybest.entity.location.Country;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.rest.core.config.RepositoryRestConfiguration;
import org.springframework.data.rest.webmvc.config.RepositoryRestConfigurer;
import org.springframework.http.HttpMethod;
import org.springframework.web.servlet.config.annotation.CorsRegistry;

@Configuration
public class MyDataRestConfig implements RepositoryRestConfigurer {


  @Override
  public void configureRepositoryRestConfiguration(RepositoryRestConfiguration config,
      CorsRegistry cors) {

    HttpMethod[] theUnsupportedActions = {HttpMethod.PUT, HttpMethod.POST, HttpMethod.DELETE};

    // Disable HTTP methods for Product: PUT, POST and DELETE.
    config.getExposureConfiguration()
        .forDomainType(Product.class)
        .withItemExposure((metdata, httpMethods) -> httpMethods.disable(theUnsupportedActions))
        .withCollectionExposure(
            ((metdata, httpMethods) -> httpMethods.disable(theUnsupportedActions)));

    // Disable HTTP methods for ProductCategory: PUT, POST and DELETE.
    config.getExposureConfiguration()
        .forDomainType(ProductCategory.class)
        .withItemExposure((metdata, httpMethods) -> httpMethods.disable(theUnsupportedActions))
        .withCollectionExposure(
            ((metdata, httpMethods) -> httpMethods.disable(theUnsupportedActions)));

    // Disable HTTP methods for Language: PUT, POST and DELETE.
    config.getExposureConfiguration()
        .forDomainType(Language.class)
        .withItemExposure((metdata, httpMethods) -> httpMethods.disable(theUnsupportedActions))
        .withCollectionExposure(
            ((metdata, httpMethods) -> httpMethods.disable(theUnsupportedActions)));

    // Disable HTTP methods for Country: PUT, POST and DELETE.
    config.getExposureConfiguration()
        .forDomainType(Country.class)
        .withItemExposure((metdata, httpMethods) -> httpMethods.disable(theUnsupportedActions))
        .withCollectionExposure(
            ((metdata, httpMethods) -> httpMethods.disable(theUnsupportedActions)));

  }
}
