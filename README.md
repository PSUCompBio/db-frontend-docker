# db-frontend-docker
Creates a docker image for the frontend environment for nsfcareer project. Has tools for converting ply files to images. After creating an instance we install docker on the instance and then run the Dockerfile. The Dockerfile calls the docker_scripts/config_bash.sh script that has all the steps to make our environment.

 ## to create docker image
Login into AWS and make a ubuntu instance (Ubuntu Server 19.04 LTS, 64 bit, General Purpose, t2.2xlarge).


In Step 3: Configure Instance Details, under the Advanced Details option select User data -> "As file" -> Select "create_docker_image.sh" from your local machine.  This file is uploaded and run as part of the instance's initiation procedure and will run the dockerfile and create the docker image.


In Step 6: Configure security details. You need to have ports 80 and 3000 open for docker to work.

## once docker image is created, commit and push to dockerhub

 sudo docker ps -a

 sudo docker login -u USERNAME_ON_DOCKERHUB (be sure to have an account at https://hub.docker.com/)

 sudo docker tag       DOCKER_IMAGE_ID      USERNAME_ON_DOCKERHUB/db-frontend:latest

 sudo docker push USERNAME_ON_DOCKERHUB/db-frontend:latest
