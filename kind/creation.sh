#!/bin/bash

kind create cluster --config cluster.yaml --name app
kind create cluster --config cluster.yaml --name ci-cd


# How multiple cluster works with kubeconfig
# How clusters in different vpc can communicate each other