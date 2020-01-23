package com.example.demo.Model;

import javax.persistence.*;
import java.util.List;

@Entity
public class Category {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private int subRedditId;
    private String subReddit;

    public Category() {
    }

    @OneToMany(fetch = FetchType.LAZY,
            cascade = {
                    CascadeType.PERSIST,
                    CascadeType.MERGE
            },mappedBy = "category")
    private List<Post> posts;

    public Category(String subReddit) {
        this.subReddit = subReddit;
    }

    public int getSubRedditId() {
        return subRedditId;
    }

    public void setSubRedditId(int subRedditId) {
        this.subRedditId = subRedditId;
    }

    public String getSubReddit() {
        return subReddit;
    }

    public void setSubReddit(String subReddit) {
        this.subReddit = subReddit;
    }
}
