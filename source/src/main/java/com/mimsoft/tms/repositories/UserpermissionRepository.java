package com.mimsoft.tms.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.mimsoft.tms.entities.Userpermission;

@Repository
public interface UserpermissionRepository extends JpaRepository<Userpermission, Integer>{

}
