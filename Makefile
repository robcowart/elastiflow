DOCKER_IMG = chi1-docker-registry.simulprod.com/roblox/neteng-elastiflow-logstash
DOCKER_TAG = 1.0.3

build:
	docker build --build-arg BUILD_DATE=$(date -u +'%Y-%m-%dT%H:%M:%SZ') --no-cache -t $(DOCKER_IMG):$(DOCKER_TAG) .

push:
	docker push $(DOCKER_IMG):$(DOCKER_TAG)
