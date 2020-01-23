package com.example.demo.Repository;


import com.example.demo.Model.Post;
import com.example.demo.Model.Vote;
import com.example.demo.Model.VoteByPostId;
import org.springframework.data.jpa.repository.JpaRepository;

public interface VoteByPostIdRepository extends JpaRepository<VoteByPostId, Integer> {
    VoteByPostId findByPosts(Post post);
}
