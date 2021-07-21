#/bin/bash

# Licensed to IzzyAcademy.com under one or more
# contributor license agreements.  See the NOTICE file distributed with
# this work for additional information regarding copyright ownership.
# IzzyAcademy.com licenses this file to You under the Apache License, Version 2.0
# (the "License"); you may not use this file except in compliance with
# the License.  You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Defines the ARM template file location
export templateFile="aks-cluster.json"

# Defines the parameters that will be used in the ARM template
export parameterFile="parameters.json"

# Defines the name of the Resource Group our resources are deployed into
export resourceGroupName="spark-3.0"

export clusterName="izzySpark"

# Creates the resources group if it does not already exist
echo ""
echo "Creating the Resource Group $resourceGroupName"
echo ""
az group create --name $resourceGroupName --location "West US"

# Creates the Kubernetes cluster and the associated resources and dependencies for the cluster
echo ""
echo "Creating the Kubernetes cluster and the associated resources and dependencies for the cluster"
echo ""
az deployment group create --name streamingKubernetesDeployment --resource-group $resourceGroupName --template-file $templateFile --parameters $parameterFile

# Install the Kubectl CLI. This will be used to interact with the remote Kubernetes cluster
sudo az aks install-cli

# Get the Credentials to Access the Cluster with Kubectl
az aks get-credentials --name $clusterName --resource-group $resourceGroupName

# List the node pools
az aks nodepool list --resource-group $resourceGroupName --cluster-name $clusterName

# Scale the User Node Pool Manually to 5 nodes
# You can use this to scale up the user node pools
# az aks nodepool scale --resource-group $resourceGroupName --cluster-name $clusterName --name userpool --node-count 5 --no-wait

# You can use this to scale down the user node pools
# az aks nodepool scale --resource-group $resourceGroupName --cluster-name $clusterName --name userpool --node-count 1 --no-wait