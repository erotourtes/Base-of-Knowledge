---
title: "Docker"
date: 2023-05-26T16:58:21+03:00
draft: false
---

## Architecture

Container - is a process, which has it's own file system

Docker depends on Kernel

## Recap

When we ran a container and doesn't interact with it, the container simply stopps

## Commands
```fish
docker pull ubuntu # downloads an image
docker run ubuntu # ducker pull & docker run
docker run -it ubuntu # interactive mode
```

### Show List
```fish
docker ps -a  # all containers
docker image ls (or docker images) # all images
```

### Build
```fish
docker build -t <name>:version ./path/to/Dockerfile # tag with a name and a version
docker image tag <name>:version <another-name>:new-version # to change tag later
```
> docker build -t name:v1 .


### Clean&Remove
`docker container prune` removes all containers  
`docker image prune` removes all images  
`docker image rm <image name or id>`
`docker container rm <container-name>` or `docker rm <container-name>`  
`docker rm -f <contianer-name>` force remove

### Exec
Execute a command in a running container  
`docker exec <container-id> <command>`  
`docker exec -it -u <user-name> <id>`

### Volumes
Stores data on the local machine. So after deleting a container, the volume will be still avaliable  
`docker volume create <name>`  
`docker volume inspect <name>` get an info  
`docker run -d -p <local>:<container> -v <volume-name>/absolute/path <image>`

### Copying files
`docker cp <container-id>:/absolute/path/to/file ./path/on/the/local/machine` from a container to the local machine
`docker cp ./path/on/the/local/machine  <container-id>:/absolute/path/to/file` from a local machine to the container

### Sharing source files
`docker -d -p <80>:<3000> —name <name> -v $(pwd):/app <image>`

### Run
`docker run -it <image> sh` Run a new image with in interactive mode with `sh` command  
`docker run -d <image>` Run an image in detached mode  
`docker run -p <machine-port>:<container-port> <image>` make machne listen on the port of the container  
> docker run -d -p 5000:3000 -v app-data:/app/data my-project

### Logs
`docker logs <container-id>`

### Start&Stop
```fish
docker start -i <id> # starts the contianer in the interactive mode
docker start <container-id>
docker stop <container-id>
```

### Dockerfile
```fish
docker build -t <name>:<tag> ./path/Dockerfile
docker run -d -p <local>:<container> --name <name> -v <volume-name> /absolute/path <image>
```

## .dockerignore
To exlude file
```.dockerignore
node_modules/
```


## Dockerfile
Image is a collection of layers 
> we can view it by using `docker history <image>`

### Example
```Dockerfile
FROM node:16.19-alpine3.17

# RUN addgroup app && adduser -S -G app app
# USER app

WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .

ENV API_URL=https://api.app.com

RUN mkdir ./data

CMD ["npm", "start"]
```

### Instructions
- from
- workdir
- copy
- add
- run
- env
- expose
- user
- cmd
- entrypoint

### COPY
```Dockerfile
COPY . . # all filees in the current work directory
COPY ["with space.txt", "."]
COPY 1.txt 2.txt /app/
```

### ADD
`Add` is similar to `Copy`, but you can add files from urls. It also can use compressed file
```Dockerfile
ADD . .
ADD https://urls.json
ADD compressed.zip
```

### RUN
```Dockerfile
RUN npm install
```

### ENV
To set an environemntal variable
```Dockerfile
ENV API_URL=https://api.app.com
```

### EXPOSE
To set what port the container would be listening for  
It’s like documentation. It won’t publish port on a host. You need to write docker run -p 3030:3000 to map ports
```Dockerfile
EXPOSE 3000
```

### USER
Docker uses the root user. It might lead to security problems, therefore we need to create a user
```Dockerfile
# addgroup group_name && adduser -S -G group_name user_name
RUN addgroup app && adduser -S -G app app

USER app
```
> There might be a problem if you switch to user with limited privileges in the end. If you creating the folder as a root and then switching to app user, you won’t be able to create, modify files

### CMD
To not execute every time in which environment you want to start use `CMD` instruction. `Run` instruction runs when images is building, in contrast `CMD` is a runtime instruction. It’s executed when you starts a container.
```Dockerfile
# CMD sh

# Shell instruction => 
# you need to start a shell as a new proces in order to run this command
CMD npm start

# Exec form
# It's a best practice, since you don't need to crate a shell process =>
# It's faster to clean resources when exeting a container
CMD ["npm", "start"]
```

### ENTRYPOINT
Similar to the `CMD`, however you can easily overwrite `CMD` instruction by running `docker run <image> sh`  
To overwrite `ENTRYPOINT` you need to run `docker run <image> —entrypoint sh`
```Dockerfile
# Shell form
ENTRYPOINT npm start

# Exec form
ENTRYPOINT ["npm", "start"]
```


## Docker-compose
`docker-compose build`  
`docker-compose build -no-cache -pull`  
`docker-compose up -build -d`  
`docker-compose down`  
`docker-compose ps` shows only running continaers from the app

### Example
```yml
version: "3.8" # docker-compose version

services:
  web:
    build: ./frontend # path to Dockerfile
    ports:
      - 3000:3000 # mappping ports
    volumes:
      - ./frontend:/app # overwrites app folder with frontend in a container

	web-tests:
		image: image_web
		volumes:
			- ./frontend:/app
		command: npm test


  api: 
    depends_on: 
      - db
    build: ./backend
    ports: 
      - 3001:3001
    environment: 
      DB_URL: mongodb://db/

		volumes:
			- ./backend:/app
    command: ./docker-entrypoint.sh

  db:
    image: mongo:4.0-xenial
    ports:
      - 27017:27017
    volumes:
      - volumeName:/data/db

volumes:
  volumeName:
```
