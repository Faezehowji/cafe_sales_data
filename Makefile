# Makefile for cleaning_sales_data Docker image

IMAGE_NAME=cleaning_sales_data
CONTAINER_NAME=sales_data_container

.PHONY: build run stop remove ps rmi logs

# Build the Docker image
build:
	docker build -t $(IMAGE_NAME) .

# Run the container in detached mode
run:
	-@docker rm -f $(CONTAINER_NAME) 2>/dev/null || true
	docker run --name $(CONTAINER_NAME) -d -p 8888:8888 -v $(PWD):/app $(IMAGE_NAME)

# Stop the container
stop:
	docker stop $(CONTAINER_NAME)

# Remove the container
remove:
	docker rm $(CONTAINER_NAME)

# Show running containers
ps:
	docker ps

# Remove the image
rmi:
	docker rmi $(IMAGE_NAME)

# Show logs from the container
logs:
	docker logs -f $(CONTAINER_NAME)
