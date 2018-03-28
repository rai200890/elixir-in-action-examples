compile:
	docker-compose run --rm web mix compile

shell:
	docker-compose run --rm web iex -S mix

test:
	docker-compose run --rm web mix test
