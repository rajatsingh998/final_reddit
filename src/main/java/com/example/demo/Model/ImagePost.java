package com.example.demo.Model;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;

@Entity
public class ImagePost {
    @Id
    @GeneratedValue(generator = "uuid")
    @GenericGenerator(name = "uuid", strategy = "uuid2")
    private String id;
    //    private String title;
    private String fileName;

    public ImagePost() {

    }

    public Post getPosts() {
        return posts;
    }

    public void setPosts(Post posts) {
        this.posts = posts;
    }

    private String fileType;
    @Lob
    private byte[] data;


    @OneToOne(fetch = FetchType.LAZY,
            cascade = CascadeType.ALL)
    @JoinColumn
    private Post posts;
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public String getFileType() {
        return fileType;
    }

    public void setFileType(String fileType) {
        this.fileType = fileType;
    }



    public byte[] getData() {
        return data;
    }

    public void setData(byte[] data) {
        this.data = data;
    }

    public ImagePost( String fileName, String fileType, byte[] data) {
        this.fileName = fileName;
        this.fileType = fileType;
        this.data = data;

    }
}
