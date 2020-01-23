package com.example.demo.Model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.Type;
import org.hibernate.annotations.UpdateTimestamp;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

@Entity
public class Post {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    private int id;

    public Post(String title, String content) {
        this.title = title;
        this.content = content;
    }

    private  String imageId;
    private String link;

    public String getImageId() {
        return imageId;
    }

    public void setImageId(String imageId) {
        this.imageId = imageId;
    }

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }





    private String title;
    @Lob
    @Type(type = "org.hibernate.type.TextType")
    private String content;
    @Column(name = "createdat", updatable = false)
    @CreationTimestamp
    private Timestamp createdAt;

    public Post() {
    }

    @Column(name="updatedat")
    @UpdateTimestamp
    private Timestamp updatedAt;
    @OneToMany(fetch = FetchType.LAZY,
            cascade = {
                    CascadeType.MERGE
            },mappedBy = "posts")
    private List<Comment> comments;

    public List<Vote> getVotes() {
        return votes;
    }

    public void setVotes(List<Vote> votes) {
        this.votes = votes;
    }

    @OneToMany(fetch = FetchType.LAZY,
            cascade = {
                    CascadeType.PERSIST,
                    CascadeType.MERGE
            },mappedBy = "posts")
    private List<Vote> votes;

    public List<Comment> getComments() {
        return comments;
    }

    public void setComments(List<Comment> comments) {
        this.comments = comments;
    }

    @JsonIgnore
    @ManyToOne(fetch = FetchType.LAZY,
            cascade = {
                    CascadeType.PERSIST,
                    CascadeType.MERGE
            })
    @JoinColumn
    private User user;
    @OneToOne(fetch = FetchType.LAZY,
            cascade = CascadeType.ALL,mappedBy = "posts")
    private ImagePost imagePost;

    public ImagePost getImagePost() {
        return imagePost;
    }

    public void setImagePost(ImagePost imagePost) {
        this.imagePost = imagePost;
    }

    public int getTotlevote() {
        return totlevote;
    }

    public void setTotlevote(int totlevote) {
        this.totlevote = totlevote;
    }

    @OneToOne(fetch = FetchType.LAZY,
            cascade = {
                    CascadeType.PERSIST,
                    CascadeType.MERGE
            },mappedBy = "posts")
    private VoteByPostId voteValue;
    private int totlevote;
    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    @ManyToOne(fetch = FetchType.LAZY,
            cascade = {
                    CascadeType.PERSIST,
                    CascadeType.MERGE
            })
    @JoinColumn
    private Category category;

    public VoteByPostId getVoteValue() {
        return voteValue;
    }

    public void setVoteValue(VoteByPostId voteValue) {
        this.voteValue = voteValue;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }



    public Timestamp getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }

    public Timestamp getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(Timestamp updatedAt) {
        this.updatedAt = updatedAt;
    }




    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
}
