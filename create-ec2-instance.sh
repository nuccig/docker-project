#!/bin/bash

# Script para criar nova instância EC2 com configurações do python-project

aws ec2 run-instances \
  --image-id ami-0c02fb55956c7d316 \
  --instance-type t2.large \
  --key-name python-project \
  --security-group-ids sg-06e957c79460a9a86 \
  --iam-instance-profile Name=EC2_Access_ECR \
  --count 1 \
  --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=ec2-python-project}]' \
  --user-data file://install-docker.sh
