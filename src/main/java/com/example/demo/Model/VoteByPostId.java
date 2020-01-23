package com.example.demo.Model;



import javax.persistence.*;

@Entity
public class VoteByPostId {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    private int id;
    private int val;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getVal() {
        return val;
    }

    public void setVal(int val) {
        this.val = val;
    }

    public Post getPost() {
        return posts;
    }

    public void setPost(Post post) {
        this.posts = post;
    }

    @OneToOne(fetch = FetchType.LAZY,
            cascade = {
                    CascadeType.PERSIST,
                    CascadeType.MERGE
            })
    @JoinColumn
    private Post posts;
}
