package com.gathergrid.gathergridtesting.entities;


import com.gathergrid.gathergridtesting.entities.enums.TicketType;
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
public class Ticket {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private double price;

    @Enumerated(EnumType.STRING)
    private TicketType ticketType;

    @ManyToOne
    @JoinColumn(name = "event_id")
    private Event event;

    private Date createdAt;

    public Ticket(double price, int quantityAvailable, TicketType ticketType, Date createdAt, Event event) {
        this.price = price;
        this.ticketType = ticketType;
        this.createdAt = createdAt;
        this.event = event;
    }
}
