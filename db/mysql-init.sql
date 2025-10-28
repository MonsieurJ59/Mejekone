-- Création de la base de données si elle n'existe pas déjà
CREATE DATABASE IF NOT EXISTS mejekone;
USE mejekone;

-- Création des tables
CREATE TABLE IF NOT EXISTS users (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS playlists (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    user_id BIGINT,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE IF NOT EXISTS songs (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    artist VARCHAR(100) NOT NULL,
    audio_url VARCHAR(255) NOT NULL,
    image_url VARCHAR(255),
    duration INT NOT NULL,
    playlist_id BIGINT,
    FOREIGN KEY (playlist_id) REFERENCES playlists(id)
);

CREATE TABLE IF NOT EXISTS games (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    playlist_id BIGINT NOT NULL,
    start_time DATETIME NOT NULL,
    end_time DATETIME,
    status VARCHAR(20) NOT NULL DEFAULT 'WAITING',
    FOREIGN KEY (playlist_id) REFERENCES playlists(id)
);

CREATE TABLE IF NOT EXISTS game_scores (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    user_id BIGINT NOT NULL,
    game_id BIGINT NOT NULL,
    score INT NOT NULL DEFAULT 0,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (game_id) REFERENCES games(id)
);

-- Insertion de données de test
INSERT INTO users (username, password, email) VALUES 
('admin', '$2a$10$dXJ3SW6G7P50lGmMkkmwe.20cQQubK3.HZWzG3YB1tlRy.fqvM/BG', 'admin@mejekone.com'),
('user1', '$2a$10$dXJ3SW6G7P50lGmMkkmwe.20cQQubK3.HZWzG3YB1tlRy.fqvM/BG', 'user1@mejekone.com');

INSERT INTO playlists (name, description, user_id) VALUES 
('Hits des années 80', 'Les meilleurs tubes des années 80', 1),
('Rock Classique', 'Les grands classiques du rock', 1);

INSERT INTO songs (title, artist, audio_url, image_url, duration, playlist_id) VALUES 
('Billie Jean', 'Michael Jackson', '/songs/billie_jean.mp3', '/images/billie_jean.jpg', 294, 1),
('Sweet Child O Mine', 'Guns N Roses', '/songs/sweet_child.mp3', '/images/sweet_child.jpg', 355, 2);

INSERT INTO games (name, playlist_id, start_time, status) VALUES 
('Partie test', 1, NOW(), 'WAITING');

INSERT INTO game_scores (user_id, game_id, score) VALUES 
(1, 1, 0),
(2, 1, 0);