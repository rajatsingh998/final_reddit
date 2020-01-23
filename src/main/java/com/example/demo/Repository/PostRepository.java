package com.example.demo.Repository;

import com.example.demo.Model.Category;
import com.example.demo.Model.Post;

import com.example.demo.Model.User;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface PostRepository extends JpaRepository<Post, Integer> {
    List<Post> findAllBy(Pageable pageable);

    @Query(value = "SELECT c FROM Post c WHERE c.title LIKE '%' || :keyword || '%'"
            + " OR c.content LIKE '%' || :keyword || '%'")
    List<Post> search(String keyword);
    List<Post> findAllByOrderByCreatedAtDesc();
    List<Post> findAllByOrderByUpdatedAtAsc();
    List<Post> findAllByTitleContainsOrContentContains(String search, String search1);
    List<Post> findAllByCategory(Category cat);
    List<Post> findAllByUser(User user);
}
