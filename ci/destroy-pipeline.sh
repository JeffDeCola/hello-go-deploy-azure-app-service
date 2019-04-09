#!/bin/bash
# hello-go-deploy-azure-app-service destroy-pipeline.sh

fly -t ci destroy-pipeline --pipeline hello-go-deploy-azure-app-service
