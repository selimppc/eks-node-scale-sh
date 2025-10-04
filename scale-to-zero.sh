#!/bin/bash

# Get the list of Auto Scaling Groups associated with the EKS cluster
CLUSTER_NAME="CLUSTER-NAME"
REGION="AWS-REGION"
NODEGROUP_NAME="NODEGROUP-NAME"
DESIRED_CAPACITY=0

echo "Scaling down node group: $NODEGROUP_NAME in cluster: $CLUSTER_NAME to 0"

aws eks update-nodegroup-config \
  --cluster-name $CLUSTER_NAME \
  --nodegroup-name $NODEGROUP_NAME \
  --scaling-config minSize=$DESIRED_CAPACITY,maxSize=5,desiredSize=$DESIRED_CAPACITY \
  --region $REGION

echo "Scaling down completed for node group: $NODEGROUP_NAME"

# you can put it in cronjob to scale 0 for saving costs
