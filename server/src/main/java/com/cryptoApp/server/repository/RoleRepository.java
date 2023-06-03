package com.cryptoApp.server.repository;

import java.util.Optional;

import org.springframework.data.mongodb.repository.MongoRepository;

import com.cryptoApp.server.models.ERole;
import com.cryptoApp.server.models.Role;

public interface RoleRepository extends MongoRepository<Role, String> {
  Optional<Role> findByName(ERole name);
}
