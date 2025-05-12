package com.lumawig.socialmedia.model;

import jakarta.persistence.*;

@Entity
public class Post {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String username;
    private String content;
    private String password;

    public Post() {}

    public Post(Long id, String username, String content, String password) {
        this.id = id;
        this.username = username;
        this.content = content;
        this.password = password;
    }

    // Getters
    public Long getId() {
        return id;
    }

    private String imageUrl; // Add this

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public String getUsername() {
        return username;
    }

    public String getContent() {
        return content;
    }

    public String getPassword() {
        return password;
    }

    // Setters
    public void setId(Long id) {
        this.id = id;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
