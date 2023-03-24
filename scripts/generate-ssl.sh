#!/bin/bash

if [ ! -d "../ssl" ] 
then
  mkdir ../ssl
fi

cd ../ssl

if [ -z "$1" ]
then
  echo "Generating ssl certificate for localhost"
  # 127.0.0.1,::1,
  openssl req -x509 -newkey rsa:4096 -keyout unite-key.pem -out unite-cert.pem -sha256 -days 365 -nodes -subj "/CN=localhost"
else
  echo "Generating ssl certificate for '$1'"
  openssl req -x509 -newkey rsa:4096 -keyout unite-key.pem -out unite-cert.pem -sha256 -days 365 -nodes -subj "/CN=localhost, $1"
fi

chmod 600 unite-key.pem
chmod 600 unite-cert.pem

cd ../scripts
