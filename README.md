# hello-python deployed to kuberenetes with ci/cd deployment jenkins server
Very simple hello world python Flask application.

Prequisite:
Setup ssh connectivity of Jenkins server (192.168.56.101) and  remote host (192.168.56.102)
both  Jenkins and remote  host need to have docker installed
Setup both Centos7 with same vlan or hostadapter

The Stages:
1. Cleanup existing repository
2. Pull code from github and build the image
3.