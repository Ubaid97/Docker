# Containerization with Docker
## What is containerization
- Containerization is the process of packaging an application along with 
its required libraries, frameworks, and configuration files together so 
that it can be run in various computing environments efficiently
- The encapsulation of an application and its required environment

## What is Docker
- Docker is an open soure platform **docker hub documentation**
- It helps and enables us to seperate applications from the 
infrastructure
- It allows us to deliver software faster
- Docker is written in GO language

## Why Docker
- Big companies are using Docker - Ebay, Netflix, Sky etc.
- does away with the need to replicate local environment on each 
machine, saving time and effort
- devops-friendly: Containerization packages the application along with 
its environmental dependencies, which ensures that an application 
developed in one envvironment works in another. Helps developers and 
testers work collaboratively on the application


## Difference between VM and Docker
- Docker is lightweight and user-friendly
- Docker shares the resources of OS as opposed to using it completely
- Docker engine connects the container with OS and only uses the 
resources required
- VM works with Hypervisor to connect guest OS/VM with Host OS/server
- A VM emulates an entire OS inside the host OS and requires a fixed 
allocation that goes into running all the processes of an OS. This leads 
to unnecessary wastage of computing resources due to large overhead
- Setting up a VM takes time, as does the process of setting up a 
particular application in each and every VM. Results in significant 
amount of time and effort spent in just setting up the environment
- Containerization circumvents these problems by packaging all the 
required dependencies in a portable image file along with the software

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
```docker exec -it container_id bash``` (-it stands for interactive 
shell)
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
- Finally, run the new image from your docker hub repo:
- ```docker run -d -p port:port docker_repo_name```

### Building a docker image
- To build a docker image we need to create a Dockerfile (naming 
convention - Dockerfile)
- We use a Dockerfile to automate the tasks in an image/container
- Information required in a Dockerfile depends on client demands
- We need to know the dependencies required to run the app/db etc
- Wrap up all the dependencies in the Dockerfile and execution commands

### Dockerfile syntax
- ```FROM``` - tells docker which base image to use in building image 
(eg nginx)
- ```LABEL MAINTAINER=umuhammad@spartaglobal.com```
- ```COPY``` - copies files/folders from localhost to container
- ```EXPOSE``` - default port
- ```CMD``` - execution command
- After having completed the Dockerfile, run the following cpmmand to 
build image:
- ```docker build -t docker_repo_name .```
- To run image on browser: ```docker run -d -p port:port 
docker_repo_name```

### Containerise node app
- Create a new directory with a new Dockerfile, and copy app folder into 
directory
- In the Dockerfile, specify the official node image as base image, and 
add label:
```docker
# using official image of node as base image
FROM node

LABEL MAINTAINER=umuhammad@spartaglobal.com
```
- Create a new directory to hold the app and its dependencies:
```docker
WORKDIR /usr/src/app
```
- Copy the app folder from localost to the directory in image which will 
hold app:
```docker
COPY app ./
```
- Run the command ```npm install``` to install modules needed to run the 
app, and specify a port for launch:
```docker
RUN npm install

# launch on port 3000
EXPOSE 3000
```
- Execute the following command to run app:
```docker
CMD ["node", "app.js"]
```
- Dockerfile should look like this:
```docker
FROM node

LABEL MAINTAINER=umuhammad@spartaglobal.com

WORKDIR /usr/src/app

COPY app ./

RUN npm install

EXPOSE 3000

CMD ["node", "app.js"]
```
- Commit and push imagge to docker repo

### Multi-stage layers
- The following code is used for multi-stage layering:
```docker
# Creating micro services for nodejs front-end using docker
FROM node as APP

WORKDIR /usr/src/app

COPY app ./

RUN npm install

FROM node:alpine

# building a multi-stage layer
# main line of code for multi-stage
COPY --from=app /usr/src/app /usr/src/app

WORKDIR /usr/src/app

EXPOSE 3000

CMD ["node", "app.js"]

```

## Microservices vs Monolithic architecture
### Monolithic
- In a monolithin architecture, the whole application, including 
dependencies, are built on a single system with a single executable 
binary for deployment
- There are some advantages to using monolithic
- Less operational overheads: avoids additional costs stemming from 
interservice communication, load balancing, decentralised data 
management etc.
- Testing for monolithic is simpler than for microservices
- shared memory access means better performance
- But it also has drawbacks
- Because the entire appplication is built on a single system, it's 
difficult to isolate services for upgrades and independent scaling as 
the application evolves and demands change
- becomes increasingly difficult to understand as the application grows 
and the number of layers and depenencies increase
- Hard to distribute development because of tightly integrated 
parts/services - makes distributed team effort difficult
- Heavy apps can slow down start up time (becausw they have to be run 
all at once)
- Each update results in redeploying the full stack app

### Microservices
- The idea is to split your application into a set of smaller, 
inter-connected services that are:
	- Highly maintainable and testable
	- Loosely coupled
	- Independently deployable
	- Organised around business capabilities
	- Owned by small teams
- some advantages:
- Decoupled: each unit can be upgraded without requiring a complete 
overhaul of the application
- Easier onboarding of new developers: only need to master microservice 
they'll be working on
- Scalability: each microservice can be scaled independently, while also 
adding new components
- Improved fault isolation: as modules work independently from each 
other, a failure in one module doesn't affect the others, and is easier 
to isolate as only the module in question needs to inspected
- smaller and faster deployments because each service can be scaled and 
deployed independently of the others, instead of having to deploy and 
scale the entire app at once
