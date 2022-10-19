DOCKER_IMAGE_NAME=andreclaudino/k8s-pod-clean-up
DOCKER_IMAGE_TAG=1.0.3-1.24.6

docker/image:
	chmod +x docker/entrypoint.sh
	docker build docker -f docker/Dockerfile -t $(DOCKER_IMAGE_NAME):$(DOCKER_IMAGE_TAG)
	touch docker/image

docker/login:
	docker login
	touch docker/login

docker/push: docker/login docker/image
	docker push $(DOCKER_IMAGE_NAME):$(DOCKER_IMAGE_TAG)
	touch docker/push


clean:
	rm -rf docker/image
	rm -rf docker/push
	rm -rf docker/login