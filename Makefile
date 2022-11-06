up:
	docker-compose up -d
install_dev:
	@make rebuild
	@make init
init:
	docker-compose up -d --build
	docker-compose exec -T php composer install
	docker-compose exec -T php cp .env.example .env
	docker-compose exec -T php php artisan key:generate
	docker-compose exec -T php php artisan storage:link
#	docker-compose exec -T php php artisan migrate
#	docker-compose exec -T php php artisan db:seed
rebuild:
	docker-compose build --no-cache --force-rm

php:
	docker-compose exec php bash