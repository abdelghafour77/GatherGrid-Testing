package com.gathergrid.gathergridtesting.entities;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

import java.util.Date;

@Entity
@Getter
@Setter
@NoArgsConstructor
@ToString
public class Comment {
    @Id
    @GeneratedValue
    private Long id;
    private String commentText;
    private int rating;
    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;
    @ManyToOne
    @JoinColumn(name = "event_id")
    private Event event;
    private Date createdAt;

    public Comment(String commentText, int rating, User user, Event event, Date createdAt) {
        this.commentText = commentText;
        this.rating = rating;
        this.user = user;
        this.event = event;
        this.createdAt = createdAt;
    }
}
