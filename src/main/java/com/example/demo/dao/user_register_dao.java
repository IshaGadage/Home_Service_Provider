package com.example.demo.dao;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.example.demo.bean.user_register;

@Repository
public interface user_register_dao extends CrudRepository<user_register, Integer> {

}
