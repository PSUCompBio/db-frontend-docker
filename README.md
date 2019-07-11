# db-frontend-docker
This repo is used to create a docker image of the environment for the frontend utilities (code that will be used from the website).

Basically, after creating an instance we install docker on the instance and then run the dockerfile.

The dockerfile calls the docker_scripts/config_bash.sh script that has all the steps to make our environment.

 ## to create docker image
 ## to create docker image
Login into AWS and make a Ubuntu instance
 - Step 1 Choose an Instance: Ubuntu Server 18.04 LTS, 64 bit, General Purpose
 - Step 2 Choose and Instance Type: t2.2xlarge (8 vCPUs, 32 GiB)
 - Step 3 Configure Instance Details: Take defaults but under the "Advanced Details" option select User data -> "As file" -> Select "create_docker_image.sh" from your local machine.  This file is uploaded and run as part of the instance's initiation procedure and will run the Dockerfile and create the docker image.
  - Step 4 Add Storage: Change 8 to 25 GB
  - Step 5 Add Tags: Take defaults
  - Step 6 Configure Security Group: Under "Assign a security group" select, "select an existing security group" and choose nsfcareer. If you do not see that, you need to have ports 80 and 3000 open for Docker to work.

In Step 6: Configure security details. You need to have ports 80 and 3000 open for docker to work.

## Once docker image is created, you can test it:

### List the images created:
sudo docker ps -a OR sudo docker image ls

### Run the docker image:
sudo docker run -it  IMAGE_ID

#### Once inside the image:
 - You can see the TestingProcedures.md to check all the codes that were compiled.

## Commit and push to dockerhub

 sudo docker login -u USERNAME_ON_DOCKERHUB (be sure to have an account at https://hub.docker.com/)

 sudo docker tag       DOCKER_IMAGE_ID      USERNAME_ON_DOCKERHUB/db-frontend:latest

 sudo docker push USERNAME_ON_DOCKERHUB/db-frontend:latest
