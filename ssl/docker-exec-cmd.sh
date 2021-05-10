#!/bin/bash

mkdir /etc/ssl/generated

read -r -d '' alternative_names << EOM
DNS.1=camunda-local.girteka.eu
DNS.2=camunda-test.girteka.eu
DNS.3=camunda-stage.girteka.eu
DNS.4=camunda.girteka.eu
EOM

openssl req -x509 -sha256 -newkey rsa:2048 \
  -keyout /etc/ssl/generated/cert.key \
  -out /etc/ssl/generated/cert.pem \
  -days 3650 \
  -nodes \
  -reqexts SAN \
  -extensions SAN \
  -subj "/CN=camunda.girteka.eu/OU=Automation/O=Girteka Logistics, UAB/L=Vilnius/C=LT/emailAddress=aleksandr.fokin@girteka.eu" \
  -config <(cat /etc/ssl/openssl.cnf; printf "[SAN]\nsubjectAltName=@alt_names\n\n[alt_names]\n${alternative_names}")