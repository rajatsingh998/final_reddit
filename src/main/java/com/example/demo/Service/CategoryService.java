package com.example.demo.Service;

import com.example.demo.Model.Category;
import com.example.demo.Repository.CategoryRepository;
import com.example.demo.Repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

@Service
@Transactional
public class CategoryService {
    @Autowired
    CategoryRepository repo;

    public void save(Category category) {
        repo.save(category);
    }

    public void findCategory(Category category) {
        Category cat=repo.findBySubReddit(category.getSubReddit());
        if (cat==null){
            Category category1=new Category();
            category1.setSubReddit(category.getSubReddit());
            repo.save(category1);
        }
    }

    public Category findCategoryByName(String subReddit) {
        return repo.findBySubReddit(subReddit);
    }

    public List<Category> fetchName(String term) {
        return repo.findAllBySubRedditContains(term);
    }

    public List<Category> getAllCategory() {
        return  repo.findAll();
    }

    public List<Category> findAll() {
        return repo.findAll();
    }
}
