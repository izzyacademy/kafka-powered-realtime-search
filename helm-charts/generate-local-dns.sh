#!/bin/bash

# Defines the output file containing the IP address to domain name mappings
DNS_FILE="dns-mappings.txt"

# This is your domain name suffix
# FQDNs will be generated in the format subdomain.dnssuffix.com
DNS_SUFFIX="izzyacademy.com"

# This function Resets the DNS database
initialize_dns_database()
{
    echo "# ======================================================================" > $DNS_FILE
    echo "# BEGIN List of External IP Addresses Extracted from Kubernetes Services" >> $DNS_FILE
    echo "# ======================================================================" >> $DNS_FILE
    echo ""
    echo ""
}

close_dns_database()
{
    echo "# ======================================================================" >> $DNS_FILE
    echo "# END List of External IP Addresses Extracted from Kubernetes Services  " >> $DNS_FILE
    echo "# ======================================================================" >> $DNS_FILE

    echo ""
    echo "Displaying contents of DNS FILE  $DNS_FILE"
    echo ""
    cat  $DNS_FILE

    echo ""
    echo ""
    echo "You may now copy the contents of the DNS FILE '$DNS_FILE' to your '/etc/hosts' file"
    echo ""
    echo "Adminstrative privilleges may be necessary to update your local DNS hosts file. Have fun!"
    echo ""
    echo ""
}


# This function extracts the DNS entry and appends it to the database
prepare_service_dns_entry()
{
    SERVICE_NAMESPACE=$1
    SERVICE_NAME=$2
    SERVICE_SUBDOMAIN=$3

    SERVICE_EXTERNAL_IP=$(kubectl -n $SERVICE_NAMESPACE get svc $SERVICE_NAME -o=jsonpath='{.status.loadBalancer.ingress[0].ip}')
    EXTERNAL_SERVICE_FQDN="$SERVICE_SUBDOMAIN.$DNS_SUFFIX"
    CLUSTER_IP_SERVICE_FQDN="$SERVICE_NAME.$SERVICE_NAMESPACE.svc.cluster.local"

    SERVICE_DNS_ENTRY="$SERVICE_EXTERNAL_IP $SERVICE_NAME   $SERVICE_SUBDOMAIN  $CLUSTER_IP_SERVICE_FQDN    $EXTERNAL_SERVICE_FQDN"

    echo ""
    echo "Appending DNS Entry $SERVICE_DNS_ENTRY to DNS FILE $DNS_FILE"

    echo $SERVICE_DNS_ENTRY >> $DNS_FILE
}

# Initializes the datbase
initialize_dns_database

# Preparing the DNS Database used to update our /etc/hosts file
# prepare_service_dns_entry kubernetes-namespace kubernetes-service-name dns-subdomain

prepare_service_dns_entry elasticsearch elasticsearch-external elasticsearch

prepare_service_dns_entry mysql56 mysql-external mysql-db


prepare_service_dns_entry river broker1-external broker1
prepare_service_dns_entry river broker2-external broker2
prepare_service_dns_entry river broker3-external broker3
prepare_service_dns_entry river broker4-external broker4
prepare_service_dns_entry river broker5-external broker5
prepare_service_dns_entry river connect-external connect
prepare_service_dns_entry river ksqldbserver-external ksqldbserver
prepare_service_dns_entry river restproxy-external restproxy
prepare_service_dns_entry river schemaregistry-external schemaregistry
prepare_service_dns_entry river zookeeper1-external zookeeper1

# Closes the database entries
close_dns_database
