package com.example.demo.Model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.Type;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

@Entity
public class Comment {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    private int id;
    private String Content;
    private int parentId;

    private String path;
    private int depth;

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public int getDepth() {
        return depth;
    }

    public void setDepth(int depth) {
        this.depth = depth;
    }

    public int getParentId() {
        return parentId;
    }

    public void setParentId(int parentId) {
        this.parentId = parentId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Timestamp getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }



    @Column(name = "createdat", updatable = false)
    @CreationTimestamp
    private Timestamp createdAt;



    public String getContent() {
        return Content;
    }

    public void setContent(String content) {
        Content = content;
    }
    @JsonIgnore
    @ManyToOne(fetch = FetchType.LAZY,
            cascade = {
                    CascadeType.MERGE, CascadeType.DETACH
            })
    @JoinColumn
    private Post posts;

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    @ManyToOne(fetch = FetchType.LAZY,
            cascade = {

                    CascadeType.MERGE
            })
    @JoinColumn
    private User user;

    @OneToMany(fetch = FetchType.LAZY,
            cascade = {
                    CascadeType.MERGE
            },mappedBy = "posts")
    private List<Vote> votes;

    public Post getPosts() {
        return posts;
    }

    public void setPosts(Post posts) {
        this.posts = posts;
    }




}
