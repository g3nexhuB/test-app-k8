# hello-python deployed to kuberenetes with ci/cd deployment jenkins server
Very simple hello world python Flask application.

Prequisite:
Setup ssh connectivity of Jenkins server (192.168.56.101) and  remote host (192.168.56.102)
both  Jenkins and remote  host need to have docker installed
Setup both Centos7 with same vlan or hostadapter

The Stages:
1. Cleanup existing repository
2. Pull code from github and build the image
3. docker Run the application in jenkins to test, Run Curl test to check if root endpoint is accessible
4. Approval or verification stage  before push to registry(dockerhub)
5. Push to registry(dockerhub), uses dockerhub creds and save to jenkins
6. Image  save to https://hub.docker.com/repository/docker/g3nex/flask-app
7. ProvisionDeploy login  to dockerhub and pull the image and run the image into the remote host

