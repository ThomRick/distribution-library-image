build:
	@docker build -t docker/registry .

start: build
	@docker run --rm -it --net=host -e REGISTRY_HTTP_ADDR=0.0.0.0:8080 -p 8080:8080 docker/registry

start-infra:
	@docker-compose up -d s3

stop-infra:
	@docker-compose down