package com.mejekone.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "songs")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Song {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    @Column(nullable = false)
    private String title;
    
    @Column(nullable = false)
    private String artist;
    
    @Column(nullable = false)
    private String audioUrl;
    
    private String imageUrl;
    
    @Column(nullable = false)
    private Integer duration;
    
    @ManyToOne
    @JoinColumn(name = "playlist_id")
    private Playlist playlist;
}