package com.example.demo.Repository;

import com.example.demo.Model.ImagePost;
import com.example.demo.Model.Post;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ImagePostRepository  extends JpaRepository<ImagePost, String> {
    ImagePost findByPosts(Post post);


}
