# Méjekoné - Application de Blindtest

Méjekoné est une application web de blindtest permettant aux utilisateurs de jouer et de tester leurs connaissances musicales.

## Structure du projet

Le projet est divisé en deux parties principales :
- **Frontend** : Application React (Vite + JavaScript)
- **Backend** : API Spring Boot (Java)
- **Base de données** : MySQL

## Prérequis

- Docker et Docker Compose
- Java 17
- Node.js 18+
- npm ou yarn

## Installation et démarrage

1. Cloner le dépôt
2. Lancer l'application avec Docker Compose :
   ```
   docker-compose up -d
   ```

## Accès aux services

- **Frontend** : http://localhost:5173
- **Backend API** : http://localhost:8080
- **PHPMyAdmin** : http://localhost:8082 (utilisateur: root, mot de passe: root)

## Développement

### Frontend
Le frontend est développé avec React et Vite. Pour lancer le frontend en mode développement :
```
cd frontend
npm install
npm run dev
```

### Backend
Le backend est développé avec Spring Boot. Pour lancer le backend en mode développement :
```
cd backend
./mvnw spring-boot:run
```

## Fonctionnalités

- Création et gestion de playlists de blindtest
- Système de jeu en temps réel
- Système de score et classement
- Interface utilisateur intuitive et responsive