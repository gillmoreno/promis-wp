#!/bin/bash
# Install Amazon EFS utilities
sudo yum install -y amazon-efs-utils

# Mount EFS
sudo mkdir -p /mnt/efs/fs1
sudo mount -t efs -o nfs4,nofail,vers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2,noresvport fs-021d468caa8e8be04:/ /mnt/efs/fs1