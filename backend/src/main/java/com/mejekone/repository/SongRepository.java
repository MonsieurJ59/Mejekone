package com.mejekone.repository;

import com.mejekone.model.Playlist;
import com.mejekone.model.Song;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface SongRepository extends JpaRepository<Song, Long> {
    List<Song> findByPlaylist(Playlist playlist);
}