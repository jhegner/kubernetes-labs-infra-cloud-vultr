#!/bin/bash

cd ../../

echo "--- Executando terraform validate e plan ---"

terraform validate && terraform plan -out=tfplan