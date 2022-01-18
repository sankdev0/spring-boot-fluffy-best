package com.sankdev.fluffybest.repository;

import com.sankdev.fluffybest.entity.Address;
import java.util.UUID;
import org.springframework.data.jpa.repository.JpaRepository;

public interface AddressRepository extends JpaRepository<Address, UUID> {

}
