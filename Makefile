compile:
	docker-compose run --rm web mix compile

shell:
	docker-compose run --rm web iex -S mix

format:
	docker-compose run --rm web mix format

test: format
	docker-compose run --rm web mix test
