# tomcat
Tomcat 8 Docker Repository

This repository contains files to run a sample application on Tomcat 8 and demonstrates a CI/CD process in action.

## The Docker file

1. Builds the tomcat 8.5 instance from scratch
2. Clones the source code of a sample web application (You can substitute that with your own git repo)
3. Builds the application using maven
4. Copies the built war file to the webapps directory as ROOT.war
5. Runs catalina.sh as entrypoint script

## The cloudbuild.yaml file

Contains configuration to use the Google Cloud Build service which
1. Builds the docker image in Google Cloud Platform
2. Pushes the container image in to Google Cloud Registry
3. Deploys the image to Google Cloud Run

## The main.tf file

Is a terraform file which creates a trigger on Google Cloud Build on the supplied parameters
