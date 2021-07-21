## Helm Charts

This directory contains Helm charts used to provision a variety of data stores and data workloads in the Kubernetes cluster.

We will be interacting with these resources throughout the course.

You will also see the syntax for installing and verifying the presence of various components of each resource.

## General Syntax for Helm Commands
This directory contains several Helm charts and we are going to go over the general syntax for performing the following tasks
- Installing the Helm Chart
- Upgrading the Helm Chart
- Uninstalling the Helm Chart
- Getting a List of Releases installed via Helm

### Installing a Helm Chart

This is the general syntax I use for installing a helm chart. It installs it if it is the first time or updates the release if it already exists

```shell
helm upgrade --install {release} {path to chart} --set {specific values}
```
### Removing the Helm Release

```shell
helm uninstall {release name}
```

### Getting the List of Helm Releases

```shell
helm list
```

## General Syntax for Interacting with the Kubernetes Resources
We are also going to discuss briefly how to perform the following tasks
- Getting a List of Kubernetes namespaces on the cluster
- Listing all the network services within a namespace
- Listing all the pods within a namespace
- Listing all the persistent volumes on the cluster
- Listing all the secrets within a namespace
- Listing all the config maps within a namespace
- Connecting into the default pod within a deployment
- Getting the logs from the default pod within a deployment


```shell
# Use this command to get the list of Kubernetes namespaces on the cluster 
kubectl get namespaces
kubectl get ns

# Use this command list all the persistent volumes
kubectl get pv
kubectl get persistentvolumes

# Use this command to get the network services within a namespace
kubectl -n {namespace} get services
kubectl -n {namespace} get svc

# Use this command to list all the deployments within a namespace
kubectl -n {namespace} get deployments

# Use this command to list all the pods within a namespace
# It also shows you the status and age of each of the pods
kubectl -n {namespace} get pods

# Use this command to list all the secrets in a namespace 
kubectl -n {namespace} get secrets

# Use this command to list all the config maps within a namespace
kubectl -n {namespace} get configmap
kubectl -n {namespace} get cm

# Use this command to connect to the specific pod within a deployment
kubectl -n {namespace} exec deploy/{deployment name} -it -- {command}

# Use this command to get logs from a specific pod within a deployment
kubectl -n {namespace} logs deploy/{deployment name}

```
## Setting up Data Stores and Resources

In the following sections, we are going to walk through how to set up the data stores and data workloads

We are now going to navigate to the directory containing the Helm Charts (packaged and templatized Kubernetes manifests)

These Helm charts helps speed up the provisioning of the underlying infrastructure used to power our datastores and workloads

```shell

cd MassiveData-Course-Resources/Infrastructure/HelmCharts

```

### Setting up MySQL Datastores

Use the following commands to install MySQL 5.6 and then check if the pods and the services are available for use

```shell

# Installs the Single node MySQL Database server
helm upgrade --install mysql57 ./MySQL5.7

kubectl -n mysql57 get pods

kubectl -n mysql57 get services

```





### Setting Up the ElasticSearch and Kibana Resources

```shell

# Install Elastic Search Server and Kibana (single nodes)

helm upgrade --install elasticsearch ./ElasticSearch

kubectl get pods

# look for the public ips/port numbers for the elasticsearch-external services
kubectl get svc

```


### Setting up Kafka Cluster and Ecosystem

```shell

# Run this command to create the namespace for the Kafka ecosystem
kubectl create ns river

# After each helm install command use the following commands to see the pods and services within the cluster

kubectl -n river get pods
kubectl -n river get svc

# The following command can be used to install/reinstall the Zookeeper component (single node)
helm upgrade --install river-zookeeper ./Confluent --set zookeeper.enabled=true


# The following command can be used to install/reinstall the Kafka Broker components (5-node cluster)
helm upgrade --install river-broker ./Confluent --set broker.enabled=true


# The following command can be used to install/reinstall the Schema registry components (single instance)
helm upgrade --install river-registry ./Confluent --set schemaregistry.enabled=true


# The following command can be used to install/reinstall the Kafka Connect components (2-node cluster in distributed mode)
helm upgrade --install river-connect ./Confluent --set connect.enabled=true


# The following command can be used to install/reinstall the Kafka Rest Proxy components (single node instance)
helm upgrade --install river-restproxy ./Confluent --set restproxy.enabled=true


# The following command can be used to install/reinstall the KSQL components (single node instance)
helm upgrade --install river-ksql ./Confluent --set ksqldbserver.enabled=true --set ksqldbcli.enabled=true

```
