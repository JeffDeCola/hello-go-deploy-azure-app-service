# hello-go-deploy-azure-app-service example-01 Dockerfile used to build docker image

# Multi-stage build to create a small docker image

#################################
# STAGE 1 build executable binary
#################################

FROM golang:alpine AS builder

# Install git
# Git is required for fetching the dependencies
RUN apk update && apk add --no-cache git

# SET WORKING DIRECTORY AND PLACE YOUR CODE IN
WORKDIR $GOPATH/src/github.com/jeffdecola/hello-go-deploy-azure-app-service/
COPY . .

# CHECK
RUN ls -lat $GOPATH/src/github.com/jeffdecola/hello-go-deploy-azure-app-service/

# Fetch dependencies using go get
RUN go get -u github.com/sirupsen/logrus
RUN go get -d -v

# Build the binary
RUN go build -o /go/bin/hello-go-deploy-azure-app-service main.go

###############################
# STAGE 2 build a smaller image
###############################

FROM alpine

# Add my name to it
LABEL maintainer="Jeff DeCola https://github.com/JeffDeCola/hello-go-deploy-azure-app-service"

# Put the binary from previous build into /app
RUN mkdir /app
COPY --from=builder /go/bin/hello-go-deploy-azure-app-service /app/hello-go-deploy-azure-app-service
WORKDIR /app

# Add the ailibty to /bin/bash in alpine
RUN apk add --update bash

# Run the binary
ENTRYPOINT ["/app/hello-go-deploy-azure-app-service"]
