package com.sankdev.fluffybest.repository;

import com.sankdev.fluffybest.entity.Address;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.UUID;

public interface AddressRepository extends JpaRepository<Address, UUID> {

}
