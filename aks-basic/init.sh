#!/bin/bash

echo "init"
terraform init

echo "plan"
terraform plan

echo "apply"
terraform apply

echo "destroy"
terraform destroy
