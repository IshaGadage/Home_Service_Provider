package com.example.demo.dao;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.example.demo.bean.booking_list;

@Repository
public interface booking_list_dao extends CrudRepository<booking_list, Integer> {

}
