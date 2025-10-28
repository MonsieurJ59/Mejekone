package com.mejekone.repository;

import com.mejekone.model.Game;
import com.mejekone.model.GameScore;
import com.mejekone.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface GameScoreRepository extends JpaRepository<GameScore, Long> {
    List<GameScore> findByGame(Game game);
    List<GameScore> findByUser(User user);
    Optional<GameScore> findByGameAndUser(Game game, User user);
}