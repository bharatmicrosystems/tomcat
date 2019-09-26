# tomcat
Tomcat 8 Docker Repository

This repository contains a Dockerfile to run a sample application on Tomcat 8 and demonstrates a CI/CD process in action.

## The Docker file

Builds the tomcat 8.5 instance from scratch
Clones the source code of a sample web application (You can substitute that with your own git repo)
Builds the application using maven
Copies the built war file to the webapps directory as ROOT.war
Runs catalina.sh as entrypoint script

## The cloudbuild.yaml file

Contains configuration to use the Google Cloud Build service which
Builds the docker image in Google Cloud Platform
Pushed the container image in to Google Cloud Registry
Deploys the image to Google Cloud Run
