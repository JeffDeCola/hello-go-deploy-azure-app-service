#!/bin/bash
# hello-go-deploy-azure-app-service set-pipeline.sh

fly -t ci set-pipeline -p hello-go-deploy-azure-app-service -c pipeline.yml --load-vars-from ../../../../../.credentials.yml
