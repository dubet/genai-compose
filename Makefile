.PHONY: seed

seed:
	./seed.sh

start: seed
	docker compose up -d
