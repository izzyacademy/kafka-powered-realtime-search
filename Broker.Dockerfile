FROM izzyacademy/kafka-base:2.8

# in Zookeeper, Brokers and Connect Docker images:
# Copy over the python scripts and generate the configs for Kafka Nodes
# Start up Docker containers with Config settings using ENVIRONMENT VARIABLES

COPY scripts/broker.entrypoint.sh /usr/local/software/kafka/bin/broker.entrypoint.sh

RUN chmod 0775 /usr/local/software/kafka/bin/broker.entrypoint.sh

# Client Port
EXPOSE 9092

ENTRYPOINT ["/usr/local/software/kafka/bin/broker.entrypoint.sh"]

# docker build . -f Broker.Dockerfile -t izzyacademy/kafka:2.8 -t izzyacademy/kafka:latest
# docker push izzyacademy/kafka:2.8  && docker push izzyacademy/kafka:latest