package com.example.demo.Service;

import com.example.demo.Model.Post;
import com.example.demo.Model.User;
import com.example.demo.Model.Vote;
import com.example.demo.Model.VoteByPostId;
import com.example.demo.Repository.PostRepository;
import com.example.demo.Repository.UserRepository;
import com.example.demo.Repository.VoteByPostIdRepository;
import com.example.demo.Repository.VoteRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.ArrayList;
import java.util.List;

@Service
@Transactional
public class VoteService {
    @Autowired
    VoteRepository repo;
    @Autowired
    VoteByPostIdRepository repo6;

    @Autowired
    UserRepository repo2;
    @Autowired
    PostRepository repo5;
    public Post saveMyVote(int val,int userId, int postId) {
        Post post=repo5.getOne(postId);
        User redditUser =repo2.getOne(userId);
        int totlevote=post.getTotlevote();
        Vote votee = repo.findByUserAndPosts(redditUser,post);
        if (votee != null) {
            if(votee.getValue() == val){
                post.setTotlevote(totlevote-val);
                int x=totlevote-val;
                votee.setValue(0);
            }
            else if(votee.getValue()==0){
                post.setTotlevote(totlevote+val);
                votee.setValue(val);
            }
            else{
                if(val==-1){
                    post.setTotlevote(totlevote-2);
                    votee.setValue(-1);
                }
                else{
                    post.setTotlevote(totlevote+2);
                    votee.setValue(1);
                }
            }
            repo5.save(post);
            repo.save(votee);
        }
        else{
            Vote vote = new Vote();
            post.setTotlevote(totlevote+val);
            vote.setPosts(post);
            vote.setUser(redditUser);
            vote.setValue(val);
            repo5.save(post);
            repo.save(vote);
        }
        return post;
    }

    public int findUser() {
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String username="";
        username=((UserDetails)principal).getUsername();
        ArrayList<User> list= (ArrayList<User>) repo2.findAll();

        int id=5;

        for (int i=0;i<list.size();i++) {
            String name=list.get(i).getName();
            if (name.equals(username)){
                System.out.println(username);
                id=list.get(i).getId();
                break;
            }
        }
        return id;
    }

    public List<Vote> listAll() {
        return repo.findAll();
    }
}
