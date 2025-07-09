package com.example.demo.dao;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.example.demo.bean.feedback;

@Repository
public interface feedback_dao extends CrudRepository<feedback, Integer> {

}
