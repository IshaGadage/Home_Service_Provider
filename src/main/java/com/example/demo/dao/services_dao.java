package com.example.demo.dao;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.example.demo.bean.services;

@Repository
public interface services_dao extends CrudRepository<services, Integer> {

}
