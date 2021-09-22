# Kafka-Powered Realtime Search


## Setting up the Relative Volumes for Kafka and MySQL

Navigate to the compose/kraft folder and create folders that will be mounted as volumes in the docker compose scripts. 

We need to create the following data directories inside the compose/kraft folder/directory:

- mysql-data
- kafka-data

These folders will be used for storing the local Kafka data and MySQL data.

```shell

cd compose/kraft

mkdir -p mysql-data kafka-data

```

## Booting Up the Cluster

```shell

# Run this command to boot up the cluster
docker-compose -f connect-demo.yml up

# Run this command to shut down and clean up
docker-compose -f connect-demo.yml down --remove-orphans

```

