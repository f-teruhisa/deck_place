default: up

init:
	docker-compose build

up:
	mkdir -p tmp/pids
	rm -rf tmp/pids/*
	docker-compose up

bundle:
	docker-compose run --rm web bundle install

routes:
	docker-compose run --rm web rails routes

rubocop:
	docker-compose run --rm web bundle exec rubocop -a ${ARG}

rspec:
	docker-compose run --rm web bundle exec rspec ${ARG}

brakeman:
	docker-compose run --rm web bundle exec brakeman ${ARG}
