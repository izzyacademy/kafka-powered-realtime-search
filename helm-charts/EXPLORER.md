## Exploring Kafka Topics

We can browse the list of topics using the topics command or by using the Kafka REST Proxy API

```shell

kubectl -n river exec deploy/broker1 -it -- bash

/usr/bin/kafka-topics --bootstrap-server broker1-internal:9092 --list

# Create the topic where events from the Cosmos DB Source connect will be arriving
/usr/bin/kafka-topics --bootstrap-server broker1-internal:9092 --create --topic ecosmos.vipcustomers --partitions 3 --replication-factor 1

/usr/bin/kafka-topics --bootstrap-server broker1-internal:9092 --describe ecosmos.vipcustomers

```

```shell
# Check the status of the deployments and pods
kubectl -n river get deployments
kubectl -n river get pods


# Get on the pod for the schema registry deployment
kubectl -n river exec deploy/schemaregistry -it -- bash 

# Use the Avro Console Consumer to see the latest (starting from the most recent/newest offset) data in the products and product details topics
/usr/bin/kafka-avro-console-consumer --bootstrap-server broker1-internal:9092 --key-deserializer org.apache.kafka.common.serialization.IntegerDeserializer --property print.key=true --property schema.registry=http://schemaregistry-external.river.svc.cluster.local:8081 --topic estreams75.ecommerce.customers

# Use the Avro Console Consumer to see the latest (starting from the earliest/oldest offset) data in the products and product details topics
/usr/bin/kafka-avro-console-consumer --bootstrap-server broker1-internal:9092 --key-deserializer org.apache.kafka.common.serialization.IntegerDeserializer --property print.key=true --from-beginning --property schema.registry=http://schemaregistry-external.river.svc.cluster.local:8081 --topic estreams75.ecommerce.customers

##

```
