package com.example.demo.Repository;

import com.example.demo.Model.Post;
import com.example.demo.Model.User;
import com.example.demo.Model.Vote;
import org.springframework.data.jpa.repository.JpaRepository;

public interface VoteRepository  extends JpaRepository<Vote, Integer> {
    Vote findByUserAndPosts(User user, Post post);

    Vote findByPosts(Post post);
}
