package com.sankdev.fluffybest.config;

import com.sankdev.fluffybest.entity.Language;
import com.sankdev.fluffybest.entity.Product;
import com.sankdev.fluffybest.entity.ProductCategory;
import com.sankdev.fluffybest.entity.location.Country;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import javax.persistence.EntityManager;
import javax.persistence.metamodel.EntityType;
import lombok.AllArgsConstructor;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.rest.core.config.RepositoryRestConfiguration;
import org.springframework.data.rest.webmvc.config.RepositoryRestConfigurer;
import org.springframework.http.HttpMethod;
import org.springframework.web.servlet.config.annotation.CorsRegistry;

@Configuration
@AllArgsConstructor
public class MyDataRestConfig implements RepositoryRestConfigurer {

  private final EntityManager entityManager;

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

    // call an internal helper method
    exposeIds(config);
  }

  private void exposeIds(RepositoryRestConfiguration config) {

    // expose entity ids

    // - get a list of all entity classes from the entity manager
    Set<EntityType<?>> entities = entityManager.getMetamodel().getEntities();

    // - create an array of the entity types
    List<Class> entityClasses = new ArrayList<>();

    // - get the entity types for the entities
    for (EntityType tempEntityType : entities) {
      entityClasses.add(tempEntityType.getJavaType());
    }

    // - expose the entity ids for the array of entity/domain types
    Class[] domainTypes = entityClasses.toArray(new Class[0]);
    config.exposeIdsFor(domainTypes);

  }
}
