package com.example.demo.Service;

import java.util.List;
import java.util.stream.Collectors;

import com.example.demo.Model.*;
import com.example.demo.Repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;
import twitter4j.DirectMessage;
import twitter4j.Query;
import twitter4j.QueryResult;
import twitter4j.StallWarning;
import twitter4j.Status;
import twitter4j.StatusDeletionNotice;
import twitter4j.StatusListener;
import twitter4j.Twitter;
import twitter4j.TwitterException;
import twitter4j.TwitterFactory;
import twitter4j.TwitterStream;
import twitter4j.TwitterStreamFactory;
import twitter4j.conf.ConfigurationBuilder;

import javax.transaction.Transactional;

@Service
@Transactional
public class PostService {
    @Autowired
    PostRepository repo;

    @Autowired
    ImagePostRepository repo5;
    @Autowired
    CommentRepository repo1;

    @Autowired
    UserRepository repo2;

    @Autowired
    VoteRepository repo3;
//    public static Twitter getTwitterinstance() {
//        Twitter twitter = TwitterFactory.getSingleton();
//        return twitter;
//    }

    public void save(Post theBlog) throws TwitterException {
//        Twitter twitter = getTwitterinstance();
//        Status status = twitter.updateStatus(theBlog.getContent());
//        System.out.println("after twitter");
        repo.save(theBlog);
    }



    public  List<Post> sortByUpdate(){ return repo.findAllByOrderByUpdatedAtAsc();

    }

    public List<Post> search(String keyword) {
        System.out.println("service:"+repo.search(keyword).size());
        return repo.findAllByTitleContainsOrContentContains(keyword, keyword);
    }
    public List<Post> listAll() {
//    User obj=new User("rajat","ygrygf.com","abc","admin");
//    User obj5=new User("user","ygrygf.com","user","user");
//
//    repo2.save(obj);
//    repo2.save(obj5);
        return repo.findAll();

    }
    public Page<Post> findPage(Pageable pageable){

        return repo.findAll(pageable);
    }
    public List<Post> latestPost(){
        return repo.findAllByOrderByCreatedAtDesc();
    }

    public Post get(int id) {
        return repo.findById(id).get();
    }

    public String findUser() {
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String username="";
        username=((UserDetails)principal).getUsername();
        return username;
    }

    public void savePost(Post post, User user, Category category) {
        Post newPost=new Post();
        newPost.setTitle(post.getTitle());
        newPost.setContent(post.getContent());
        newPost.setUser(user);
        newPost.setCategory(category);
        newPost.setLink(post.getLink());
        newPost.setImageId(post.getImageId());
        newPost.setCreatedAt(post.getCreatedAt());
        newPost.setUpdatedAt(post.getUpdatedAt());
        newPost.setLink(post.getLink());
//        twitter.timelineOperations().updateStatus("Spring Social is awesome!");
        System.out.println("after twitter");
        repo.save(newPost);
    }

    public List<Post> searchAll(String search) {
        return repo.findAllByTitleContainsOrContentContains(search,search);
    }

    public List<Post> findByCategory(Category category) {
       return repo.findAllByCategory(category);
    }

    public List<Post> findByUser(User user) {
        return  repo.findAllByUser(user);
    }

    public void delete(int id) {
        Post post=repo.getOne(id);
        ImagePost image= post.getImagePost();
        repo5.delete(image);
        List<Comment> commentList=repo1.findAll();
        List<Vote> votes=repo3.findAll();
        for (Vote vot: votes){
            if (vot.getPosts().getId()==id){
                repo3.delete(vot);
            }
        }
        for (Comment cmnt: commentList){
            if (cmnt.getPosts().getId()==id){
                repo1.delete(cmnt);
            }
        }
        repo.delete(post);
    }
//    List <Post> search( String name){
//        return repo.findAllByTitleOrContent(name);
//    }



}
