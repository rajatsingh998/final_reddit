package com.example.demo.Repository;

import com.example.demo.Model.Category;

import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface CategoryRepository  extends JpaRepository<Category, Integer> {
    Category findBySubReddit(String name);

    List<Category> findAllBySubRedditContains(String term);
}
