#!/bin/bash

# This is where the Kafka Data will be stored
KAFKA_DATA_DIRECTORY="kafka-data"

# This is where the MySQL data will be stored
MYSQL_DATA_DIRECTORY="mysql-data"

echo ""
echo "Removing Kafka and MySQL data directories, if exists"
echo ""
rm -vfR "${KAFKA_DATA_DIRECTORY}" "${MYSQL_DATA_DIRECTORY}"

echo ""
echo "Creating Kafka and MySQL data directories"
echo ""
mkdir -pv "${KAFKA_DATA_DIRECTORY}" "${MYSQL_DATA_DIRECTORY}"

echo " "
echo "Reset Complete"
