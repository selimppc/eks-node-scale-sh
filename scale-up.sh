#!/bin/bash

# Get the list of Auto Scaling Groups associated with the EKS cluster
CLUSTER_NAME="CLUSTER-NAME"
REGION="AWS-REGION"
NODEGROUP_NAME="NODEGROUP-NAME"

# Desired capacity for each Auto Scaling Group for example 4
DESIRED_CAPACITY=4

# Scale the node group to the desired capacity directly
echo "Scaling up node group: $NODEGROUP_NAME in cluster: $CLUSTER_NAME to desired capacity: $DESIRED_CAPACITY"
aws eks update-nodegroup-config \
  --cluster-name $CLUSTER_NAME \
  --nodegroup-name $NODEGROUP_NAME \
  --scaling-config minSize=2,maxSize=5,desiredSize=$DESIRED_CAPACITY \
  --region $REGION

echo "Scaling up completed for node group: $NODEGROUP_NAME"

# you can put it in cron job according to you up time to save cost
