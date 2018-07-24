provision:
	if [ ! -e ".env" ]; then cp .env.example .env; fi
	make network
	docker-compose -f docker-compose.yml -f docker-compose.local.yml build
	make up
	make migrate

network:
	echo "We'll make a temporary custom ip 172.26.1.0"
	sudo ifconfig lo0 -alias 172.26.1.0 2> /dev/null || true
	sudo ifconfig lo0 alias 172.26.1.0
	docker network create -d bridge test-network || true

migrate:
	docker-compose exec laravel-app php artisan migrate

up:
	docker-compose -f docker-compose.yml -f docker-compose.local.yml up -d

down:
	docker-compose down

reload:
	docker-compose restart
