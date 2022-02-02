package com.sankdev.fluffybest.dto.mapper;

import java.util.UUID;

public interface DefaultConversionMapper {

    default String map(UUID value) {
        if (value == null) {
            return null;
        } else {
            return value.toString();
        }
    }

}
