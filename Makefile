.PHONY: links build-api run-api stop-api start-project stop-project

links:
	@echo "Prometheus: http://localhost:9090"
	@echo "Grafana: http://localhost:3000"

build-api:
	docker build -t mlops-iris-api -f src/api/Dockerfile .

run-api:
	docker container run --rm -d -p 8000:8000 --name mlops-iris-api mlops-iris-api:latest

stop-api:
	docker container stop mlops-iris-api

start-project:
	docker compose up -d --build

stop-project:
	docker compose -p mlops down