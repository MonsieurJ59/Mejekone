# 🐳 Commandes Docker
.PHONY: start stop restart logs clean rebuild db-reset

# Démarrer tous les services (sans rebuild)
start:
	docker-compose up -d

# Démarrer avec rebuild (seulement quand nécessaire)
rebuild:
	docker-compose up -d --build

# Démarrage rapide (sans détacher)
dev:
	docker-compose up

# Arrêter tous les services
stop:
	docker-compose down

# Redémarrer les services
restart:
	docker-compose restart

# Nettoyer et redémarrer complètement
clean-start:
	docker-compose down -v
	docker-compose up -d --build

# Voir les logs
logs:
	docker-compose logs -f

# Voir les logs d'un service spécifique
logs-backend:
	docker-compose logs -f backend

logs-frontend:
	docker-compose logs -f frontend

logs-mysql:
	docker-compose logs -f mysql

logs-phpmyadmin:
	docker-compose logs -f phpmyadmin

# Réinitialiser la base de données
db-reset:
	docker-compose down -v mysql
	docker-compose up -d mysql

# Entrer dans le conteneur backend
shell-backend:
	docker-compose exec backend sh

# Entrer dans le conteneur frontend
shell-frontend:
	docker-compose exec frontend sh

# Voir le statut des conteneurs
status:
	docker-compose ps

# Nettoyer les images et volumes inutilisés
clean:
	docker system prune -f
	docker volume prune -f

# 🎵 Commandes spécifiques à Méjekoné
.PHONY: import-songs create-playlist

# Importer des chansons (à implémenter)
import-songs:
	@echo "Fonctionnalité à implémenter"

# Créer une playlist (à implémenter)
create-playlist:
	@echo "Fonctionnalité à implémenter"

# 🧪 Tests du backend (Spring Boot)
.PHONY: test-backend test-backend-unit test-backend-integration

# Exécuter tous les tests du backend
test-backend:
	docker-compose exec backend ./mvnw test

# Exécuter uniquement les tests unitaires
test-backend-unit:
	docker-compose exec backend ./mvnw test -Dtest=*Test

# Exécuter uniquement les tests d'intégration
test-backend-integration:
	docker-compose exec backend ./mvnw test -Dtest=*IT

# 🖥️ Commandes frontend (React)
.PHONY: lint-frontend format-frontend build-frontend

# Linter le frontend
lint-frontend:
	docker-compose exec frontend npm run lint

# Formater le code frontend
format-frontend:
	docker-compose exec frontend npm run format

# Build le frontend pour la production
build-frontend:
	docker-compose exec frontend npm run build