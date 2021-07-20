FROM izzyacademy/kafka-base:2.8

# in Zookeeper, Brokers and Connect Docker images:
# Copy over the python scripts and generate the configs for Connect Nodes
# Start up Docker containers with Config settings using ENVIRONMENT VARIABLES

COPY scripts/connect-entrypoint.sh /usr/local/software/kafka/bin/connect.entrypoint.sh

RUN chmod 0775 /usr/local/software/kafka/bin/connect.entrypoint.sh

# Client Port
EXPOSE 8083

ENTRYPOINT ["/usr/local/software/kafka/bin/connect.entrypoint.sh"]

# docker build . -f Connect.Confluent.Dockerfile -t izzyacademy/connect:2.8 -t izzyacademy/connect:latest
# docker push izzyacademy/connect:latest && docker push izzyacademy/connect:2.8