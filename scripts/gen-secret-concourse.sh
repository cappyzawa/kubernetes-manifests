#!/usr/bin/env bash

tmp_dir=`mktemp -d secrets`
cd ${tmp_dir}
for i in host-key session-signing-key worker-key; do
    # Generate the private key
    openssl genpkey -algorithm RSA -out ${i} -pkeyopt rsa_keygen_bits:2048
    # Extract the public key in a SSH-compatible formatchmod 400 $i
    chmod 400 ${i}
    ssh-keygen -f ${i} -y > ${i}-pub
done

rm ./session-signing-key-pub

kubectl create secret generic concourse --from-file=.

cd -
rm -rf ${tmp_dir}
