#!/bin/bash
OUTPUT_DIR=/home/rocky/client-configs/files
BASE_CONFIG=/home/rocky/client-configs/base.conf
KEY_DIR=/home/rocky/client-configs/keys

mkdir -p ${OUTPUT_DIR}

cat "${BASE_CONFIG}" \
<(echo -e '<ca>') \
"${KEY_DIR}/ca.crt" \
<(echo -e '</ca>\n<cert>') \
"${KEY_DIR}/${1}.csr.crt" \
<(echo -e '</cert>\n<tls-crypt>') \
"${KEY_DIR}/ta.key" \
<(echo -e '</tls-crypt>') \
> "${OUTPUT_DIR}/${1}.ovpn"
