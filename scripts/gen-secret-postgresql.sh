#!/usr/bin/env bash

tmp_dir=`mktemp -d secrets`
cd ${tmp_dir}
openssl rand -base64 24 > postgres-password

kubectl create secret generic concourse-postgresql --from-file=.

cd -
rm -rf ${tmp_dir}
