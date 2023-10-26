package com.gathergrid.gathergridtesting.entities;


import jakarta.persistence.*;
import lombok.*;

import java.util.Date;
import java.util.List;

@Data
@Entity
@Getter
@Setter
@NoArgsConstructor
@ToString
public class Event {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String name;
    private Date date;
    private String time;
    private int standardPrice;
    private int vipPrice;
    private int premiumPrice;
    private String location;
    private String description;
    private String organizer;

    @Temporal(TemporalType.TIMESTAMP)
    private Date createdAt;

    @ManyToOne
    @JoinColumn(name = "category_id")
    private Category category;

    @OneToMany(mappedBy = "event")
    private List<Ticket> tickets;

    @OneToMany(mappedBy = "event", fetch = FetchType.EAGER)
    private List<Comment> comments;

    public Event(String name, Date date, String time, String location, String description, String organizer, Category category ,int standardPrice, int vipPrice, int premiumPrice) {
        this.name = name;
        this.date = date;
        this.time = time;
        this.location = location;
        this.description = description;
        this.organizer = organizer;
        this.createdAt =new Date();
        this.category = category;
        this.standardPrice = standardPrice;
        this.vipPrice = vipPrice;
        this.premiumPrice = premiumPrice;
    }

    public Event(String name, Date date, String time, String location, String description, Category category, int standardPrice, int vipPrice, int premiumPrice) {
        this.name = name;
        this.date = date;
        this.time = time;
        this.location = location;
        this.description = description;
        this.createdAt =new Date();
        this.category = category;
        this.standardPrice = standardPrice;
        this.vipPrice = vipPrice;
        this.premiumPrice = premiumPrice;
    }
}
