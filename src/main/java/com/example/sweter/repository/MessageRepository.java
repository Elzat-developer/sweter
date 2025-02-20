package com.example.sweter.repository;

import com.example.sweter.model.Message;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.CrudRepository;

import org.springframework.stereotype.Repository;

@Repository
public interface MessageRepository extends CrudRepository<Message,Long> {
    Page<Message> findAll(Pageable pageable);
    Page<Message> findByTag(String tag, Pageable pageable);
}
