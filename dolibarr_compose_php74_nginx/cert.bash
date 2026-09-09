#!/usr/bin/env bash
set -eu
org=localhost-ca
domain=dolibarr.local

openssl genpkey -algorithm RSA -out ca.key
openssl req -sha256 -new -x509 -key ca.key -out ca.crt \
    -days 3650 -subj "/CN=$org/O=$org"

openssl genpkey -algorithm RSA -out "$domain".key
openssl req -sha256 -new -key "$domain".key -out "$domain".csr \
    -subj "/CN=$domain/O=$org"

openssl x509 -sha256 -req -in "$domain".csr -days 365 -out "$domain".crt \
    -CA ca.crt -CAkey ca.key -CAcreateserial \
    -extfile <(cat <<END
basicConstraints = CA:FALSE
subjectKeyIdentifier = hash
authorityKeyIdentifier = keyid,issuer
subjectAltName = DNS:$domain
END
    )
