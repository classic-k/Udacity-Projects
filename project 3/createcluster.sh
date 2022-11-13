#!/bin/bash
#sudo ~/aws/install
aws configure --profile name
#name represent dprofile name e.g dev
#enter access key, secret, region and other required inputs



#create VPC for eks cluster

aws cloudformation create-stack --stack-name vpc_name --region us-east-2 --template-body file://yaml_files/vpctempv2.yaml --profile name

#create eks cluster
aws eks create-cluster --region us-east-2 --name cluster_name --role-arn arn:aws:iam::378284883666:role/eksCluster --resources-vpc-config subnetIds=subnetids,subnet_ids,securityGroupIds=security_ids --profile name

# Create node group for eks
aws eks create-nodegroup --cluster-name udagdeveks --nodegroup-name nodegrp --subnets subnet-087fd67accea15e3b subnet-026da0c5eb6427059 --remote-access ec2SshKey=nodegrpkey,sourceSecurityGroups=sg-0a516b2d76d7e8364 --scaling-config minSize=3,maxSize=4,desiredSize=4 --ami-type AL2_x86_64 --node-role arn:aws:iam::378284883666:role/ecnodes --disk-size 20 --capacity-type ON_DEMAND --instance-types m5.large --region us-east-2 --profile dev

#Update kubectl config
aws eks update-nodegroup --cluster-name udagdeveks --nodegroup-name nodegrp --scaling-config minSize=3,maxSize=5,desiredSize=4 --region us-east-2 --profile dev