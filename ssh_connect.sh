#!/bin/bash

if [ $# -eq 0 ]; then
    echo "Error: IP address is required"
    echo "Usage: $0 <ip-address>"
    echo "Example: $0 35.152.140.218"
    exit 1
fi

IP_ADDRESS=$1

echo "Connecting to EC2 instance at $IP_ADDRESS..."
ssh -i promise-key.pem "ec2-user@$IP_ADDRESS"

# scp -i promise-key.pem admin.zip ec2-user@15.161.127.104:/mnt/efs/fs1/promis-wp
# scp -i promise-key.pem registrazione.zip ec2-user@15.161.127.104:/mnt/efs/fs1/promis-wp
