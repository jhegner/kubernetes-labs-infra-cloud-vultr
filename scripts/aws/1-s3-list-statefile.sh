#!/bin/bash

cd ../../

echo "--- Listando o arquivo terraform de estado da infra vultr ---"

aws s3 ls s3://kubernetes-labs-tf-backend-aws-s3bucket/lab/state/terraform-vultr-infra --recursive