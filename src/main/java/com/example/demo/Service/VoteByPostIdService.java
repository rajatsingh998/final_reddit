package com.example.demo.Service;

import com.example.demo.Model.Post;
import com.example.demo.Model.VoteByPostId;
import com.example.demo.Repository.PostRepository;
import com.example.demo.Repository.VoteByPostIdRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;

@Service
@Transactional
public class VoteByPostIdService {
    @Autowired
    VoteByPostIdRepository repo;

    @Autowired
    PostRepository repo5;

    public void savePostVal(int postId) {
        Post post=repo5.getOne(postId);
        VoteByPostId voteByPostId= repo.findByPosts(post);
        if (voteByPostId!=null){
            return;
        }

        VoteByPostId voteVal= new VoteByPostId();
        voteVal.setPost(post);
        voteVal.setVal(0);
        repo.save(voteVal);
        return;
    }
}
