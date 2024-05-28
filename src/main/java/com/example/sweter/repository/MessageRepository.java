package com.example.sweter.repository;

import com.example.sweter.model.Message;
import org.springframework.data.repository.CrudRepository;

import java.util.List;
import org.springframework.stereotype.Repository;

@Repository
public interface MessageRepository extends CrudRepository<Message,Long> {
    List<Message> findByTag(String tag);
}
