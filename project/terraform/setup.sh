#!/bin/bash

export GOOGLE_APPLICATION_CREDENTIALS='/Users/mafalda.rodrigues/.gc/keys/my-creds.json'

echo $GOOGLE_APPLICATION_CREDENTIALS

terraform init

terraform plan

terraform apply