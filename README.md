# Containerization with Docker
## What is Docker
- Docker is an open soure platform **docker hub documentation**
- It helps and enables us to seperate applications from the 
infrastructure
- It allows us to deliver software faster
- Docker is written in GO language

## Why Docker
- Big companies are using Docker - Ebay, Netflix, Sky etc.

## Difference between VM and Docker
- Docker is lightweight and user-friendly
- Docker shares the resources of OS as opposed to using it completely
- Docker engine connects the container with OS and only uses the 
resources required
- VM works with Hypervisor to connect guest OS/VM with Host OS/server

## Demand and future of Docker
## Docker API

## Docker commands
- You can run an image by specifying which port to run it on:
```Docker run -d -p port:port name_of_image```
- Then, check which images are available:
```Docker images```
- And which containers are running:
```Docker ps```
- To stop a container, run ```Docker stop container_id```
- To restart a container ```Docker start container_id```
- To delete a container ```Docker rm container_id -f```
- Stopping a container means that, though no longer running, the 
container is still available, and any changes made will be available when 
the start command is ran again
- Deleting a container means that the container is no longer available to 
start, and will need to be pulled again

### Logging into a container
- On windows, before logging in, run ```alias docker="winpty docker"```
- To log into a container, use the following command:
```docker exec -it container_id bash```
- Once logged in, you can then make changes to the container

### Copying files from localhost to docker container
- Run this command in local machines:
```docker cp filepath/filename container_id:/filepath```

### Pushing container to Docker hub
- Once the image is up and running, you can add it to your docker hub so 
that it can be accessed globally
- Commit the image: ```docker commit container_id docker_repo_name```
- Push: ```docker push docker_repo_name:tagname```
- Run ```docker images``` to check that the new image has been created
- You might need to run ```docker login``` before pushing to authorise 
access
