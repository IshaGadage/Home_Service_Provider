package com.example.demo.dao;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.example.demo.bean.contact;

@Repository
public interface contactdao extends CrudRepository<contact, Integer> {

}
