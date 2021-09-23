
## Debugging Avro Topics

To debug the Avro topics in our setup lets use the following commands


```shell

docker exec -it schema-registry /bin/bash
  
# The avro console producers/consumers are available in /usr/bin
cd /usr/bin

# List the contents of the directory
ls -l /usr/bin/kafka-*

# Use the Avro Console Consumer to see the latest (starting from the most recent/newest offset) data in the  topics
/usr/bin/kafka-avro-console-consumer --bootstrap-server node1:9092 --key-deserializer org.apache.kafka.common.serialization.IntegerDeserializer --property print.key=true --property schema.registry=http://schema-registry:8081 --topic estreams85.ecommerce.customers

# Use the Avro Console Consumer to see the latest (starting from the earliest/oldest offset) data in the  topics

/usr/bin/kafka-avro-console-consumer --bootstrap-server node1:9092 --key-deserializer org.apache.kafka.common.serialization.IntegerDeserializer --property print.key=true  --from-beginning --property schema.registry=http://schema-registry:8081 --topic estreams85.ecommerce.customers


/usr/bin/kafka-avro-console-consumer --bootstrap-server node1:9092  --from-beginning --property schema.registry=http://schema-registry:8081 --topic estreams85.ecommerce.customers

```
