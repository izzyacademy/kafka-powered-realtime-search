# Extends the base kafka connect image from Confluent
FROM confluentinc/cp-kafka-connect-base:6.2.0

# Installs the Source Connector for MySQL
RUN confluent-hub install --no-prompt debezium/debezium-connector-mysql:1.6.0

# Install the Source Connector for Cosmos DB
RUN confluent-hub install --no-prompt microsoftcorporation/kafka-connect-cosmos:1.0.4-beta

# Install the Sink Connector for ElasticSearch
RUN confluent-hub install --no-prompt confluentinc/kafka-connect-elasticsearch:11.0.6

# Install the Sink Connector for Azure Cognitive Search
RUN confluent-hub install --no-prompt confluentinc/kafka-connect-azure-search:1.0.4


# Command to build and push the new Docker image to the remote repository
# docker build . -f Connect.Confluent.Dockerfile -t izzyacademy/cp-kafka-connect:6.2.0
# docker push izzyacademy/cp-kafka-connect:6.2.0
