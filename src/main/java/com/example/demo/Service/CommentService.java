package com.example.demo.Service;

import com.example.demo.Model.Comment;
import com.example.demo.Model.Post;
import com.example.demo.Model.User;
import com.example.demo.Repository.CommentRepository;
import com.example.demo.Repository.PostRepository;

import com.example.demo.Repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.ArrayList;
import java.util.List;

@Service
@Transactional
public class CommentService {
    @Autowired
    UserRepository repo2;
    @Autowired
    CommentRepository repo;
    @Autowired
    PostRepository repo5;

    public void save(Comment comment) {
        repo.save(comment);
    }


    public void saveMyComment(Comment comment, User user ,int post_id, int parentId) {
        String path= new String();
        if (parentId!=0){
            Comment cmnt= repo.findById(parentId);
            System.out.println("texting ");
            path=cmnt.getPath();
            System.out.println("testing ok");
        }

        Post post=repo5.getOne(post_id);
        comment.setPath(path);
        comment.setParentId(parentId);
        comment.setUser(user);
        comment.setPosts(post);
        int id=repo.save(comment).getId();
        path=path+","+id;
        Comment newComment=repo.findById(id);
        newComment.setPath(path);
        repo.save(newComment);
        System.out.println("plz"+id);
    }
    public List<Comment> find(){
        return repo.findAll();
    }

    public String findUser() {
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String username="";
        username=((UserDetails)principal).getUsername();
        return username;
    }

    public Comment findById(int id) {
        return repo.findById(id);
    }
}
